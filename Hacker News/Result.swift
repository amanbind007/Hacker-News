//
//  Result.swift
//  Hacker News
//
//  Created by Aman Bind on 26/07/23.
//

import Foundation

struct Result : Codable {
    
    let hits : [Post]?
    
    
}

struct Post : Codable, Identifiable {
    
    var id : String {
        return objectID
    }
    
    var date_time : String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"//this your string date format
        dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?
        dateFormatter.locale = Locale(identifier: "en_US")
        let convertedDate = dateFormatter.date(from: created_at)

        guard dateFormatter.date(from: created_at) != nil else {
            assert(false, "no date from string")
            return ""
        }
        dateFormatter.dateFormat = "MMM d, YYYY, hh:mm a"///this is what you want to convert format
        dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?
        let timeStamp = dateFormatter.string(from: convertedDate!)
        
        
        
        return timeStamp
        
    }
    let objectID : String
    let title : String
    let author : String
    let points : Int
    let url : String?
    let created_at : String
    
}
