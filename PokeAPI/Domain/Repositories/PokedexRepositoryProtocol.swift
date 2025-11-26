//
//  PokedexRepositoryProtocol.swift
//  PokeAPI
//
//  Created by Manuel Duarte on 25/11/25.
//

import Foundation

/// Protocolo que define la interfaz del repositorio de Pokémon
///
/// Este protocolo actúa como una capa de abstracción entre la lógica de negocio (Use Cases)
/// y la capa de datos (DataSource). Proporciona una interfaz simplificada para acceder a los datos
/// de Pokémon, transformando los datos crudos del DataSource en formatos más convenientes para la aplicación.
///
/// La diferencia principal con DataSourceProtocol es que este protocolo devuelve directamente
/// un array de Pokemon en lugar de un objeto Pokedex, simplificando el uso en las capas superiores.
protocol PokedexRepositoryProtocol {
    
    /// Obtiene la lista completa de Pokémon disponibles
    ///
    /// Este método recupera todos los Pokémon y los devuelve como un array directo,
    /// extrayendo la lista del objeto Pokedex que proviene del DataSource.
    ///
    /// - Returns: Un array de objetos Pokemon con información básica (nombre y URL)
    /// - Throws: Error si la operación falla (por ejemplo, problemas de red o datos inválidos)
    func all() async throws -> [Pokemon]
    
    /// Obtiene la imagen de un Pokémon desde una URL
    ///
    /// Este método descarga los datos binarios de la imagen de un Pokémon desde la URL proporcionada.
    /// La URL puede ser procesada o transformada antes de la descarga según la implementación.
    ///
    /// - Parameter url: URL de la imagen del Pokémon a descargar
    /// - Returns: Datos binarios (Data) de la imagen del Pokémon
    /// - Throws: Error si la descarga falla (por ejemplo, URL inválida, problemas de red)
    func fetchImage(from url: String) async throws -> Data
    
    /// Obtiene los detalles completos de un Pokémon desde una URL
    ///
    /// Este método recupera toda la información detallada de un Pokémon específico,
    /// incluyendo estadísticas, altura, peso, tipos, habilidades, etc.
    ///
    /// - Parameter url: URL del endpoint de la API para obtener los detalles del Pokémon
    /// - Returns: Un objeto PokemonDetail con toda la información del Pokémon
    /// - Throws: Error si la operación falla (por ejemplo, URL inválida, problemas de red, datos inválidos)
    func detail(from url: String) async throws -> PokemonDetail
}
