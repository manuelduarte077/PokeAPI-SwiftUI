//
//  PokemonDetail.swift
//  PokeAPI
//
//  Created by Manuel Duarte on 25/11/25.
//

import Foundation

struct PokemonDetail: Codable {
    let id: Int
    let name: String
    let height: Double
    let weight: Double
    let stats: [PokemonStat]
}

struct PokemonStat: Codable, Hashable {
    let base_stat: Int
    let effort: Int
    let stat: Stat
}

struct Stat: Codable, Hashable {
    let url: String
    let name: String
}
