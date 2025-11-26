//
//  PokedexRepository.swift
//  PokeAPI
//
//  Created by Manuel Duarte on 25/11/25.
//

import Foundation

struct PokedexRepository: PokedexRepositoryProtocol {
    
    static let shared = PokedexRepository()
    
    private let dataSource: DataSourceProtocol
    
    init(dataSource: DataSourceProtocol = RemoteDataSource()) {
        self.dataSource = dataSource
    }
    
    func all() async throws -> [Pokemon] {
        return try await dataSource.all().results
    }
    
    func fetchImage(from url: String) async throws -> Data {
        return try await dataSource.fetchImage(from: url)
    }
    
    func detail(from url: String) async throws -> PokemonDetail {
        return try await dataSource.detail(from: url)
    }

}
