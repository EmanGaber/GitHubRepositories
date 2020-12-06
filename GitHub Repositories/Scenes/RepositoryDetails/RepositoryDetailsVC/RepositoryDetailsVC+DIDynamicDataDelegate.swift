//
//  ddd.swift
//  GitHub Repositories
//
//  Created by Eman Gaber on 12/5/20.
//

import Foundation

extension RepositoryDetailsVC:DIDynamicDataDelegate{

    
    func requestStart() {
        self.loading()
    }
    
    func requestEndDueToInternetError() {
        self.killLoading()
        self.showMessage(msg:"Internet Connection Not Available!", type: .notification)
    }

    
    func requestEndDue(toError error: Error!) {
        self.killLoading()
        self.showMessage(msg: error.localizedDescription, type: .notification)
        
    }
    
    
    func getRepositoriesFail(withResponse ErrorNum: String!) {
        self.killLoading()
        //self.showMessage(msg: ErrorNum, type: .notification)
        
    }
    
    func getRepositoryDetailsSucces(_ repositoryModel: RepositoryModel!) {
        self.killLoading()
        presenter.repo = repositoryModel
        
        setViewData()
    }
    
    func setViewData()
    {
        lblOwnerName.text = presenter.repo.repository_owner.owner_login
        lblRepoName.text = presenter.repo.repository_name
        lblLanguages.text = presenter.repo.repository_language
        lblDetails.text = presenter.repo.repository_description
        
        guard let avatar = presenter.repo.repository_owner.owner_avatar_url  else {
            return
        }
        imgAvatar.load(url: URL.init(string: avatar)!)
        
        let date = presenter.repo?.repository_created_at?.date.timeAgoSinceDate()
        lblRepoDate.text = "\(date ?? "")"
    }
}
