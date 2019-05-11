//
//  UserRepoTableview.swift
//  GitHub
//
//  Created by admin on 5/11/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class UserRepoTableview: UIViewController , UITableViewDelegate , UITableViewDataSource {
   
    
    
    
    

    @IBOutlet weak var TabView: UITableView!
    
    
    var RepoGitModel : [RepositryModelGit]?
    
   @objc  func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TabView.delegate = self
        TabView.dataSource = self
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tap)
        
        let nib = UINib.init(nibName: "RepositryCell", bundle: nil)
        self.TabView.register(nib, forCellReuseIdentifier: "CellRepo")

        
        // Do any additional setup after loading the view.
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        print("Repo \(self.RepoGitModel!.count)")
        return  self.RepoGitModel!.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell :RespositryCell =  TabView.dequeueReusableCell(withIdentifier: "CellRepo", for: indexPath) as! RespositryCell
        let RepoData = self.RepoGitModel![indexPath.row]
        
        print("avatar Image = \(RepoData.OwnerDetail.last!.avatar_url)")
        
        print("description == \(RepoData.description)")
        
        cell.Description.text = RepoData.description
        cell.NoForks.text = String(describing: RepoData.forks_count)
        
        cell.Repositry_Name.text = RepoData.name
        cell.Watchers.text = String(describing: RepoData.watchers)
        
        cell.Avatar_Img.sd_setImage(with: URL(string: RepoData.OwnerDetail[indexPath.row].avatar_url), placeholderImage: UIImage(named: "placeholder"))
        
        return cell
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
