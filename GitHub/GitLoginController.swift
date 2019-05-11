//
//  GitLoginController.swift
//  GitHub
//
//  Created by admin on 5/11/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

class GitLoginController: UIViewController {

    var MainGitHub = MainGitHubApi()
    
    @IBOutlet weak var GitUserName: SkyFloatingLabelTextField!
    @IBAction func LoginBtnAction(_ sender: Any) {
        
        
        if !GitUserName.text!.isEmpty {
            MainGitHub.User_Repo(Userid: GitUserName.text!) { (status, data, error) in
                
                
                let Userdata = data!
                
                let message = data!["message"].stringValue
                
                if message.contains("Not Found") {
                    
                    let AlertView = UIAlertController.init(title: "Error", message: message, preferredStyle: .alert)
                    
                    let alertaction = UIAlertAction.init(title: "OK", style: .cancel, handler: { (ok) in
                        
                    })
                    
                    AlertView.addAction(alertaction)
                    
                    self.present(AlertView, animated: true, completion: nil)
                    
                    
                }else {
                    
                
                
                let login = Userdata["login"].stringValue
                let created_at = Userdata["created_at"].stringValue
                let blog = Userdata["blog"].stringValue
                let following = Userdata["following"].stringValue
                let type = Userdata["type"].stringValue
                let site_admin = Userdata["site_admin"].boolValue
                let repos_url = Userdata["repos_url"].stringValue
                let avatar_url = Userdata["avatar_url"].stringValue
               
                let userdata = UserModel.init(login: login, created_at: created_at, blog: blog, following: following, type: type, site_admin: site_admin, repos_url: repos_url, avatar_url: avatar_url)
                
                let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
                let controller = storyboard.instantiateViewController(withIdentifier: "UserDetailsGit") as! UserDetailGit
                controller.UserDetails = userdata
                self.navigationController?.pushViewController(controller, animated: true)
                
                
                }
               
            }
        }
        
    }
    
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tap)

        // Do any additional setup after loading the view.
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
