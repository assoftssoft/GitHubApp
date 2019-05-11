//
//  RepositryModelGit.swift
//  GitHub
//
//  Created by admin on 5/11/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation


class Owner {
    
    var gravatar_id = String()
    var url = String()
    var site_admin = Bool()
    var avatar_url = String()
    var repos_url = String()
    var organizations_url = String()
    var followers_url = String()
    var login = String()
    var gists_url = String()
    var received_events_url = String()
    var node_id = String()
    var id = String()
    var subscriptions_url = String()
    var following_url = String()
    var html_url = String()
    var type = String()
    var events_url = String()
    var starred_url = String()
    
    
    init(gravatar_id : String ,url : String ,site_admin : Bool , avatar_url : String , repos_url : String , organizations_url : String , followers_url : String ,  login : String , gists_url : String ,received_events_url : String  , node_id : String , id : String, subscriptions_url : String , following_url : String , html_url : String , type : String ,  events_url : String , starred_url : String ) {
  
        
        self.gravatar_id = gravatar_id
        self.url = url
        self.site_admin = site_admin
        self.avatar_url = avatar_url
        self.repos_url = repos_url
        self.organizations_url = organizations_url
        self.followers_url = followers_url
        self.login  = login
        self.gists_url = gists_url
        self.received_events_url = received_events_url
        self.node_id = node_id
        self.id = id
        self.subscriptions_url = subscriptions_url
        self.followers_url = followers_url
        self.html_url = html_url
        self.type = type
        self.events_url = events_url
        self.starred_url = starred_url
        
    }
    
}

class RepositryModelGit {
    
    var description = String()
    var forks_count = Int()
    var watchers = Int()
    var OwnerDetail = [Owner]()
    var name = String()
    
    init(description : String , forks_count : Int , watchers : Int , OwnerDetails : [Owner] , name : String) {
        
        self.description = description
        self.name = name
        self.forks_count = forks_count
        self.watchers = watchers
        self.OwnerDetail = OwnerDetails
        self.name = name
        
    }
    
    
    
 
    
}
