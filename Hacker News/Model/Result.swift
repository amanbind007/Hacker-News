//
//  Result.swift
//  Hacker News
//
//  Created by Aman Bind on 26/07/23.
//

import Foundation

struct Result: Codable {
    let hits: [Post]?
}

struct Post: Codable, Identifiable {
    var id: String {
        return objectID
    }

    var date_time: String {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"

        guard let date = inputFormatter.date(from: created_at) else {
            return "" // Unable to parse the input date string
        }

        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "dd MMM, 'at' h:mm a"
        outputFormatter.locale = Locale(identifier: "en_US_POSIX")
        outputFormatter.timeZone = TimeZone(identifier: "Asia/Kolkata")

        print(outputFormatter.string(from: date).description)

        return outputFormatter.string(from: date)
    }

    let objectID: String
    let title: String
    let author: String
    let points: Int
    let url: String?
    let created_at: String
}
