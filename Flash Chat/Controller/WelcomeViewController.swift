//
//  WelcomeViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import CLTypingLabel

class WelcomeViewController: UIViewController {

    // Outlets
    @IBOutlet weak var titleLabel: CLTypingLabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        titleLabel.text = "⚡️FlashChat"
        
    }
    
//    func animateText(_ text: String) {
//
//        var charIndex = 0.0
//
//        for letter in text {
//
//            Timer.scheduledTimer(withTimeInterval: 0.1 * charIndex, repeats: false) { (_) in
//                self.titleLabel.text?.append(letter)
//            }
//
//            charIndex += 1
//        }
//
//    }

}
