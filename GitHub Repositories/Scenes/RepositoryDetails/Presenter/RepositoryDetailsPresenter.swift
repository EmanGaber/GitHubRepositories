//
//  RepositoryDetailsPresenter.swift.swift
//  GitHub Repositories
//
//  Created by Eman Gaber on 8/26/20.
//  Copyright © 2020 Eman Gaber . All rights reserved.
//

import Foundation

protocol RepositoryDetailsView: class {
    
}

class RepositoryDetailsPresenter {
    
    private weak var view: RepositoryDetailsView?
    private let interactor = RepositoryDetailsInteractor()
    let handler = DIDataHandler.sharedInstance()

    
    init(view: RepositoryDetailsView?) {
        self.view = view
    }
    
  
    func callRepositoryDetailsApi(fullName:String, delegate:RepositoryDetailsVC){
        
        handler?.getRepositorDetails(withRepoFullName:fullName , with: delegate)
        
    }
    
   
}


