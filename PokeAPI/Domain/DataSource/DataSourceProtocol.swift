//
//  DataSourceProtocol.swift
//  PokeAPI
//
//  Created by Manuel Duarte on 25/11/25.
//

import Foundation

protocol DataSourceProtocol {
    func all() async throws -> Pokedex
    func fetchImage(from url: String) async throws -> Data
    func detail(from url: String) async throws -> PokemonDetail
}
