//
//  ImageUtil.swift
//  PokeAPI
//
//  Created by Manuel Duarte on 25/11/25.
//

import Foundation

/// Utilidad para generar URLs de imágenes de Pokémon
/// 
/// Esta clase proporciona métodos estáticos para convertir URLs de la API de Pokémon
/// en URLs de imágenes oficiales almacenadas en GitHub.
final class ImageUtil {
    
    /// Convierte una URL de la API de Pokémon en la URL de su imagen oficial
    ///
    /// Esta función extrae el ID del Pokémon de la URL de la API y lo utiliza para
    /// construir la URL completa de la imagen oficial del sprite del Pokémon.
    ///
    /// Ejemplo:
    /// - Entrada: "https://pokeapi.co/api/v2/pokemon/25/"
    /// - Salida: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/25.png"
    ///
    /// - Parameter url: URL de la API de Pokémon (ej: "https://pokeapi.co/api/v2/pokemon/25/")
    /// - Returns: URL completa de la imagen oficial del Pokémon en formato PNG
    static func imageURL(from url: String) -> String {
        // URL base donde se almacenan las imágenes oficiales de los sprites de Pokémon
        // El formato incluye un placeholder %@ que será reemplazado por el ID del Pokémon
        let baseImageUrl = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/%@.png"
        
        // Divide la URL en componentes separados por "/"
        // Ejemplo: ["https:", "", "pokeapi.co", "api", "v2", "pokemon", "25", ""]
        let array = url.components(separatedBy: "/")
        
        // Extrae el ID del Pokémon que se encuentra en la penúltima posición del array
        // Esto funciona porque las URLs de la API terminan con "/" y el ID está antes del último elemento vacío
        // Ejemplo: array.count = 8, entonces array[6] = "25"
        let id = array[array.count-2]
        
        // Construye la URL final reemplazando el placeholder %@ con el ID extraído
        // y retorna la URL completa de la imagen
        return String(format: baseImageUrl, arguments: [id])
    }
}
