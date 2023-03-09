//
//  PokemonSearchViewController.swift
//  Pokedex
//
//  Created by Ana Paula Lesniovski dos Santos on 23/02/23.
//

import UIKit

final class PokemonSearchView: UIView {
    
    let pokemonList = PokemonViewController()
    
    private lazy var searchPokemon: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Qual Pokémon você está procurando?"
        textField.backgroundColor = .gray
        return textField
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstraints()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setConstraints()
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
//            searchPokemon.topAnchor.constraint(equalTo: bottomAnchor, constant: 465),
//            searchPokemon.leftAnchor.constraint(equalTo: leftAnchor, constant: 40),
//            searchPokemon.rightAnchor.constraint(equalTo: rightAnchor, constant: -40),
            searchPokemon.heightAnchor.constraint(equalToConstant: 40)
            
            //        searchPokemon.topAnchor.constraint(equalTo: descriptionSearchPokemon.bottomAnchor, constant: 18),
            //        searchPokemon.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40),
            //        searchPokemon.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40),
            //        searchPokemon.heightAnchor.constraint(equalToConstant: 40),
            
        ])
    }
    
}
