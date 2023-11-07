//
//  PaletteView.swift
//  ColourSelector
//
//  Created by Russell Gordon on 2022-10-27.
//

import SwiftUI

struct PaletteView: View {
    
    var fromBaseTile: ColorTile
    var title: String = ""

    var body: some View {
        
        HStack(spacing: 0) {
            
            TileView(
                colorToShow: fromBaseTile.baseColor,
                size: 50
            )

            TileView(
                colorToShow: fromBaseTile.darkerColor,
                size: 50
            )
            
            TileView(
                colorToShow: fromBaseTile.evenDarkerColor,
                size: 50
            )

            Spacer()

        }

    }
}

#Preview {
    PaletteView(fromBaseTile: blueColorTile)
}
