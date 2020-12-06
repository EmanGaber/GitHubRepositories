//
//  RepositoriesPresenter.swift.swift
//  GitHub Repositories
//
//  Created by Eman Gaber on 8/26/20.
//  Copyright © 2020 Eman Gaber . All rights reserved.
//

import Foundation

protocol RepositoriesView: class {
    
    func openRepositoryDetailsVc(repository:RepositoryModel)
}

class RepositoriesPresenter {
    
    private weak var view: RepositoriesView?
    private let interactor = RepositoriesInteractor()
    var repositorArray: [RepositoryModel]?
    
    var itemsCount = 0
    let handler = DIDataHandler.sharedInstance()
    
    init(view: RepositoriesView?) {
        self.view = view
    }
    
    func callRepositoriesApi(query:String, page:Int, pageSiza:Int , delegate:DIDynamicDataDelegate){
        
        handler?.searchRepositories(withQuery:query , andPageNum: "\(page)", andPageSize: "\(pageSiza)", with:delegate)
        
    }
    
    func configureRepositoryCell(cell: RepositoriesTCell, for index: Int) {
        
        if repositorArray?.count ?? 0 > 0 {
            let repo = repositorArray?[index]
            
            guard let avatar = repo?.repository_owner.owner_avatar_url  else {
                return
            }
            cell.imgAvatar.load(url: URL.init(string: avatar)!)
            
            cell.lblRepoName.text = "Repository Name: \(repo?.repository_name ?? "")"
            cell.lblRepoOwner.text = "Repository Owner: \( repo?.repository_owner.owner_login ?? "")"
            
            let date = getRepoCreationDateFrom(date: repo?.repository_created_at ?? "")
            
            cell.lblRepoDate.text = "Creation date: \(date)"
        }
    }
    
    func getRepoCreationDateFrom(date:String) -> String
    {
        return date.date.timeAgoSinceDate()
    }
    
    func didSelectRepository(index: Int) {
        if repositorArray?.count ?? 0 > 0
        {
            guard let repo = repositorArray?[index] else {
                return
            }
            
            view?.openRepositoryDetailsVc(repository: repo)
        }
    }
    
    
    
}


