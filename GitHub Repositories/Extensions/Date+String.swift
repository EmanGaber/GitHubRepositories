//
//  Date+String.swift
//  GitHub Repositories
//
//  Created by Eman Gaber on 12/4/20.
//

import Foundation
extension String {
    
    var date:Date {
        let dateformater = DateFormatter()
        dateformater.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        return dateformater.date(from: self)!
    }
}

