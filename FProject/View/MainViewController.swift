//
//  MainViewController.swift
//  FProject
//
//  Created by Jessica Owusu on 11/22/18.
//  Copyright © 2018 Jessica Owusu. All rights reserved.
//

import UIKit
import Firebase

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        checkIfUserIsLoggedIn()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        fetchUser()
    }
    
    func fetchUser(){
    
//        Database.database().reference().child("users").child(<#T##pathString: String##String#>)
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
            performSegue(withIdentifier: "MaintToLogin", sender: self)
            
        } catch let err {
            print("Failed to logout user: ", err)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
