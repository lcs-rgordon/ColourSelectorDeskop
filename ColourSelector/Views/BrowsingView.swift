//
//  BrowsingView.swift
//  ColourSelector
//
//  Created by Russell Gordon on 2022-10-27.
//

import SwiftUI

struct BrowsingView: View {
    
    @State var selectedBaseHue = 0.0

    @State var history: [Palette] = []
    
    @State var selectedHueRange: Hue = .allHues

    var tileCreatedFromSelectedHue: Tile {
        return Tile(hue: selectedBaseHue, brightness: 90)
    }
    
    var paletteCreatedFromBaseTile: Palette {
        return Palette(base: tileCreatedFromSelectedHue)
    }

    var body: some View {

        HStack {
            
            VStack(alignment: .leading, spacing: 20) {
                
                    
                TileView(
                    tile: tileCreatedFromSelectedHue,
                    size: 150.0
                )
                .padding(.trailing)

                                            
                Text(tileCreatedFromSelectedHue.hueFormattedAsString)
                    .font(.largeTitle)

                Slider(value: $selectedBaseHue,
                       in: 0...360,
                       label: { Text("Base Hue") },
                       minimumValueLabel: { Text("0") },
                       maximumValueLabel: { Text("360") })

                HStack {
                    
                    PaletteView(palette: paletteCreatedFromBaseTile)

                    Spacer()
                    
                    Button(action: {
                        savePalette()
                    }, label: {
                        Text("Save")
                            .font(.subheadline.smallCaps())
                    })
                    .buttonStyle(.bordered)
                    
                }
                
                Spacer()
                                
            }

            VStack(alignment: .leading) {
                
                Picker("Filtering on", selection: $selectedHueRange) {
                    Text("All hues (no filtering)").tag(Hue.allHues)
                    Text("Red to yellow (0° to 60°)").tag(Hue.red)
                    Text("Yellow to green (60° to 120°)").tag(Hue.yellow)
                    Text("Green to teal (120° to 180°)").tag(Hue.green)
                    Text("Teal to blue (180° to 240°)").tag(Hue.teal)
                    Text("Blue to purple (240° to 300°)").tag(Hue.blue)
                    Text("Purple to red (300° to 360°)").tag(Hue.purple)
                }
                .padding(10)
                
                Image("IllustrationOfHSBColorModel")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200)

                List(
                    filtering(
                        originalList: history,
                        on: selectedHueRange
                    )
                ) { currentPalette in
                    PaletteView(palette: currentPalette)
                }

            }
            
        }
        .padding()
    }
    
    func savePalette() {
        history.append(paletteCreatedFromBaseTile)
    }
}

#Preview {

    BrowsingView()
        .frame(height: 600)

}
