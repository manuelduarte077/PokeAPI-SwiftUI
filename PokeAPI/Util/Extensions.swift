//
//  Extensions.swift
//  PokeAPI
//
//  Created by Manuel Duarte on 25/11/25.
//

import Foundation

/// Extensión de Double para formatear valores relacionados con Pokémon
extension Double {
    
    /// Convierte un valor numérico a formato de metros para mostrar la altura de un Pokémon
    ///
    /// La API de Pokémon devuelve la altura en decímetros (dm), por lo que este método
    /// divide el valor entre 10 para convertirlo a metros y lo formatea con un decimal.
    ///
    /// Ejemplo:
    /// - Entrada: 7.0 (decímetros)
    /// - Salida: "0.7 m"
    ///
    /// - Returns: String formateado con el valor en metros seguido de "m"
    func inMetersFormat() -> String {
        // Divide entre 10 para convertir de decímetros a metros
        // Formatea con 1 decimal y agrega la unidad "m"
        return String(format: "%.1f m", self / 10)
    }
    
    /// Convierte un valor numérico a formato de kilogramos para mostrar el peso de un Pokémon
    ///
    /// La API de Pokémon devuelve el peso en hectogramos (hg), por lo que este método
    /// divide el valor entre 10 para convertirlo a kilogramos y lo formatea con un decimal.
    ///
    /// Ejemplo:
    /// - Entrada: 69.0 (hectogramos)
    /// - Salida: "6.9 kg"
    ///
    /// - Returns: String formateado con el valor en kilogramos seguido de "kg"
    func inKilogramsFormat() -> String {
        // Divide entre 10 para convertir de hectogramos a kilogramos
        // Formatea con 1 decimal y agrega la unidad "kg"
        return String(format: "%.1f kg", self / 10)
    }
}

/// Extensión de Int para formatear números de orden de Pokémon
extension Int {
    
    /// Formatea un número entero como número de orden de Pokémon con formato "#XXX"
    ///
    /// Este método convierte un número entero en un string con formato de número de Pokémon,
    /// agregando el símbolo "#" al inicio y rellenando con ceros a la izquierda hasta tener 3 dígitos.
    ///
    /// Ejemplo:
    /// - Entrada: 25
    /// - Salida: "#025"
    ///
    /// Ejemplo:
    /// - Entrada: 1
    /// - Salida: "#001"
    ///
    /// - Returns: String formateado con el número de orden en formato "#XXX"
    func orderFomat() -> String {
        // Formatea el número con 3 dígitos, rellenando con ceros a la izquierda si es necesario
        // y agrega el símbolo "#" al inicio
        return String(format: "#%03d", self)
    }
}
