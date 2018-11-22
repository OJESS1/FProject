//
//  RegisterViewController.swift
//  FProject
//
//  Created by Jessica Owusu on 11/22/18.
//  Copyright © 2018 Jessica Owusu. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {
    
    //MARK:- IBOUTLETS
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var userProfileImage: UIImageView!
    
    //MARK:- CLASS METHODS
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }

    //MARK:- IBACTIONS

    
    
    @IBAction func handleRegister(_ sender: UIButton) {
    guard let email = emailField.text, let password = passwordField.text, let username = usernameField.text else {return}
    guard email.count > 0 && password.count > 0 else {print("Invalid field");return}
        
        
    
    
    Auth.auth().createUser(withEmail: email, password: password, completion: { user, error in
        guard let uid = user?.user.uid else {return}
        if let firebaseError = error {
           print(firebaseError.localizedDescription)
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
                })
                print ("Successfully registered: ",username)
                self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
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
