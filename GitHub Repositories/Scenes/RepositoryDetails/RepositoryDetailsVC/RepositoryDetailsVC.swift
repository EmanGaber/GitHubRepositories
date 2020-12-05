//
//  RepositoryDetailsVC.swift
//  GitHub Repositories
//
//  Created by Eman Gaber on 11/30/20.
//

import UIKit

class RepositoryDetailsVC: BaseViewController {
    
    @IBOutlet weak var lblRepoName: UILabel!
    @IBOutlet weak var lblOwnerName: UILabel!
    @IBOutlet weak var lblDetails: UILabel!
    @IBOutlet weak var lblLanguages: UILabel!
    @IBOutlet weak var imgAvatar: UIImageView!

    var repo: RepositoryModel!
    
    //    var presenter: RepositoryDetailsPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //   presenter = RepositoryDetailsPresenter(view: self)
        setViewData()
    }
    
    func setViewData()
    {
      
        lblOwnerName.text = repo.repository_owner.owner_login
        lblRepoName.text = repo.repository_name
        lblLanguages.text = "swift"
        lblDetails.text = repo.repository_description
        
        guard let avatar = repo.repository_owner.owner_avatar_url  else {
            return
        }
        imgAvatar.load(url: URL.init(string: avatar)!)

    }
    @IBAction func backAction(_ sender: Any)     {
        self.dismiss(animated: true, completion: nil)
    }
    
}


