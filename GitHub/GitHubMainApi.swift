//
//  GitHubMainApi.swift
//  GitHub
//
//  Created by admin on 5/11/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON



class MainGitHubApi {
    
    var IP = "https://api.github.com"
    var searchRepo = "/search/repositories"
    var User = "/users/"
    
    
    
     func Search_Repo(query : String, sort: String ,order : String , completionHandler:@escaping (Bool,JSON?,String) -> ()){
        
        let parameter = ["q":query,"sort":sort , "order" : order]
        
        let header: HTTPHeaders = [
            "Content-Type": "application/json"]
        
        let url = "\(IP)\(searchRepo)"
        print("Url == \(url)")
        
        
        Alamofire.request(url,method : .get ,  parameters: parameter, encoding: URLEncoding.default, headers: header).responseJSON{(response) in
            switch response.result{
            case .success(_):
                let swiftyJsonVar = JSON(response.result.value!)
                
                let status = swiftyJsonVar["status"].boolValue
                let statusCode = response.response?.statusCode
                print("swiftyjason = \(swiftyJsonVar)")
                print("Statuscode = \(statusCode!)")
                completionHandler(status, JSON(swiftyJsonVar),"Response Get")
                
            case .failure(let error):
                print("Response --\(error)")
                let statusCode = response.response?.statusCode
                print("error =\(error)")
                completionHandler(false, JSON(error),"\(error)")
            }
        }
        
        
    }
    
    
    func User_Repo(Userid : String , completionHandler:@escaping (Bool,JSON?,String) -> ()){
        
      
        
        let header: HTTPHeaders = [
            "Content-Type": "application/json"]
        
        let url = "\(IP)\(User)\(Userid)"
        print("Url == \(url)")
        
        
        Alamofire.request(url,method : .get , encoding: URLEncoding.default, headers: header).responseJSON{(response) in
            switch response.result{
            case .success(_):
                let swiftyJsonVar = JSON(response.result.value!)
                
                let status = swiftyJsonVar["status"].boolValue
                let statusCode = response.response?.statusCode
                print("swiftyjason = \(swiftyJsonVar)")
                print("Statuscode = \(statusCode!)")
                completionHandler(status, JSON(swiftyJsonVar),"Response Get")
                
            case .failure(let error):
                print("Response --\(error)")
                let statusCode = response.response?.statusCode
                print("error =\(error)")
                completionHandler(false, JSON(error),"\(error)")
            }
        }
        
        
    }
    
        
    
    
    func User_Repo_Search(Repo : String , completionHandler:@escaping (Bool,JSON?,String) -> ()){
        
        
        
        let header: HTTPHeaders = [
            "Content-Type": "application/json"]
        
        let url = "\(Repo)"
        print("Url == \(url)")
        
        
        Alamofire.request(url,method : .get , encoding: URLEncoding.default, headers: header).responseJSON{(response) in
            switch response.result{
            case .success(_):
                let swiftyJsonVar = JSON(response.result.value!)
                
                let status = swiftyJsonVar["status"].boolValue
                let statusCode = response.response?.statusCode
                print("swiftyjason = \(swiftyJsonVar)")
                print("Statuscode = \(statusCode!)")
                completionHandler(status, JSON(swiftyJsonVar),"Response Get")
                
            case .failure(let error):
                print("Response --\(error)")
                let statusCode = response.response?.statusCode
                print("error =\(error)")
                completionHandler(false, JSON(error),"\(error)")
            }
        }
        
        
    }
    
    
    
    
}
