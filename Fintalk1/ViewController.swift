//
//  ViewController.swift
//  Fintalk1
//
//  Created by Erik Andersen on 6/14/16.
//  Copyright © 2016 The Andersen Family Press. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: IBOutlets
    
    @IBOutlet private weak var usernameField: UITextField!
    
    @IBOutlet private weak var passwordField: UITextField!
    
    @IBOutlet private weak var loginButton: UIButton! {
        didSet {
            self.loginButton.enabled = false
        }
    }

    // MARK: IBActions
    
    @IBAction private func textChanged(sender: UITextField) {
        
        let usernameIsEmpty = self.usernameField.text?.isEmpty ?? true
        let passwordIsEmpty = self.passwordField.text?.isEmpty ?? true
        
        self.loginButton.enabled = !usernameIsEmpty && !passwordIsEmpty
    }
    
    @IBAction private func loginButtonTapped(sender: UIButton) {
        
        let userService = UserService()
        
        userService.login(usernameField.text!, password: passwordField.text!) { [weak self] (error, user) in
            
            let alertTitle = error == nil ? "Success!" : "Uh oh!"
            let alertMessage = error == nil ? "Your id is \(user!.id!)" : error
            let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .Alert)
            let action = UIAlertAction(title: "Dismiss", style: .Default, handler: nil)
            
            alert.addAction(action)

            if let this = self {
                this.presentViewController(alert, animated: true, completion: nil)
            }
        }
    }
}

