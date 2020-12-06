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
        presenter.openUserProfile()
    }
    
    @IBAction func openProjectUrl(_ sender: Any) {
        presenter.openProjectUrl()
    }
    
    @IBAction func openCommits(_ sender: Any) {
        
        presenter.openCommits()
      
    }
    
    
}


