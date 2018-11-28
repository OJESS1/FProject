//  ViewController.swift
//  FProject
//  Created by Jessica Owusu on 11/16/18.
//  Copyright © 2018 Jessica Owusu. All rights reserved.

import UIKit
import Firebase


class ViewController: UIViewController {
    
    //MARK: - IBOUTLETS
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    //MARK: - CLASS METHODS
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func loginTapped(_ sender: Any) {
        if let email = emailField.text, let password = passwordField.text {
            
            Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
                if let error = error {
                    print("Failed to log user in:", error)
                    return
                }
                
                self.view.window!.rootViewController?.dismiss(animated: true, completion: nil)
            }
        }
    }
}



