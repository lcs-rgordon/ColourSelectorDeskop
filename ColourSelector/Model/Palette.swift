//
//  Palette.swift
//  ColourSelector
//
//  Created by Russell Gordon on 2022-10-27.
//

import Foundation

struct Palette: Identifiable {
    let id = UUID()
    let hue: Double
    let saturation: Double = 0.8
    let brightness: Double = 0.9
}

// For driving SwiftUI previews

let examplePalettes = [

    Palette(hue: 0.1)
    
    ,
    
    Palette(hue: 0.2)
    
    ,

    Palette(hue: 0.3)
    
    ,

]
