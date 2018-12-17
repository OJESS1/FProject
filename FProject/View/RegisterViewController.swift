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
    
    //MARK:- IBOUTLETS
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var userProfileImage: UIImageView!
    
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
    
    
    @IBAction func handleRegister(_ sender: UIButton) {
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
            
            let ref = Storage.storage().reference().child("avatars").child(uid)
            guard let selectedImage = self.userProfileImage.image else {return}
            guard let uploadData = selectedImage.jpegData(compressionQuality: 0.2) else {return}
            
            ref.putData(uploadData, metadata: nil, completion: { (metadata, err) in
                if let err = err {
                    print("Failed to upload user image to Firebase Storage",err)
                    return
                }
                
                ref.downloadURL(completion: { (url, err) in
                    if let err = err {
                        print("Failed to get user image download url",err)
                        return
                    }
                    
                    guard let userImageUrl = url?.absoluteString else {return}
                    // Structure user details
                    let dictionaryValues = ["email": email,
                                            "username": username,
                                            "profileImageUrl": userImageUrl ]
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
            })
        })
    }
    
    @IBAction func handleLogin(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
        
    }
}


extension RegisterViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBAction func handleUploadPhoto(_ sender: UIButton) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = false
        present(picker,animated: true,completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let selectedImage = info[.originalImage] as? UIImage else {fatalError("No Image instance")}
        
        userProfileImage.image = selectedImage
        
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
