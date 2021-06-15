//
//  PokemonDetailViewController.swift
//  PokedexCascao
//
//  Created by Rodrigo Miyashiro on 09/06/21.
//

import UIKit
import Kingfisher

class PokemonDetailViewController: UIViewController {
    var pokemonSimple: PokemonSimple?
    var pokemonDetail: PokemonDetail?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var hpLabel: UILabel!
    @IBOutlet weak var attackLabel: UILabel!
    @IBOutlet weak var defenseLabel: UILabel!
    @IBOutlet weak var specialAttackLabel: UILabel!
    @IBOutlet weak var specialDefenseLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let basePokemon = pokemonSimple  else {
            debugPrint(" there is no pokemon simple in this view")
            return
        }
        
        guard let url = basePokemon.url else {
            debugPrint(" there is no pokemon url setted")
            return
        }
        
        self.getPokemonDetail(url)
        
    }
    
    // MARK: - Retrieve data
    private func getPokemonDetail(_ url: String) {
        PokemonManager.getPokemonDetail(with: url) { details in
            if let pokemonDetail = details {
                self.pokemonDetail = pokemonDetail
                
                debugPrint(" Current pokemon details: \(pokemonDetail)")
                
                // add the data here
                self.updateViewData()
            }
        } failure: { error in
            debugPrint("🕵️‍♂️ -->> \(error.debugDescription)")
        }

    }
    
    private func downloadImage(with urlString : String){
        // Retrieve the image
    }
    
    // MARK: - Populating view
    
    private func updateViewData() {
        self.nameLabel.text = self.pokemonDetail?.name
    }

}
