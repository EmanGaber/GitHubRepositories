//
//  HTML+String.swift
//  GitHub Repositories
//
//  Created by Eman Gaber on 11/30/20.
//

import Foundation
import UIKit

extension String {
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return nil }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return nil
        }
    }
    
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
    
    
    
    var ColorName: UIColor? {
        switch self {
        case "Black" : return UIColor.black
        case "DarkGray" : return UIColor.darkGray
        case "LightGray" : return  UIColor.lightGray
        case "White": return UIColor.white
        case "Gray": return UIColor.gray
        case "Red": return UIColor.red
        case "Green": return UIColor.green
        case "Blue" : return UIColor.blue
        case "Cyan" : return UIColor.cyan
        case "Yellow" : return UIColor.yellow
        case "Magenta": return UIColor.magenta
        case "Orange" : return UIColor.orange
        case "Purple" : return UIColor.purple
        case "Brown" : return UIColor.brown
        default: return nil
        }
    }
    
    
}
