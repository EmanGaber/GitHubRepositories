//
//  RepositoryDetailsVC.swift
//  GitHub Repositories
//
//  Created by Eman Gaber on 11/30/20.
//

import UIKit

class RepositoryDetailsVC: BaseViewController {
    
    @IBOutlet weak var lblRepoName: UILabel!
    @IBOutlet weak var lblRepoDate: UILabel!
    @IBOutlet weak var lblOwnerName: UILabel!
    @IBOutlet weak var lblDetails: UILabel!
    @IBOutlet weak var lblLanguages: UILabel!
    @IBOutlet weak var imgAvatar: UIImageView!
    
    var repo: RepositoryModel!
    var repoFullName = ""
    var presenter: RepositoryDetailsPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = RepositoryDetailsPresenter(view: self)
        presenter.callRepositoryDetailsApi(fullName:repoFullName , delegate: self)
        
        
    }
    
    
    @IBAction func backAction(_ sender: Any)     {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func openUserProfile(_ sender: Any) {
        let userUrl = repo.repository_owner.owner_html_url!

        openUrl(scheme: userUrl)
    }
    
    @IBAction func openProjectUrl(_ sender: Any) {
    
        let projectUrl = repo.repository_html_url!
        openUrl(scheme: projectUrl)
    }
    
    
    @IBAction func openCommits(_ sender: Any) {
        
        guard let fullName = repo.repository_full_name else {
            return
        }
        let projectTreeUrl = "https://github.com/\(fullName)/commits"
        openUrl(scheme: projectTreeUrl)
    }
    
    
}


