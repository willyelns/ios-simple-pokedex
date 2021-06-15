//
//  ViewController.swift
//  PokedexCascao
//
//  Created by Will Xavier on 02/06/21.
//

import UIKit

class ViewController: UIViewController {
    var pokemonList = [PokemonSimple]()
    
    @IBOutlet weak var pokeTableView: UITableView!

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.getPokemons()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.topItem?.title = "Pokedex"
    }
    
    // MARK: - Retrieve data
    private func getPokemons() {
        PokemonManager.getPokemonSummary { pokemonSummary in
            if let pokemons = pokemonSummary?.results {
                self.pokemonList = pokemons
                
                debugPrint(self.pokemonList)
                
                self.pokeTableView.reloadData()
            }
        } failure: { error in
            debugPrint("🕵️‍♂️ -->> \(error.debugDescription)")
        }
    }
    
    // MARK: - Destination
    override func performSegue(withIdentifier identifier: String, sender: Any?) {
        guard let position = sender as? Int,
              identifier == "pokemonDetailSegue",
              let destinationVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "PokemonDetailViewController") as? PokemonDetailViewController else {
            return
        }
        
        let pokemon = self.pokemonList[position]
        destinationVC.pokemonSimple = pokemon
//        destinationVC.name = pokemon.name
//        destinationVC.pokemonUrl = pokemon.url
        
        self.navigationController?.pushViewController(destinationVC, animated: true)
    }
}

// MARK: - UITableviewDataSource
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.pokemonList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.pokeTableView.dequeueReusableCell(withIdentifier: "pokeListCell") as? PokeSimpleTableViewCell else {
            return UITableViewCell()
        }
        
        let row = indexPath.row
        let pokemon = self.pokemonList[row]
        
        cell.pokeName.text = pokemon.name
        
        return cell
    }
}

// MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        self.performSegue(withIdentifier: "pokemonDetailSegue", sender: indexPath.row)
    }
}
