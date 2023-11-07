//
//  BrowsingView.swift
//  ColourSelector
//
//  Created by Russell Gordon on 2022-10-27.
//

import SwiftUI

struct BrowsingView: View {
    
    // MARK: Stored properties
    @State private var selectedHue = 0.0
    
    // Our list of colour palettes that we like
    // "Derived value"
    @Binding var history: [Palette]
    
    // MARK: Computed properties
    
    // The selected hue expressed as a value between 0.0 and 1.0
    private var hue: Double {
        return selectedHue / 360.0
    }
    
    // Make the colour that SwiftUI will use to set the background of the colour swatch
    private var baseColour: Color {
        return Color(hue: hue,
                     saturation: 0.8,
                     brightness: 0.9)
    }

    // Interface
    var body: some View {

        VStack(spacing: 20) {
            
            // Selecting the hue
            HStack {
                
                ColorTileView(colour: baseColour,
                                 size: 100)
                .padding(.trailing)

                VStack(alignment: .leading) {
                    
                    Text("Hue")
                        .bold()
                    
                    Text("\(selectedHue.formatted(.number.precision(.fractionLength(1))))°")

                    Slider(value: $selectedHue,
                           in: 0...360,
                           label: { Text("Hue") },
                           minimumValueLabel: { Text("0") },
                           maximumValueLabel: { Text("360") })

                }
            }
            
            // Monochromatic palette
            HStack {
                
                MonochromaticPaletteView(hue: hue)

                Spacer()
                
                Button(action: {
                    // Save the current palette
                    savePalette()
                }, label: {
                    Text("Save")
                        .font(.subheadline.smallCaps())
                })
                .buttonStyle(.bordered)
    
                
            }
            
            List(history) { palette in
                MonochromaticPaletteView(hue: palette.hue,
                                         showTitle: false)
            }
            
        }
        .padding()
    }
    
    // MARK: Functions (actions, logic, things that happen...)
    func savePalette() {
        let newPalette = Palette(hue: hue)
        history.append(newPalette)
        print(history)
    }
}

#Preview {

    // Create a view to simulate the App Level Entry Point -> BrowsingView connection
    struct LiveBrowsingView: View {
        
        // Populate with some palettes to start...
        @State var palettes: [Palette] = examplePalettes
        
        var body: some View {
            
            BrowsingView(history: $palettes)
            
        }
    }

    return LiveBrowsingView()

}
