//
//  Alert.swift
//  Flash Chat
//
//  Created by Philip Yu on 4/7/20.
//  Copyright © 2020 Angela Yu. All rights reserved.
//

import UIKit

protocol Alert {
    
}

extension Alert where Self: UIViewController {
    
    func displayAlert(msgTitle: String, message: String, alertTitle: String = "OK", style: UIAlertAction.Style = .default) {
        let alertController = UIAlertController(title: msgTitle, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: alertTitle, style: style)
        
        alertController.addAction(action)
        present(alertController, animated: true)
    }
    
}
