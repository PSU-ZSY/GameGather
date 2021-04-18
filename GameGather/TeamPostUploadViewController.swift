//
//  TeamPostUploadViewController.swift
//  GameGather
//
//  Created by Uncia on 4/17/21.
//

import UIKit
import Parse
import AlamofireImage

class TeamPostUploadViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    @IBOutlet weak var PostImageView: UIImageView!
    @IBAction func UploadButton(_ sender: Any) {
        let photoPicker = UIImagePickerController()
        //photoPicker.sourceType = .photoLibrary
        photoPicker.delegate = self
        photoPicker.allowsEditing = true
       
       
        photoPicker.sourceType = .photoLibrary
        
        
        self.present(photoPicker, animated: true, completion: nil)
    }
    @IBAction func CameraButton(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        

        picker.sourceType = .camera
        
        
        present(picker, animated: true, completion: nil)
    }
    @IBOutlet weak var DescriptionField: UITextField!
    @IBAction func SubmitButton(_ sender: Any) {
        let post = PFObject(className: "TeamPosts")
        
        post["description"] = DescriptionField.text!
        post["author"] = PFUser.current()!
        
        let imageData = PostImageView.image?.pngData()
        let file = PFFileObject(data: imageData!)
        
        post["image"] = file
        
        post.saveInBackground { (success, error) in
            if success {
                self.dismiss(animated: true, completion: nil)
                print("saved!")
                
            } else {
                print("error!")
            }
        }
    }
    @IBOutlet weak var HintLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()

        // Do any additional setup after loading the view.
    }
    

    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.editedImage] as! UIImage
        
        let size = CGSize(width: 300, height: 300)
        let scaledImage = image.af_imageAspectScaled(toFit: size)
        
        PostImageView.image = scaledImage
        
        dismiss(animated: true, completion: nil)
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
