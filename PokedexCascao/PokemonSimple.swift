//
//  PokemonSimple.swift
//  PokedexCascao
//
//  Created by Rodrigo Miyashiro on 09/06/21.
//

import Foundation
import SwiftyJSON
    
struct PokemonSimple {
    var name: String?
    var url: String?
    
    init(json: JSON) {
        self.name = json["name"].stringValue
        self.url = json["url"].stringValue
    }
}
