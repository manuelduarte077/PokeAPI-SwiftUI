//
//  PokedexRepositoryProtocol.swift
//  PokeAPI
//
//  Created by Manuel Duarte on 25/11/25.
//

import Foundation

protocol PokedexRepositoryProtocol {
    func all() async throws -> [Pokemon]
    func fetchImage(from url: String) async throws -> Data
    func detail(from url: String) async throws -> PokemonDetail
}
