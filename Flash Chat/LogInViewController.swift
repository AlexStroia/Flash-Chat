//
//  LogInViewController.swift
//  Flash Chat
//
//  This is the view controller where users login


import UIKit
import Firebase


class LogInViewController: UIViewController {
    let segueIdentifier = "goToChat"

    //Textfields pre-linked with IBOutlets
    @IBOutlet var emailTextfield: UITextField!
    @IBOutlet var passwordTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

   
    @IBAction func logInPressed(_ sender: AnyObject) {

        guard let emailText = emailTextfield.text, let passwordText = passwordTextfield.text else { return }
        //TODO: Log in the user
        Auth.auth().createUser(withEmail: emailText, password: passwordText) { (user, error) in
            if let error = error {
                print("An error has occured: ", error)
            } else {
                print("Succes!")
                self.performSegue(withIdentifier: self.segueIdentifier, sender: nil)
            }
        }
    }
}  
