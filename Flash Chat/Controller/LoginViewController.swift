//
//  LoginViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController, Alert {

    // MARK: - Outlets
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!

    // MARK: - IBAction Section
    
    @IBAction func loginPressed(_ sender: UIButton) {
    
        if let email = emailTextfield.text, let password = passwordTextfield.text {
            // Check if user has entered an email
            if email.isEmpty {
                displayAlert(msgTitle: "Email is Required", message: "Please enter your email address.")
            }
            
            // Check if user has entered a password
            if password.isEmpty {
                displayAlert(msgTitle: "Password is Required", message: "Please enter your password.")
            }
            
            Auth.auth().signIn(withEmail: email, password: password) { (_, error) in
                if let e = error {
                    if e.localizedDescription == "The email address is badly formatted." {
                        self.displayAlert(msgTitle: "Invalid Email", message: "Please enter a valid email")
                    } else if e.localizedDescription == "The password must be 6 characters long or more." {
                        self.displayAlert(msgTitle: "Invalid Password", message: e.localizedDescription)
                    } else {
                        self.displayAlert(msgTitle: "Error", message: e.localizedDescription)
                    }
                    
                    print(e.localizedDescription)
                } else {
                    // Navigate to ChatViewController
                    print("Successfully logged into: \(email)")
                    self.performSegue(withIdentifier: K.loginSegue, sender: self)
                }
            }
        }
        
    }
    
}
