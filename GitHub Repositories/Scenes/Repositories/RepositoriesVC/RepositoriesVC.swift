//
//  RepositoriesVC.swift
//  GitHub Repositories
//
//  Created by Eman Gaber on 11/30/20.
//

import UIKit

class RepositoriesVC: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchTF: UITextField!

    var presenter: RepositoriesPresenter!
    var quary = ""
    var page = 1
    var pageSize = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

            searchTF.attributedPlaceholder = NSAttributedString(string: "repository name",
                                                                attributes: [NSAttributedString.Key.foregroundColor: UIColor.init(white: 1, alpha: 0.9)])
        
        
        setupTableView()
        presenter = RepositoriesPresenter(view: self)
        
        searchTF.delegate = self
        
    }
    
    
}


