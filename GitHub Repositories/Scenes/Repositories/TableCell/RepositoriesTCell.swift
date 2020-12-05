//
//  RepositoriesTCell.swift
//  GitHub Repositories
//
//  Created by Eman Gaber on 12/1/20.
//  Copyright © 2020 Eman Gaber. All rights reserved.
//

import UIKit

class RepositoriesTCell: UITableViewCell {

    @IBOutlet weak var lblRepoName : UILabel!
    @IBOutlet weak var lblRepoOwner : UILabel!
    @IBOutlet weak var imgAvatar: UIImageView!
    @IBOutlet weak var lblRepoDate : UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

   
}
