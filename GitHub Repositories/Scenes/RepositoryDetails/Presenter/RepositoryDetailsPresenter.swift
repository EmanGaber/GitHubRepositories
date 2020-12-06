//
//  RepositoryDetailsPresenter.swift.swift
//  GitHub Repositories
//
//  Created by Eman Gaber on 8/26/20.
//  Copyright © 2020 Eman Gaber . All rights reserved.
//

import Foundation
import UIKit

protocol RepositoryDetailsView: class {
    
}

class RepositoryDetailsPresenter {
    
    private weak var view: RepositoryDetailsView?
    private let interactor = RepositoryDetailsInteractor()
    let handler = DIDataHandler.sharedInstance()
    var repo: RepositoryModel!

    
    init(view: RepositoryDetailsView?) {
        self.view = view
    }
    

    func callRepositoryDetailsApi(fullName:String, delegate:DIDynamicDataDelegate){
        
        handler?.getRepositorDetails(withRepoFullName:fullName , with: delegate)
        
    }
    
    func openProjectUrl()
    {
        let projectUrl = repo.repository_html_url!
        openUrl(scheme: projectUrl)

    }
    
    func openUserProfile()
    {
        let userUrl =
            repo.repository_owner.owner_html_url!
        
        openUrl(scheme: userUrl)
        
    }
    
    func openCommits() {
        
        guard let fullName = repo.repository_full_name else {
            return
        }
        let projectTreeUrl = "https://github.com/\(fullName)/commits"
        openUrl(scheme: projectTreeUrl)
    }
    
    
    func openUrl(scheme: String) {
    if let url = URL(string: scheme) {
       if #available(iOS 10, *) {
          UIApplication.shared.open(url, options: [:],
            completionHandler: {
                (success) in
                   print("Open \(scheme): \(success)")
            })
      } else {
          let success = UIApplication.shared.openURL(url)
          print("Open \(scheme): \(success)")
      }
    }
  }
   
}


