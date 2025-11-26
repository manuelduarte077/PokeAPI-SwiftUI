//
//  Extensions.swift
//  PokeAPI
//
//  Created by Manuel Duarte on 25/11/25.
//

import Foundation

extension Double {
    func inMetersFormat() -> String {
        return String(format: "%.1f m", self / 10)
    }
    
    func inKilogramsFormat() -> String {
        return String(format: "%.1f kg", self / 10)
    }
}

extension Int {
    func orderFomat() -> String {
        return String(format: "#%03d", self)
    }
}
