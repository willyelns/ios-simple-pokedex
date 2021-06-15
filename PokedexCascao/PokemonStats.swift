//
//  PokemonStats.swift
//  PokedexCascao
//
//  Created by Will Xavier on 12/06/21.
//

import SwiftyJSON
import Foundation

struct PokemonStats {
    var hp: Int?
    var attack: Int?
    var defense: Int?
    var specialAttack: Int?
    var specialDefense: Int?
    var speed: Int?
    
    init(json: JSON) {
        for stat in json.arrayValue {
            let name = stat["stat"]["name"].stringValue
            let statValue = stat["base_stat"].intValue
            if !name.isEmpty  {
                switch name {
                case "hp":
                    self.hp = statValue
                    break
                case "attack":
                    self.attack = statValue
                    break
                case "defense":
                    self.defense = statValue
                    break
                case "special-attack":
                    self.specialAttack = statValue
                    break
                case "special-defense":
                    self.specialDefense = statValue
                    break
                case "speed":
                    self.speed = statValue
                    break
                default:
                    debugPrint("=> 👀 Stats not found \(name)")
                }
            }
        }
    }
}
