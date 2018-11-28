//
//  User.swift
//  FProject
//
//  Created by Laila on 28/11/2018.
//  Copyright © 2018 Jessica Owusu. All rights reserved.
//

import UIKit

struct User {
    let uid: String
    let username: String
    let profileImageUrl: String
    let email: String
    
    init(uid:String, dictionary:[String:Any]) {
        self.uid = uid
        self.username = dictionary["username"] as? String ?? ""
        self.profileImageUrl = dictionary["profileImageUrl"] as? String ?? ""
        self.email = dictionary["email"] as? String ?? ""
    }
}
