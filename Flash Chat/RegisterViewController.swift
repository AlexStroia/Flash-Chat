//
//  RegisterViewController.swift
//  Flash Chat
//
//  This is the View Controller which registers new users with Firebase
//

import UIKit
import Firebase
import SVProgressHUD


class RegisterViewController: UIViewController {
    let segueIdentifier = "goToChat"
    
    //Pre-linked IBOutlets

    @IBOutlet var emailTextfield: UITextField!
    @IBOutlet var passwordTextfield: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

  
    @IBAction func registerPressed(_ sender: AnyObject) {
        SVProgressHUD.show()
        //TODO: Set up a new user on our Firbase database
        guard let emailText = emailTextfield.text, let passwordText = passwordTextfield.text else { return }
        //TODO: Log in the user
        Auth.auth().createUser(withEmail: emailText, password: passwordText) { (user, error) in
            if let error = error {
                SVProgressHUD.dismiss()
                print("An error has occured: ", error)
            } else {
                print("Succes!")
                SVProgressHUD.dismiss()
                self.performSegue(withIdentifier: self.segueIdentifier, sender: nil)
            }
        }
    } 
}
