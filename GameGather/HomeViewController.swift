//
//  HomeViewController.swift
//  GameGather
//
//  Created by Uncia on 4/4/21.
//

import UIKit
import Parse
import AlamofireImage

class HomeViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var profileUserName: UILabel!
    
    
    @IBAction func onPickingPhoto(_ sender: Any) {
        
        let photoPicker = UIImagePickerController()
        //photoPicker.sourceType = .photoLibrary
        photoPicker.delegate = self
        photoPicker.allowsEditing = true
       
       
        photoPicker.sourceType = .photoLibrary
        
        
        self.present(photoPicker, animated: true, completion: nil)
                
    }
    
    
    let user = PFUser.current()!
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.editedImage] as! UIImage
        
        let size = CGSize(width: 300, height: 300)
        let scaledImage = image.af_imageAspectScaled(toFit: size)
        
        profileImage.image = scaledImage
        
        
        let imageData = profileImage.image?.pngData()
        let file = PFFileObject(data: imageData!)
        
        user["ProfileImage"] = file
        
        user.saveInBackground { (success, error) in
            if success {
                self.dismiss(animated: true, completion: nil)
                print("saved!")
                
            } else {
                print("error!")
            }
        }


    }
    //func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
       // guard var selectedImage = info[UIImagePickerController.InfoKey.originalImage.rawValue] as? UIImage else {
          //  fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        //}
     
        //picker.dismiss(animated: true, completion: nil)

   // }
    
    @IBAction func onLogout(_ sender: Any) {
        PFUser.logOut()
        
        let main = UIStoryboard(name: "Main", bundle: nil)
        let loginViewController = main.instantiateViewController(identifier: "LoginViewController")
        
        
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
            let delegate = windowScene.delegate as? SceneDelegate
          else {
            return
          }
        delegate.window?.rootViewController = loginViewController
        
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        profileUserName.text = user["username"] as! String
        
        let imagefile = user["ProfileImage"] as! PFFileObject
        let urlString = imagefile.url!
        let url = URL(string: urlString)!
        profileImage.af_setImage(withURL: url)
        

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
