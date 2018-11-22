//  ViewController.swift
//  FProject
//  Created by Jessica Owusu on 11/16/18.
//  Copyright © 2018 Jessica Owusu. All rights reserved.

import UIKit
import FirebaseAuth


class ViewController: UIViewController {
  
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func createAccounTapped(_ sender: Any) {
    if let email = emailField.text, let password = passwordField.text {
        
        
    Auth.auth().createUser(withEmail: email, password: password, completion: { user, error in
        if let firebaseError = error {
        print(firebaseError.localizedDescription)
        return
        }
        print ("success!")
        })
        }
        
    }
    
    @IBAction func loginTapped(_ sender: Any) {
    if let email = emailField.text, let password = passwordField.text {
        
    Auth.auth().signIn(withEmail: email, password: password, completion: { user, error in
        if let firebaseError = error {
        print(firebaseError.localizedDescription)
        return
        }
        print ("success!")
                
        })
        }
    
    }
}


