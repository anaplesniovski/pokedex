//
//  PokemonAPI.swift
//  Pokedex
//
//  Created by Ana Paula Lesniovski dos Santos on 22/02/23.
//

import Foundation

class PokemonAPI {
    
    func featchPokemon(completion: @escaping ([Results]) -> ()) {
        
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon?offset=151&limit=151") else { return }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let responseData = data else { return }
            
            do {
                let pokemons = try JSONDecoder().decode(Pokemon.self, from: responseData)
                completion(pokemons.results)
                print(pokemons.results)
                
            } catch let error {
                print("error: \(error)")
            }
        }
        task.resume()
    }
}


