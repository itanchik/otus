//
//  POPItem.swift
//  OTUSProject
//
//  Created by Tatyana Isakova on 11.05.2025.
//

import Foundation

struct POPItem: Codable, Hashable, Identifiable {
    var id = UUID()
    let nation: String
    let year: String
    let population: Int
    
    enum CodingKeys: String, CodingKey {
        case nation = "Nation"
        case year = "Year"
        case population = "Population"
    }
}
