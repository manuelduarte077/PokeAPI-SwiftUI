//
//  PokemonListViewModel.swift
//  PokeAPI
//
//  Created by Manuel Duarte on 26/11/25.
//

import Foundation

@Observable
final class PokemonListViewModel {
    
    private let getPokemonListUseCase: GetPokemonListUseCase
    private let getImageUseCase: GetImageUseCase
    
    var pokedex: [Pokemon] = []
    
    init(getPokemonListUseCase: GetPokemonListUseCase = GetPokemonListUseCase(PokedexRepository.shared),
         getImageUseCase: GetImageUseCase = GetImageUseCase(PokedexRepository.shared)) {
        self.getPokemonListUseCase = getPokemonListUseCase
        self.getImageUseCase = getImageUseCase
    }
    
    func fetchPokedex() async throws {
        do {
            pokedex = try await getPokemonListUseCase.execute()
        } catch {
            print(error)
        }
    }
    
    func fetchImage(from url: String) async throws -> Data {
        return try await getImageUseCase.execute(from: url)
    }
    
}
