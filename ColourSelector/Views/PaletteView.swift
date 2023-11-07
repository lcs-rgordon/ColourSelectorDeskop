//
//  PaletteView.swift
//  ColourSelector
//
//  Created by Russell Gordon on 2022-10-27.
//

import SwiftUI

struct PaletteView: View {
    
    let palette: Palette

    var body: some View {
        
        HStack(spacing: 0) {
            
            TileView(
                tile: palette.base,
                size: 50
            )

            TileView(
                tile: palette.darker,
                size: 50
            )
            
            TileView(
                tile: palette.darkest,
                size: 50
            )

            Spacer()

        }

    }
}

#Preview {
    PaletteView(palette: examplePalette)
}
