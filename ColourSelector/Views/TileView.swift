//
//  TileView.swift
//  ColourSelector
//
//  Created by Russell Gordon on 2022-10-27.
//

import SwiftUI

struct TileView: View {
    
    var tile: Tile
    var size: Double
    
    var body: some View {

        Rectangle()
            .fill(tile.color)
            .frame(width: size, height: size)

    }
}

#Preview {
    TileView(tile: blueTile, size: 100)
}
