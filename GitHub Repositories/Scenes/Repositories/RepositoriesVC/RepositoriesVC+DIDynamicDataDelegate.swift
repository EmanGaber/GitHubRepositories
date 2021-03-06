//
//  RepositoriesVC+DIDynamicDataDelegate.swift
//  GitHub Repositories
//
//  Created by Eman Gaber on 12/4/20.
//

extension RepositoriesVC :DIDynamicDataDelegate
{

    func requestStart() {
        self.loading()
    }
    
    func requestEndDueToInternetError() {
        self.killLoading()
        
        self.showMessage(msg:"Internet Connection Not Available!", type: .notification)
        repoTableView.isHidden = true
    }
    
    
    func requestEndDue(toError error: Error!) {
        self.killLoading()
        self.showMessage(msg: error.localizedDescription, type: .notification)
        repoTableView.isHidden = true
        
    }
    
    
    func getRepositoriesFail(withResponse ErrorNum: String!) {
        self.killLoading()
        self.showMessage(msg: ErrorNum, type: .notification)
        
    }
    
    
    func getRepositoriesSucces(_ repositoryArray: NSMutableArray!, andTotalCount totalCount: String!){
        self.killLoading()
        
        print(repositoryArray.count)
        repoTableView.isHidden = false
        presenter.itemsCount = NSInteger(totalCount)!
        
        if presenter.repositorArray == nil {
            presenter.repositorArray = (repositoryArray as! [RepositoryModel])
        }else
        {
            presenter.repositorArray?.append(contentsOf: (repositoryArray as! [RepositoryModel]))
        }
        
        repoTableView.reloadData()
        
    }
    
}
