//
//  GetPokemonListUseCase.swift
//  PokeAPI
//
//  Created by Manuel Duarte on 25/11/25.
//

import Foundation

struct GetPokemonListUseCase {
    private let repository: PokedexRepositoryProtocol
    
    init(_ repository: PokedexRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute() async throws -> [Pokemon] {
        return try await repository.all()
    }
}
