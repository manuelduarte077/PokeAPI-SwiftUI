//
//  DataSourceProtocol.swift
//  PokeAPI
//
//  Created by Manuel Duarte on 25/11/25.
//

import Foundation

/// Protocolo que define la interfaz para obtener datos de la fuente de datos
///
/// Este protocolo abstrae el acceso a los datos, permitiendo diferentes implementaciones
/// como RemoteDataSource (API remota), LocalDataSource (almacenamiento local), etc.
/// Sigue el patrón de diseño Repository/DataSource para separar la lógica de acceso a datos.
protocol DataSourceProtocol {
    
    /// Obtiene todos los Pokémon disponibles desde la fuente de datos
    ///
    /// Este método recupera la lista completa de Pokémon desde la fuente de datos configurada.
    /// La respuesta incluye un objeto Pokedex que contiene un array de Pokémon con información básica.
    ///
    /// - Returns: Un objeto Pokedex que contiene la lista de Pokémon
    /// - Throws: Error si la operación falla (por ejemplo, problemas de red o datos inválidos)
    func all() async throws -> Pokedex
    
    /// Obtiene la imagen de un Pokémon desde una URL
    ///
    /// Este método descarga los datos binarios de la imagen de un Pokémon desde la URL proporcionada.
    /// La URL puede ser tanto de la API de Pokémon como una URL directa de imagen.
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
