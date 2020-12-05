//
//  File.swift
//  GitHub Repositories
//
//  Created by Eman Gaber on 12/5/20.
//

import Foundation
import UIKit

extension RepositoriesVC:UITextFieldDelegate
{
 
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        
        presenter.RepositorArray?.removeAll()
        page = 1
        quary = ""
        tableView.reloadData()
        
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        
        if Int(range.length) > 0 {
            
            // We're deleting
            
            var value: String
            if (textField.text?.count ?? 0) > 0 {
                value = (textField.text! as NSString?)?.substring(to: (textField.text?.count ?? 0) - 1) ?? ""
                
                quary = value
                
                if value == "" {
                   
                    presenter.RepositorArray?.removeAll()
                    self.tableView.reloadData()
                    page = 1
                    quary = ""
                    self.loadViewIfNeeded()
                }else if value.count > 1 {
                    presenter.callRepositoriesApi(quary: value, page: page, pageSiza: pageSize, delegate: self)
                    
                }
               
                
            } else {
                value = "-1"
                //no characters to delete... attempting to do so will result in a crash
            }
            
            if value.count == 0 {
                value = "-1"
            }
                        
            
        }
        else
        {
            // We're adding
            let value = "\(String(describing: textField.text!))\(string)"
            if value.count > 1 {
               
            print(value)
            quary = value
                presenter.callRepositoriesApi(quary: value, page: page, pageSiza: pageSize, delegate: self)
            }
            else
            {
                presenter.RepositorArray?.removeAll()
                page = 1
                quary = ""
                self.tableView.reloadData()

            }
        }
        
        
        return true
        
    }
    
    
}

