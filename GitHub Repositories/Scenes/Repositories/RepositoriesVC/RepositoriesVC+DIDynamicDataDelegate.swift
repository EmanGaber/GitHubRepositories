//
//  RepositoriesVC+DIDynamicDataDelegate.swift
//  GitHub Repositories
//
//  Created by Eman Gaber on 12/4/20.
//

extension RepositoriesVC :DIDynamicDataDelegate
{
    func getRepositoriesSucces(_ repositoryArray: NSMutableArray!, andTotalCount totalCount: String!){
        self.killLoading()
        
        print(repositoryArray.count)
        tableView.isHidden = false
        presenter.itemsCount = NSInteger(totalCount)!
        
        if presenter.RepositorArray == nil {
            presenter.RepositorArray = (repositoryArray as! [RepositoryModel])
        }else
        {
            presenter.RepositorArray?.append(contentsOf: (repositoryArray as! [RepositoryModel]))
        }
        
        tableView.reloadData()
        
    }
    
    
    func requestStart() {
        self.loading()
    }
    
    func requestEndDueToInternetError() {
        self.killLoading()
        
        self.showMessage(msg:"Internet Connection Not Available!", type: .notification)
        tableView.isHidden = true
    }
    
    
    func requestEndDue(toError error: Error!) {
        self.killLoading()
        self.showMessage(msg: error.localizedDescription, type: .notification)
        tableView.isHidden = true
        
    }
    
    
    func getRepositoriesFail(withResponse ErrorNum: String!) {
        self.killLoading()
        //self.showMessage(msg: ErrorNum, type: .notification)
        
    }
    
}
