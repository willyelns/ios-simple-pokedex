//
//  PokemonDetail.swift
//  PokedexCascao
//
//  Created by Will Xavier on 12/06/21.
//

import Foundation
import SwiftyJSON

struct PokemonDetail {
    var id: Int?
    var name: String?
    var imageUrl: URL? // using another api url example: `https://pokeres.bastionbot.org/images/pokemon/1.png`
    var abilities: [String]?
    var height: Int?
    var weight: Int?
    var order: Int?
    var stats: PokemonStats?
    var types: [String]?
    var baseExperience: Int?
    
    init(json: JSON) {
        self.id = json["id"].intValue
        self.name = json["name"].stringValue
        self.height = json["height"].intValue
        self.weight = json["weight"].intValue
        self.order = json["order"].intValue
        self.baseExperience = json["base_experience"].intValue
        self.stats = PokemonStats(json: json["stats"])
        
        if let imageId = self.id {
            self.imageUrl = URL(string: "https://pokeres.bastionbot.org/images/pokemon/\(imageId).png")
        }
        
        self.abilities = []
        for ability in json["abilities"].arrayValue {
            let name = ability["ability"]["name"].string
            if let abilityName = name {
                self.abilities?.append(abilityName)
            }
        }
        
        self.types = []
        for type in json["types"].arrayValue {
            let name = type["type"]["name"].string
            if let typeName = name {
                self.types?.append(typeName)
            }
        }
    }
}

