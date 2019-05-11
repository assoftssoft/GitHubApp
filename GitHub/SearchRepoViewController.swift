//
//  SearchRepoViewController.swift
//  GitHub
//
//  Created by admin on 5/11/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit
import SwiftyJSON
import SDWebImage


class SearchRepoViewController: UIViewController , UITableViewDelegate , UITableViewDataSource , UISearchBarDelegate {
    
    
    
  
    
    var MainAPiGit = MainGitHubApi()
    var ownerdetails = [Owner]()
    var RepositryModelGitData = [RepositryModelGit]()

    
    @IBOutlet weak var TabView: UITableView!
    
    @IBOutlet weak var Searchbar: UISearchBar!
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
      let search =   Searchbar.text
        
        
        self.RepositryModelGitData.removeAll()
        
        MainAPiGit.Search_Repo(query: search!, sort: "star", order: "desc") { (status, data, error) in
            
            let items = data!["items"]
            let incomplete_results = data!["incomplete_results"].boolValue
            
            let total_count = data!["total_count"].doubleValue
            
            if total_count > 0 {
                
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
                    self.ownerdetails.append(ownerdetaildata)
                    
                    
                    
                    
                    let description = item.1["description"].stringValue
                    
                    
                    let full_name = item.1["full_name"].stringValue
                    let forks_count = item.1["forks_count"].intValue
                    let watchers = item.1["watchers"].intValue
                    
                    let Respositry = RepositryModelGit.init(description: description, forks_count: forks_count, watchers: watchers, OwnerDetails: self.ownerdetails, name: full_name)
                    
                    self.RepositryModelGitData.append(Respositry)
                    
                    
                    
                    
                }
                self.TabView.reloadData()
            }else {
                self.RepositryModelGitData.removeAll()
                self.TabView.reloadData()
            }
            
            
        }
        

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TabView.delegate = self
        TabView.dataSource = self
    
        Searchbar.delegate = self
        
        
        let nib = UINib.init(nibName: "RepositryCell", bundle: nil)
        self.TabView.register(nib, forCellReuseIdentifier: "CellRepo")
        
        
        
      
        
        // Do any additional setup after loading the view.
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        print("Repo \(self.RepositryModelGitData.count)")
      return  self.RepositryModelGitData.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell :RespositryCell =  TabView.dequeueReusableCell(withIdentifier: "CellRepo", for: indexPath) as! RespositryCell
        let RepoData = self.RepositryModelGitData[indexPath.row]
        
        print("avatar Image = \(RepoData.OwnerDetail.last!.avatar_url)")
        
        print("description == \(RepoData.description)")
        
        cell.Description.text = RepoData.description
        cell.NoForks.text = String(describing: RepoData.forks_count)

        cell.Repositry_Name.text = RepoData.name
        cell.Watchers.text = String(describing: RepoData.watchers)

        cell.Avatar_Img.sd_setImage(with: URL(string: RepoData.OwnerDetail[indexPath.row].avatar_url), placeholderImage: UIImage(named: "placeholder"))
        
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.estimatedRowHeight
        
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
