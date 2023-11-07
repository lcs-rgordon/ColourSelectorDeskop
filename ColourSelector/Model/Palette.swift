//
//  Palette.swift
//  ColourSelector
//
//  Created by Russell Gordon on 2023-11-07.
//

import SwiftUI

struct Palette: Identifiable {
    
    let id = UUID()
    let base: Tile
    
    var darker: Tile {
        return Tile(hue: base.hue, brightness: base.brightness - 30.0)
    }
    var darkest: Tile {
        return Tile(hue: base.hue, brightness: base.brightness - 60.0)
    }
        
}

let examplePalette = Palette(
    base: Tile(hue: 0.0, brightness: 90.0)
)

