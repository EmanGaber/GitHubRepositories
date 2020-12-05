//
//  CustomeDateFormate+Date.swift
//  GitHub Repositories
//
//  Created by Eman Gaber on 12/4/20.
//

import Foundation

extension Date {
    func timeAgoSinceDate() -> String {
        
        // From Time
        let fromDate = self
        
        // To Time
        let toDate = Date()
        
        // Estimation
        // Year
        if let interval = Calendar.current.dateComponents([.year], from: fromDate, to: toDate).year, interval > 0  {
            
            return interval == 1 ? "\(interval)" + " " + "year ago" : "\(interval)" + " " + "years ago"
        }
        
        // Month
        if let interval = Calendar.current.dateComponents([.month], from: fromDate, to: toDate).month, interval > 0  {
            
            if interval > 6 {
                return interval == 1 ? "\(interval)" + " " + "month ago" : "\(interval)" + " " + "months ago"
            }
            else
            {
                return convertDateFormater(date:"\(fromDate)")
                
            }
        }
        
        // Day
        if let interval = Calendar.current.dateComponents([.day], from: fromDate, to: toDate).day, interval > 0  {
            
            
            return convertDateFormater(date:"\(fromDate)")
        }
        
        // Hours
        if let interval = Calendar.current.dateComponents([.hour], from: fromDate, to: toDate).hour, interval > 0 {
            
            return convertDateFormater(date:"\(fromDate)")

        }
        
        // Minute
        if let interval = Calendar.current.dateComponents([.minute], from: fromDate, to: toDate).minute, interval > 0 {
            
            return convertDateFormater(date:"\(fromDate)")

        }
        
        return "a moment ago"
    }
    
    
    func convertDateFormater(date: String) -> String
        {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss z"
            let date = dateFormatter.date(from: date)
            dateFormatter.dateFormat = "EEEE, MMM d, yyyy"
        print(dateFormatter.string(from: date!))
            return  dateFormatter.string(from: date!)

        }
}
