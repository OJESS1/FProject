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
    
    @IBAction func handleCreateAccount(_ sender: UIButton) {
//                guard let email = emailField.text, let password = passwordField.text else {return}
//                guard email.count > 0 && password.count > 0 else {print("Invalid field");return}
////                guard let uid = Auth.auth().currentUser else {return}
//        
//        
//            Auth.auth().createUser(withEmail: email, password: password, completion: { user, error in
//                if let firebaseError = error {
//                   print(firebaseError.localizedDescription)
//                return
//                }
//                
//                // Structure user details
//                let dictionaryValues = ["email": email]
//                let values = ["user":dictionaryValues]
//        
//                // Save user details to database
//                Database.database().reference().child("users").updateChildValues(values, withCompletionBlock: { (err, ref) in
//                    if let err = err {
//                        print("Failed to save user information to database",err)
//                    }
//                })
//                print ("success!")
//                })
    }
    @IBAction func createAccounTapped(_ sender: UIButton) {
//        guard let email = emailField.text, let password = passwordField.text else {return}
//        guard email.count > 0 && password.count > 0 else {print("Invalid field");return}
//        guard let uid = Auth.auth().currentUser else {return}

    
//    Auth.auth().createUser(withEmail: email, password: password, completion: { user, error in
//        if let firebaseError = error {
////           print("err") print(firebaseError.localizedDescription)
//        return
//        }
//        // Structure user details
//        let dictionaryValues = ["email": email]
//        let values = [uid:dictionaryValues]
//        
//        // Save user details to database
//        Database.database().reference().child("users").updateChildValues(values, withCompletionBlock: { (err, ref) in
//            if let err = err {
//                print("Failed to save user information to database")
//            }
//        })
//        print ("success!")
//        })
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


