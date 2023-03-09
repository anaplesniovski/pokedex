//
//  PokemonCaractAPI.swift
//  Pokedex
//
//  Created by Ana Paula Lesniovski dos Santos on 01/03/23.
//

import Foundation

class PokemonDetailsAPI {
    
    func featchPokemonDetails (completion: @escaping ([PokemonDetails]) -> ()) {
        
        let urlString = "https://pokedex-bb36f.firebaseio.com/pokemon.json"
        
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) {data, response, error in
                
                if error != nil {
                    print(error?.localizedDescription as Any)
                }
                
                if let secureData = data?.parseData(removeString: "null,") {
                    if let pokemonDetails = self.parsearJSON(dadosPokemon: secureData) {
                        //print(pokemonDetails)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parsearJSON(dadosPokemon: Data) -> [PokemonDetails]? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode([PokemonDetails].self, from: dadosPokemon)
            return decodedData
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}

extension Data {
    func parseData(removeString word: String) -> Data? {
        let dataAsString = String(data: self, encoding: .utf8)
        let parseDataString = dataAsString?.replacingOccurrences(of: word, with: " ")
        guard let data = parseDataString?.data(using: .utf8) else { return nil}
        return data
    }
}


