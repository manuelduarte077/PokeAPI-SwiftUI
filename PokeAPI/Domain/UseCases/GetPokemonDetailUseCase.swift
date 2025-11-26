//
//  GetPokemonDetailUseCase.swift
//  PokeAPI
//
//  Created by Manuel Duarte on 25/11/25.
//

import Foundation

struct GetPokemonDetailUseCase {
    private let repository: PokedexRepositoryProtocol
    
    init(_ repository: PokedexRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute(from url: String) async throws -> PokemonDetail{
        return try await repository.detail(from: url)
    }
}
