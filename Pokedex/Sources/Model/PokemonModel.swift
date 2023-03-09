//
//  Pokemon.swift
//  Pokedex
//
//  Created by Ana Paula Lesniovski dos Santos on 22/02/23.
//

import Foundation

struct Pokemon: Decodable {
    let count: Int
    let next: String
    let previous: String?
    let results: [Results]
    
    enum CodingKeys: CodingKey {
        case count
        case next
        case previous
        case results
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.count = try container.decode(Int.self, forKey: .count)
        self.next = try container.decode(String.self, forKey: .next)
        self.previous = try container.decodeIfPresent(String.self, forKey: .previous)
        self.results = try container.decode([Results].self, forKey: .results)
    }
}

struct Results: Decodable {
    let name: String
    let url: String
    
    enum CodingKeys: CodingKey {
        case name
        case url
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.url = try container.decode(String.self, forKey: .url)
    }
}
