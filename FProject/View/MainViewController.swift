//
//  MainViewController.swift
//  FProject
//
//  Created by Jessica Owusu on 11/22/18.
//  Copyright © 2018 Jessica Owusu. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import Kingfisher

var mainRef: MainViewController?
class MainViewController: UIViewController {
    
//
//    @IBOutlet weak var currentUsername: UILabel!
//    @IBOutlet weak var currentuserAvatar: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkIfUserIsLoggedIn()
        mainRef = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        fetchUser()
    }
    
    func fetchUser(){
        guard let user = Auth.auth().currentUser else {return}
        
        Database.database().reference().child("users").child(user.uid).observeSingleEvent(of: .value, with: { (snapshot) in
            guard let userDictionary = snapshot.value as? [String:Any] else {return}
            
            let user = User(uid: user.uid, dictionary: userDictionary)
            print("\(user.username) just logged in!")
//            guard let url = URL(string: user.profileImageUrl) else {return}
//            let resource = ImageResource(downloadURL: url, cacheKey: user.uid)
//            self.currentuserAvatar.kf.setImage(with: resource)
//            self.currentUsername.text = user.username
            
        }) { (err) in
            print("Failed to fetch users: ", err)
        }
    }
    fileprivate func checkIfUserIsLoggedIn() {
        if Auth.auth().currentUser?.uid == nil {
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0) {
                self.handleLogout()
            }
        }
    }
    
    
    fileprivate func handleLogout(){
        do {
            try Auth.auth().signOut()
            performSegue(withIdentifier: "MainToLogin", sender: self)
            
        } catch let err {
            print("Failed to logout user: ", err)
        }
    }
    
    @IBAction func logoutButtonPressed(_ sender: UIButton) {
        do {
            try Auth.auth().signOut()
            performSegue(withIdentifier: "MainToLogin", sender: self)
            
        } catch let err {
            print("Failed to logout user: ", err)
        }
    }
    
}
