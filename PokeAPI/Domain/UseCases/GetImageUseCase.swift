//
//  GetImageUseCase.swift
//  PokeAPI
//
//  Created by Manuel Duarte on 25/11/25.
//

import Foundation

struct GetImageUseCase {
    private let repository: PokedexRepositoryProtocol
    
    init(_ repository: PokedexRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute(from url: String) async throws -> Data {
        return try await repository.fetchImage(from: url)
    }
}
