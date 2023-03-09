//
//  PokemonTableViewCell.swift
//  Pokedex
//
//  Created by Ana Paula Lesniovski dos Santos on 06/03/23.
//

import UIKit

class PokemonTableViewCell: UITableViewCell {
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "SF Pro Display", size: 26)
        label.text = "Name:"
        return label
    }()
    
    private lazy var typeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "SF Pro Display", size: 12)
        label.text = "tipo"
        return label
    }()
    
    private lazy var pokemonImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        return imageView
    }()
    
//    var pokemon: Pokemon {
//        let pokemonItem = pokemon
//        let name = pokemonItem.results[0].name
//        nameLabel.text = name
//        return pokemonItem
//    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addComponents()
        setConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func addComponents() {
        self.contentView.addSubview(nameLabel)
        self.contentView.addSubview(typeLabel)
        self.contentView.addSubview(pokemonImage)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
        
            nameLabel.widthAnchor.constraint(equalToConstant: 120),
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 34),
            nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            
            typeLabel.widthAnchor.constraint(equalToConstant: 32),
            typeLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 22),
            typeLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            
            pokemonImage.heightAnchor.constraint(equalToConstant: 130),
            pokemonImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 10)
            
        ])
    }
    
    func configure(_ pokemon: PokemonDetails) {
        nameLabel.text = pokemon.name
    }
}

// container p/ as labels????
