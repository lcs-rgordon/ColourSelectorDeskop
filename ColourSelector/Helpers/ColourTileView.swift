//
//  ColorTileView.swift
//  ColourSelector
//
//  Created by Russell Gordon on 2022-10-27.
//

import SwiftUI

struct ColorTileView: View {
    
    // MARK: Stored properties
    var colour: Color
    var size: Double
    
    // MARK: Computed property
    
    // Interface
    var body: some View {

        VStack {
            
        }
        .frame(width: size, height: size)
        .background(colour)

    }
}

struct ColorTileView_Previews: PreviewProvider {
    static var previews: some View {
        ColorTileView(colour: Color.blue,
                         size: 300)
    }
}
