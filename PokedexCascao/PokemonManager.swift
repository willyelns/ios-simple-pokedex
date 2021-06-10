//
//  PokemonManager.swift
//  PokedexCascao
//
//  Created by Rodrigo Miyashiro on 09/06/21.
//

import Foundation
import SwiftyJSON

class PokemonManager {
    static func getPokemonSummary(success: @escaping(PokemonSummary?) -> Void, failure: @escaping(Error?) -> Void) {
        Request.get("https://pokeapi.co/api/v2/pokemon") { result, error in
            guard error == nil else {
                failure(error)
                return
            }
            
            guard let data = result else {
                failure(NSError(domain: "bla bla", code: 1010, userInfo: nil))
                return
            }
            
            let jsonData = JSON(data)
            let pokemonSummary = PokemonSummary(json: jsonData)
            
            success(pokemonSummary)
        }
    }
}
