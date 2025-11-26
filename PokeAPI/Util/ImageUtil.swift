//
//  ImageUtil.swift
//  PokeAPI
//
//  Created by Manuel Duarte on 25/11/25.
//

import Foundation

final class ImageUtil {
    static func imageURL(from url: String) -> String {
        let baseImageUrl = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/%@.png"
        let array = url.components(separatedBy: "/")
        let id = array[array.count-2]
        
        return String(format: baseImageUrl, arguments: [id])
    }
}
