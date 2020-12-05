//
//  RepositoriesPresenter.swift.swift
//  GitHub Repositories
//
//  Created by Eman Gaber on 8/26/20.
//  Copyright © 2020 Eman Gaber . All rights reserved.
//

import Foundation

protocol RepositoriesView: class {
    
    func OpenTeamDetailsVc(teamId:Int)
}

class RepositoriesPresenter {
    
    private weak var view: RepositoriesView?
    private let interactor = RepositoriesInteractor()
    var RepositorArray: [RepositoryModel]?
    
    var itemsCount = 0
    let handler = DIDataHandler.sharedInstance()
    
    init(view: RepositoriesView?) {
        self.view = view
    }
    
    func CallRepositoriesApi(quary:String, page:Int, pageSiza:Int , delegate:RepositoriesVC){
        
        handler?.searchRepositories(withQuary:quary , andPageNum: "\(page)", andPageSize: "\(pageSiza)", with:delegate)
        
    }
    func configureRepositoryCell(cell: RepositoriesTCell, for index: Int) {
        
        if RepositorArray?.count ?? 0 > 0 {
            let repo = RepositorArray?[index]
            
            guard let avatar = repo?.repository_owner.owner_avatar_url  else {
                return
            }
            cell.imgAvatar.load(url: URL.init(string: avatar)!)
            
            cell.lblRepoName.text = "Repository Name: \(repo?.repository_name ?? "")"
            cell.lblRepoOwner.text = "Repository Owner: \( repo?.repository_owner.owner_login ?? "")"
            
            let date = repo?.repository_created_at?.date.timeAgoSinceDate()
            cell.lblRepoDate.text = "Creation date: \(date ?? "")"
        }
    }
    
    func didSelectTeam(index: Int) {
        //        guard let teamId = teamsArray?[index].id else {
        //            return
        //        }
        //
        //        view?.OpenTeamDetailsVc(teamId: teamId)
        
    }
    
    
    
}


