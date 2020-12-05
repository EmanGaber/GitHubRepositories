//
//  RepositoriesVC+PresenterDelegate.swift
//  GitHub Repositories
//
//  Created by Eman Gaber on 11/30/20.
//

import UIKit
extension RepositoriesVC: RepositoriesView {
      
    func openRepositoryDetailsVc(repository: RepositoryModel) {
        let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "RepositoryDetailsVC") as! RepositoryDetailsVC

        vc.repo = repository
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
   
    
    
}


