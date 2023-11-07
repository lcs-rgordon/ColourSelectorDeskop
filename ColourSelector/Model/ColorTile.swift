//
//  ColorTile.swift
//  ColourSelector
//
//  Created by Russell Gordon on 2022-10-27.
//

import SwiftUI

struct ColorTile: Identifiable {
    
    let id = UUID()
    let hue: Double
    let saturation: Double = 80
    let brightness: Double = 90
    
    var hueFormattedAsString: String {
        return "\(hue.formatted(.number.precision(.fractionLength(1))))°"
    }
    
    var baseColor: Color {
        return Color(hue: hue/360.0, saturation: saturation/100.0, brightness: brightness/100.0)
    }
    
    var darkerColor: Color {
        return Color(hue: hue/360.0, saturation: saturation/100.0, brightness: (brightness - 30)/100.0)
    }

    var evenDarkerColor: Color {
        return Color(hue: hue/360.0, saturation: saturation/100.0, brightness: (brightness - 60)/100.0)
    }
    
}

let redColorTile = ColorTile(hue: 0.0)
let yellowColorTile = ColorTile(hue: 60.0)
let blueColorTile = ColorTile(hue: 240.0)

let exampleColorTiles = [ redColorTile, yellowColorTile, blueColorTile ]
