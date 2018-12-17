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
    
    
    @IBOutlet weak var errorMessage: UILabel!
    //MARK: - CLASS METHODS
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordField.addTarget(self, action: #selector(handleInputChange), for: .editingChanged)
//        handleInputChange()
    }
    
    @objc func handleInputChange() {
        if passwordField.text?.count ?? 0 > 0 {
            errorMessage.isHidden = true
        }
    }
    
    @IBAction func loginTapped(_ sender: Any) {
        if let email = emailField.text, let password = passwordField.text {
            if email == "" && password == "" {
                errorMessage.text = "YOU DID NOT JBDEHDIEW"
                errorMessage.isHidden = false
            }
            Auth.auth().signIn(withEmail: email, password: password)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             { (user, error) in
                if let error = error {
                    print("Failed to log user in:", error)
                    self.errorMessage.isHidden = false
                    self.passwordField.text = ""
                    return
                }
                
                self.errorMessage.isHidden ? true : true
                self.view.window!.rootViewController?.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    
}



