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
    
    init(dataSource: DataSourceProtocol Rem ) {
        self.dataSource = dataSource
    }
    
}
