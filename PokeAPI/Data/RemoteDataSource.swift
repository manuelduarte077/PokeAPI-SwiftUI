//
//  RemoteDataSource.swift
//  PokeAPI
//
//  Created by Manuel Duarte on 25/11/25.
//

import Foundation

struct RemoteDataSource : DataSourceProtocol {
    func fetchImage(from url: String) async throws -> Data {
        
        guard let url = URL(string: url) else {
            throw ServiceError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw ServiceError.invalidResponse
        }
        
        return data
        
    }
    
    func detail(from url: String) async throws -> PokemonDetail {
        
        guard let url = URL(string: url) else {
            throw ServiceError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw ServiceError.invalidResponse
        }
        
        do {
            return try JSONDecoder().decode(PokemonDetail.self, from: data)
        } catch {
            throw ServiceError.invalidData
        }
        
    }
    
    func all() async throws -> Pokedex {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon") else {
            throw ServiceError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw ServiceError.invalidResponse
        }
        
        do {
            return try JSONDecoder().decode(Pokedex.self, from: data)
        } catch {
            throw ServiceError.invalidData
        }
    }
    
}

enum ServiceError : Error {
    case invalidURL
    case invalidResponse
    case invalidData
}
