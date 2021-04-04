//
//  SignUpViewController.swift
//  GameGather
//
//  Created by Uncia on 4/4/21.
//

import UIKit
import Parse

class SignUpViewController: UIViewController {
    
    
    @IBOutlet weak var birthdayField: UITextField!
    
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var CusernameField: UITextField!
    
    @IBOutlet weak var CpasswordField: UITextField!
 
    @IBAction func CancelSignUp(_ sender: Any) {
    }
    
    
    @IBAction func onSignUpButton(_ sender: Any) {
        let user = PFUser()
        user.username = CusernameField.text
        user.password = CpasswordField.text
        user.email = emailField.text
        user["birthday"] = birthdayField.text
        
        
        user.signUpInBackground { (success, error) in
            if success {
                self.performSegue(withIdentifier: "BackToLogin", sender: nil)
            } else{
                print("Error: \(error?.localizedDescription)")
            }
        }

        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
