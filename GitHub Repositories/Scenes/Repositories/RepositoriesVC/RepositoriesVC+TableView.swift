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
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(UINib(nibName: "RepositoriesTCell", bundle: nil), forCellReuseIdentifier: "RepositoriesTCell")
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.RepositorArray?.count ?? 0
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
        
        presenter.didSelectTeam(index: indexPath.row)
        
        
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let height = scrollView.frame.size.height
        let contentYoffset = scrollView.contentOffset.y
        let distanceFromBottom = scrollView.contentSize.height - contentYoffset
        if distanceFromBottom < height {
            print(" you reached end of the table")
            
                page += 1
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                // your code here
                self.CallRepositoriesApi()
            }
               
            
        }
    }
    
    
}

