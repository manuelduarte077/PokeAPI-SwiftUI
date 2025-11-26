//
//  UIImageExtension.swift
//  PokeAPI
//
//  Created by Manuel Duarte on 25/11/25.
//

import UIKit

extension UIImage {
    
    /// Calcula y retorna el color promedio de la imagen
    /// 
    /// Esta propiedad calcula el color promedio de una región central de la imagen (tercio central)
    /// utilizando Core Image y el filtro CIAreaAverage. El resultado se utiliza para generar
    /// colores de fondo dinámicos basados en el contenido de la imagen.
    ///
    /// - Returns: Un UIColor opcional representando el color promedio de la imagen, o nil si el procesamiento falla
    var averageColor: UIColor? {
        // Convierte la imagen UIImage a CIImage para poder aplicar filtros de Core Image
        guard let inputImage = CIImage(image: self) else { return nil }

        // Crea un vector de extensión que define el área central de la imagen (tercio central)
        // Esto se hace para calcular el color promedio de la parte más representativa de la imagen,
        // evitando bordes que pueden tener colores no representativos
        // x, y: punto de inicio del área (desplazado 1/3 desde el origen)
        // z, w: ancho y alto del área (1/3 del tamaño total de la imagen)
        let extentVector = CIVector(x: inputImage.extent.origin.x + (self.size.width / 3),
                                    y: inputImage.extent.origin.y + (self.size.height / 3),
                                    z: inputImage.extent.size.width / 3,
                                    w: inputImage.extent.size.height / 3)

        // Crea un filtro CIAreaAverage que calcula el promedio de color de un área específica de la imagen
        // Este filtro toma la imagen de entrada y el área definida por extentVector
        guard let filter = CIFilter(name: "CIAreaAverage",
                                  parameters: [kCIInputImageKey: inputImage, kCIInputExtentKey: extentVector]) else { return nil }
        
        // Obtiene la imagen de salida del filtro, que será una imagen de 1x1 píxel con el color promedio
        guard let outputImage = filter.outputImage else { return nil }

        // Crea un array de 4 bytes para almacenar los valores RGBA (Red, Green, Blue, Alpha)
        // Cada valor será un número entre 0 y 255
        var bitmap = [UInt8](repeating: 0, count: 4)
        
        // Crea un contexto de Core Image para renderizar la imagen procesada
        // Se usa kCFNull para el espacio de color de trabajo para mantener los valores originales
        let context = CIContext(options: [.workingColorSpace: kCFNull!])

        // Renderiza la imagen de salida (1x1 píxel) en el array bitmap
        // Esto convierte el color promedio calculado en valores numéricos RGBA
        // bounds: rectángulo de 1x1 píxel donde se renderizará
        // format: formato RGBA8 (8 bits por canal)
        context.render(outputImage,
                       toBitmap: &bitmap,
                       rowBytes: 4,
                       bounds: CGRect(x: 0, y: 0, width: 1, height: 1),
                       format: .RGBA8,
                       colorSpace: nil)

        // Convierte los valores del bitmap (0-255) a un UIColor
        // Divide cada valor entre 255 para obtener valores normalizados entre 0.0 y 1.0
        // que es el formato requerido por UIColor
        return UIColor(red: CGFloat(bitmap[0]) / 255,
                       green: CGFloat(bitmap[1]) / 255,
                       blue: CGFloat(bitmap[2]) / 255,
                       alpha: CGFloat(bitmap[3]) / 255)
    }
    
}
