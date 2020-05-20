//
//  WelcomeViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import CLTypingLabel
import Firebase

class WelcomeViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var titleLabel: CLTypingLabel!
    
    // MARK: - Properties
    var handle: AuthStateDidChangeListenerHandle?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        titleLabel.text = K.appName
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        navigationController?.isNavigationBarHidden = true
        
        // Check if there is a existing user in this session
        authenticateUser()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        super.viewWillDisappear(animated)
        
        navigationController?.isNavigationBarHidden = false
     
        Auth.auth().removeStateDidChangeListener(handle!)
        
    }
    
    // MARK: - Private Function Section
    
    private func authenticateUser() {

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        var controller: UIViewController!
        
        handle = Auth.auth().addStateDidChangeListener({ (_, user) in
            if user != nil {
                // User exists
                print("User exists!")
                controller = storyboard.instantiateViewController(identifier: "ChatViewController")
                self.navigationController?.pushViewController(controller, animated: false)
            } else {
                // User does NOT exist!
                print("There is no user that is authenticated in this session.")
            }
        })

    }

}
