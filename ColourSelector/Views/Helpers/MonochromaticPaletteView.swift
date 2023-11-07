//
//  MonochromaticPaletteView.swift
//  ColourSelector
//
//  Created by Russell Gordon on 2022-10-27.
//

import SwiftUI

struct MonochromaticPaletteView: View {
    
    // MARK: Stored properties
    var hue: Double
    var showTitle: Bool = true
    
    // MARK: Computed properties
    // Make the colour that SwiftUI will use to set the background of the colour swatch
    private var baseColour: Color {
        return Color(hue: hue,
                     saturation: 0.8,
                     brightness: 0.9)
    }

    private var darkerColour: Color {
        return Color(hue: hue,
                     saturation: 0.8,
                     brightness: 0.6)
    }

    private var evenDarkerColour: Color {
        return Color(hue: hue,
                     saturation: 0.8,
                     brightness: 0.3)
    }

    // Interface
    var body: some View {
        
        VStack(alignment: .leading) {
            
            if showTitle {
                Text("Monochromatic")
                    .font(.caption.smallCaps())
                    .bold()
            }
            
            HStack(spacing: 0) {
                
                ColourSwatchView(colour: baseColour,
                                 size: 50)

                ColourSwatchView(colour: darkerColour,
                                 size: 50)
                
                ColourSwatchView(colour: evenDarkerColour,
                                 size: 50)

                Spacer()

            }
            
        }
    }
}

struct MonochromaticPaletteView_Previews: PreviewProvider {
    static var previews: some View {
        MonochromaticPaletteView(hue: 0.0, showTitle: true)
        MonochromaticPaletteView(hue: 0.0, showTitle: false)
    }
}
