//
//  RegisterViewController.swift
//  FProject
//
//  Created by Jessica Owusu on 11/22/18.
//  Copyright © 2018 Jessica Owusu. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class RegisterViewController: UIViewController {
    
    }






/*MARK:- IBOUTLETS
@IBOutlet weak var usernameField: UITextField!
@IBOutlet weak var emailField: UITextField!
@IBOutlet weak var passwordField: UITextField!

//MARK: - ALERTS
@IBOutlet weak var usernameAlert: UILabel!
@IBOutlet weak var emailAlert: UILabel!
@IBOutlet weak var passwordAlert: UILabel!

//MARK:- CLASS METHODS
override func viewDidLoad() {
    super.viewDidLoad()
    
    emailField.addTarget(self, action: #selector(handleInputChange), for: .editingChanged)
    usernameField.addTarget(self, action: #selector(handleInputChange), for: .editingChanged)
    passwordField.addTarget(self, action: #selector(handleInputChange), for: .editingChanged)
}

//MARK:- IBACTIONS

@objc func handleInputChange() {
    if usernameField.text?.count ?? 0 > 0 {
        usernameAlert.isHidden = true
    }
    if emailField.text?.count ?? 0 > 2 {
        emailAlert.isHidden = true
    }
    if passwordField.text?.count ?? 0 > 5 {
        passwordAlert.isHidden = true
    }
}


/*@IBAction func handleRegister(_ sender: UIButton) {
    if usernameField.text != "" && emailField.text != "" && passwordField.text?.count ?? 0 > 5 {
        registerUser()
    } else {
        if usernameField.text?.count ?? 0 < 1 {
            usernameAlert.isHidden = false
        } else if emailField.text?.count ?? 0 < 3 {
            emailAlert.isHidden = false
        } else if  passwordField.text?.count ?? 0 < 6 {
            passwordAlert.isHidden = false
        }
    }
}

func registerUser() {
    guard let email = emailField.text, let password = passwordField.text, let username = usernameField.text else {return}
    guard email.count > 0 && password.count > 0 else {print("Invalid field");return}
    
    Auth.auth().createUser(withEmail: email, password: password, completion: { (user, error) in
        
        guard let uid = user?.user.uid else {return}
        if let error = error {
            print("Failed to log user in:", error)
            return
        }
        
        // Structure user details
        let dictionaryValues = ["email": email,
                                "username": username ]
        let values = [uid:dictionaryValues]
        
        // Save user details to database
        Database.database().reference().child("users").updateChildValues(values, withCompletionBlock: { (err, ref) in
            if let err = err {
                print("Failed to save user information to database",err)
            }
            print ("Successfully registered: ",username)
            mainRef?.fetchUser()
            self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
        })
        
    })
    
    func handleLogin(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)*/

 */
