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
        guard let emailTextfield = emailTextfield.text, let passwordTextfield = passwordTextfield.text else { return }
        Auth.auth().signIn(withEmail: emailTextfield, password: passwordTextfield) { (user, error) in
            if error != nil {
                print(error!)
            } else {
                self.performSegue(withIdentifier: self.segueIdentifier, sender: nil)
            }
            
        }

    }
}  
