//
//  Tile.swift
//  ColourSelector
//
//  Created by Russell Gordon on 2022-10-27.
//

import SwiftUI

struct Tile: Identifiable {
    
    let id = UUID()
    let hue: Double
    let saturation: Double = 80
    let brightness: Double
    
    var hueFormattedAsString: String {
        return "\(hue.formatted(.number.precision(.fractionLength(1))))°"
    }
    
    var color: Color {
        return Color(hue: hue / 360.0, saturation: saturation / 100.0, brightness: brightness / 100.0)
    }
    
}

let redTile = Tile(hue: 0.0, brightness: 90)
let yellowTile = Tile(hue: 60.0, brightness: 90)
let blueTile = Tile(hue: 240.0, brightness: 90)
