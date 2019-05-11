//
//  UserModel.swift
//  GitHub
//
//  Created by admin on 5/11/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation

class UserModel {
    
    var login = String()
    var created_at = String()
    var blog = String()
    var following = String()
    var type = String()
    var site_admin = Bool()
    var repos_url = String()
    var avatar_url = String()
    
    init(login : String , created_at : String , blog : String , following : String , type : String , site_admin : Bool , repos_url : String , avatar_url : String) {
        
        self.login = login
        self.created_at = created_at
        self.blog = blog
        self.following = following
        self.type = type
        self.site_admin = site_admin
        self.repos_url = repos_url
        self.avatar_url = avatar_url
        
    }
    
}
