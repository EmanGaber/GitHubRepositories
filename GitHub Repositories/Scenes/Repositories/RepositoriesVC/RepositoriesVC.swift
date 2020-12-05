//
//  RepositoriesVC.swift
//  GitHub Repositories
//
//  Created by Eman Gaber on 11/30/20.
//

import UIKit

class RepositoriesVC: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var btnTryConnect: UIButton!
    var presenter: RepositoriesPresenter!
    let handler = DIDataHandler.sharedInstance()
    var quary = "Hellow"
    var page = 1
    var pageSiza = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        presenter = RepositoriesPresenter(view: self)
        
        btnTryConnect.isHidden = true
        CallRepositoriesApi()
        
        
    }
    
    
    func CallRepositoriesApi(){
        //call api
        
        handler?.searchRepositories(withQuary:quary , andPageNum: "\(page)", andPageSize: "\(pageSiza)", with:self)
    }
    
    
    @IBAction func TryConnect()
    {
        CallRepositoriesApi()
    }
    
    
}


