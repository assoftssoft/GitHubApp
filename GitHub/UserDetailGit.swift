//
//  UserDetailGit.swift
//  GitHub
//
//  Created by admin on 5/11/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit
import SDWebImage


class UserDetailGit: UIViewController {
    
    
    var UserDetails : UserModel?
    var MainGitApi = MainGitHubApi()
    var Owners = [Owner]()
    var RepositryModelGitData = [RepositryModelGit]()

    @IBOutlet weak var Avatar_img: UIImageView!
    
    
    @IBOutlet weak var Followerstxt: UILabel!
    
    @IBOutlet weak var TypeTxt: UILabel!
    
    
    @IBOutlet weak var Site_Admin: UISwitch!
    
    @IBOutlet weak var Logintxt: UILabel!
    
    
    
    @IBAction func ShowRepoAction(_ sender: Any) {
        
    
        MainGitApi.User_Repo_Search(Repo: UserDetails!.repos_url) { (status, data, error) in
            
            let items = data!
           
            
          
                
                for item in items {
                    let owners = item.1["owner"]
                    
                    let gravatar_id = owners["gravatar_id"].stringValue
                    let avatar_url = owners["avatar_url"].stringValue
                    let url = owners["url"].stringValue
                    let site_admin = owners["site_admin"].boolValue
                    let repos_url = owners["repos_url"].stringValue
                    let organizations_url = owners["organizations_url"].stringValue
                    let followers_url = owners["followers_url"].stringValue
                    let login = owners["login"].stringValue
                    let gists_url = owners["gists_url"].stringValue
                    let received_events_url = owners["received_events_url"].stringValue
                    let node_id = owners["node_id"].stringValue
                    let id = owners["id"].stringValue
                    let subscriptions_url = owners["subscriptions_url"].stringValue
                    let following_url = owners["following_url"].stringValue
                    let html_url = owners["html_url"].stringValue
                    let type = owners["type"].stringValue
                    let events_url = owners["events_url"].stringValue
                    let starred_url = owners["starred_url"].stringValue
                    
                    print("avatar url == \(avatar_url)")
                    
                    let ownerdetaildata = Owner.init(gravatar_id: gravatar_id, url: url, site_admin: site_admin, avatar_url: avatar_url, repos_url: repos_url, organizations_url: organizations_url, followers_url: followers_url, login: login, gists_url: gists_url, received_events_url: received_events_url, node_id: node_id, id: id, subscriptions_url: subscriptions_url, following_url: following_url, html_url: html_url, type: type, events_url: events_url, starred_url: starred_url)
                    self.Owners.append(ownerdetaildata)
                    
                    
                    
                    
                    let description = item.1["description"].stringValue
                    
                    
                    let full_name = item.1["full_name"].stringValue
                    let forks_count = item.1["forks_count"].intValue
                    let watchers = item.1["watchers"].intValue
                    
                    let Respositry = RepositryModelGit.init(description: description, forks_count: forks_count, watchers: watchers, OwnerDetails: self.Owners, name: full_name)
                    
                    self.RepositryModelGitData.append(Respositry)
                    
                    
                    
                    
                    
                }
            
           
            
            let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "UserRepoTabView") as! UserRepoTableview
            controller.RepoGitModel = self.RepositryModelGitData
            
            self.navigationController?.pushViewController(controller, animated: true)
            
            
            
        }
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Avatar_img.sd_setImage(with: URL(string: UserDetails!.avatar_url), placeholderImage: UIImage(named: "placeholder"))
        
        Logintxt.text = UserDetails!.login
        Followerstxt.text = UserDetails!.following
        TypeTxt.text = UserDetails!.type
        Site_Admin.isOn = UserDetails!.site_admin
        
        

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
