//
//  PokemonSummary.swift
//  PokedexCascao
//
//  Created by Rodrigo Miyashiro on 09/06/21.
//

import Foundation
import SwiftyJSON

struct PokemonSummary {
    var count: Int?
    var next: String?
    var previous: String?
    var results: [PokemonSimple]?
    
    init(json: JSON) {
        self.count = json["count"].intValue
        self.next = json["next"].stringValue
        self.previous = json["previous"].string
        
        self.results = []
        
        for item in json["results"].arrayValue {
            let pokemon = PokemonSimple(json: item)
            self.results?.append(pokemon)
        }
    }
}
