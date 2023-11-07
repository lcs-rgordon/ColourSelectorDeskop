//
//  TileView.swift
//  ColourSelector
//
//  Created by Russell Gordon on 2022-10-27.
//

import SwiftUI

struct TileView: View {
    
    var colorToShow: Color
    var size: Double
    
    var body: some View {

        Rectangle()
            .fill(colorToShow)
            .frame(width: size, height: size)

    }
}

#Preview {
    TileView(colorToShow: blueColorTile.baseColor, size: 100)
}
