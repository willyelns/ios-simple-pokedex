//
//  PokemonManager.swift
//  PokedexCascao
//
//  Created by Rodrigo Miyashiro on 09/06/21.
//

import Foundation
import SwiftyJSON
import Kingfisher

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
    
    static func getPokemonDetail(with pokemonUrl: String, success: @escaping(PokemonDetail?) -> Void, failure: @escaping(Error?) -> Void) {
        Request.get(pokemonUrl) { result, error in
            guard error == nil else {
                failure(error)
                return
            }
            
            guard let data = result else {
                failure(NSError(domain: "Error to get the pokemon details", code: 503, userInfo: nil))
                return
            }
            
            let jsonData = JSON(data)
            let pokemonDetail = PokemonDetail(json: jsonData)
            
            success(pokemonDetail)
        }
    }
    
    static func getPokemonImage(with imageUrl: String, success: @escaping(RetrieveImageResult) -> Void, failure: @escaping(Error?) -> Void) {
        guard let url = URL.init(string: imageUrl) else {
            debugPrint("Error to create an url from the String")
            return
        }
        
        let resource = ImageResource(downloadURL: url)

        KingfisherManager.shared.retrieveImage(with: resource, options: nil, progressBlock: nil) { result in
            switch result {
            case .success(let imageValue):
                print("Image: \(imageValue.image). Got from: \(imageValue.cacheType)")
                success(imageValue)
                break
            case .failure(let error):
                // Change this error to separate the KingFisher from the error response
                failure(error)
                break
                
            }
        }
    }
}
