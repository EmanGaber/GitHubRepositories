//
//  RepositoriesVC+TableView.swift
//  GitHub Repositories
//
//  Created by Eman Gaber on 10/24/20.
//  Copyright © 2020 Eman Gaber. All rights reserved.
//

import UIKit

extension RepositoriesVC: UITableViewDataSource, UITableViewDelegate {
    
    func setupTableView() {
        repoTableView.dataSource = self
        repoTableView.delegate = self
        
        repoTableView.register(UINib(nibName: "RepositoriesTCell", bundle: nil), forCellReuseIdentifier: "RepositoriesTCell")
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.repositorArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 125
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "RepositoriesTCell", for: indexPath) as! RepositoriesTCell
        
        let bgColorView = UIView()
        bgColorView.backgroundColor = UIColor.clear
        cell.selectedBackgroundView = bgColorView
        
        presenter.configureRepositoryCell(cell: cell, for: indexPath.row)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        presenter.didSelectRepository(index: indexPath.row)
        
        
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let height = scrollView.frame.size.height
        let contentYoffset = scrollView.contentOffset.y
        let distanceFromBottom = scrollView.contentSize.height - contentYoffset
        if distanceFromBottom < height {
            print("you reached end of the table")
            
            if presenter.repositorArray != nil {
                page += 1
                self.callRepositoriesApi()
            
            }
            
        }
    }
    
    func callRepositoriesApi(){
        //call api
        presenter.callRepositoriesApi(query: query, page: page, pageSiza: pageSize, delegate: self)

    }
    
}

