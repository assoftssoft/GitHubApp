//
//  RespositryCell.swift
//  GitHub
//
//  Created by admin on 5/11/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class RespositryCell: UITableViewCell {

    @IBOutlet weak var Avatar_Img: UIImageView!
    
    @IBOutlet weak var Repositry_Name: UILabel!
    
    @IBOutlet weak var Description: UILabel!
    
    @IBOutlet weak var NoForks: UILabel!
    
    
    @IBOutlet weak var Watchers: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
