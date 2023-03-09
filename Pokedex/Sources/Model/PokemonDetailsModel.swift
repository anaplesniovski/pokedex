//
//  PokemonCompletAPI.swift
//  Pokedex
//
//  Created by Ana Paula Lesniovski dos Santos on 01/03/23.
//

import Foundation

struct PokemonDetails: Decodable {
    let attack: Int
    let defense: Int
    let description: String
    //let evolutionChain: [EvolutionChain]
    let id: Int
    let imageUrl: String
    let name: String
    let type: String
    
    enum CodingKeys: CodingKey {
        case attack
        case defense
        case description
       // case evolutionChain
        case id
        case imageUrl
        case name
        case type
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.attack = try container.decode(Int.self, forKey: .attack)
        self.defense = try container.decode(Int.self, forKey: .defense)
        self.description = try container.decode(String.self, forKey: .description)
       // self.evolutionChain = try container.decode([EvolutionChain].self, forKey: .evolutionChain)
        self.id = try container.decode(Int.self, forKey: .id)
        self.imageUrl = try container.decode(String.self, forKey: .imageUrl)
        self.name = try container.decode(String.self, forKey: .name)
        self.type = try container.decode(String.self, forKey: .type)
    }
}

//struct EvolutionChain: Decodable {
//    let id: Int
//    let name: String
//    
//    enum CodingKeys: CodingKey {
//        case id
//        case name
//    }
//    
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.id = try container.decode(Int.self, forKey: .id)
//        self.name = try container.decode(String.self, forKey: .name)
//    }
//}



//let evolutionChains: [EvolutionChain] = try! JSONDecoder().decode([EvolutionChain].self, from: //jsonData)
//print(evolutionChains.count)



/*
struct PokemonDetails: Decodable {
    let id: Int
    let sprites: PokemonSprites
    let types: [PokemonType]
    
    enum CodingKeys: CodingKey {
        case id
        case sprites
        case types
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.sprites = try container.decode(PokemonSprites.self, forKey: .sprites)
        self.types = try container.decode([PokemonType].self, forKey: .types)
    }
}

struct PokemonSprites: Decodable {
    let frontDefault: String
    
    enum CodingKeys: CodingKey {
        case front_default = "front_default"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.front_default = try container.decode(String.self, forKey: .front_default)
    }
}

struct PokemonType: Decodable {
    let types: [String]
    
    init(types: [String]) {
        self.types = types
    }
}
 */
