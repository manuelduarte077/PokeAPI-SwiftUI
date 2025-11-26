//
//  PokemonDetailViewModel.swift
//  PokeAPI
//
//  Created by Manuel Duarte on 26/11/25.
//

import SwiftUI

@Observable
final class PokemonDetailViewModel {
    
    private let getPokemonDetailUseCase: GetPokemonDetailUseCase
    
    var pokemonDetail: PokemonDetail?
    
    init(getPokemonDetailUseCase: GetPokemonDetailUseCase = GetPokemonDetailUseCase(PokedexRepository.shared)) {
         self.getPokemonDetailUseCase = getPokemonDetailUseCase
     }
    
    func fetchPokemonDetail(from url: String) async throws {
        do {
            pokemonDetail = try await getPokemonDetailUseCase.execute(from: url)
        } catch {
            print(error)
        }
    }
    
}
