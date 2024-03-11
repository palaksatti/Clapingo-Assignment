//
//  Quote.swift
//  Clapingo Assignment
//
//  Created by Palak Satti on 11/03/24.
//

import Foundation

struct Quote: Codable {
    let content: String
    let tags: [String]
    
    var wordOfTheDay: String {
        tags[0] 
    }
}
