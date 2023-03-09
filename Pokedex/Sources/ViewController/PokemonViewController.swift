//
//  ViewController.swift
//  Pokedex
//
//  Created by Ana Paula Lesniovski dos Santos on 22/02/23.
//

import UIKit

final class PokemonViewController: UIViewController {
    
    var pokemon: [PokemonDetails] = []
    let cellIdentifier = "PokemonCell"
    
    private lazy var pokeballImage: UIImageView = {
        let imageView = UIImageView(frame: CGRectMake(0, 0, 414, 414))
        imageView.image = UIImage(named: "Pokeball")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var titlePokedex: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Pokédex"
        label.textColor = .black
        label.font = .systemFont(ofSize: 44)
        return label
    }()
    
    private lazy var descriptionSearchPokemon: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Busque o Pokémon pelo nome ou usando o número Pokédex Nacional"
        label.textColor = .gray
        label.font = .systemFont(ofSize: 16)
        label.numberOfLines = 0
        label.lineBreakMode = .byCharWrapping
        return label
    }()
    
    private lazy var searchPokemon: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Qual Pokémon você está procurando?"
        textField.textAlignment = .center
        textField.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
        textField.layer.cornerRadius = 10
        return textField
    }()
    
    private lazy var pokemonTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(PokemonTableViewCell.self, forCellReuseIdentifier: "PokemonCell")
        //tableView.register(UINib(nibName: "PokemonTableViewCell", bundle: nil), forCellReuseIdentifier: "PokemonCell")
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addComponents()
        setContransts()
        loadTableViewPokemon()
    }
    
    private func loadTableViewPokemon() {
//        PokemonAPI().featchPokemon { (pokemon) in
//            self.pokemon = pokemon
//            DispatchQueue.main.async {
//                self.listPokemon.reloadData()
//            }
//        }
//    }
    PokemonDetailsAPI().featchPokemonDetails { (pokemon) in
        self.pokemon = pokemon
        DispatchQueue.main.async {
            self.pokemonTableView.reloadData()
            print(pokemon)
        }
    }
}
    
    private func addComponents() {
        view.addSubview(pokeballImage)
        view.addSubview(titlePokedex)
        view.addSubview(descriptionSearchPokemon)
        view.addSubview(searchPokemon)
        view.addSubview(pokemonTableView)
    }
    
    private func setContransts() {
        NSLayoutConstraint.activate([
            
        pokeballImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 2),
        pokeballImage.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 2),
        pokeballImage.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 2),

        titlePokedex.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
        titlePokedex.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40),
        titlePokedex.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40),

        descriptionSearchPokemon.topAnchor.constraint(equalTo: titlePokedex.bottomAnchor, constant: 12),
        descriptionSearchPokemon.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40),
        descriptionSearchPokemon.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40),

        searchPokemon.topAnchor.constraint(equalTo: descriptionSearchPokemon.bottomAnchor, constant: 18),
        searchPokemon.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40),
        searchPokemon.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40),
        searchPokemon.heightAnchor.constraint(equalToConstant: 40),

        pokemonTableView.topAnchor.constraint(equalTo: searchPokemon.bottomAnchor, constant: 50),
        pokemonTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        pokemonTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        pokemonTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        
        ])
    }
}

extension PokemonViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemon.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! PokemonTableViewCell
       //cell.textLabel?.text = pokemon[indexPath.row].name
        //cell.pokemon = pokemon[indexPath.row].name
        cell.configure(pokemon[indexPath.row])
        cell.backgroundColor = .red
        return cell
    }
}

extension PokemonViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 115

    }
}


//layout -viewcontroller
//logica de negocio - viewmodel
