//
//  BrowsingView.swift
//  ColourSelector
//
//  Created by Russell Gordon on 2022-10-27.
//

import SwiftUI

struct BrowsingView: View {
    
    @State var selectedHue = 0.0

    @State var history: [ColorTile] = [] // empty
    
    @State var selectedHueRange: Hue = .allHues

    var tileBasedOnSelectedHue: ColorTile {
        return ColorTile(hue: selectedHue)
    }

    var body: some View {

        HStack {
            
            VStack(spacing: 20) {
                
                HStack(alignment: .top) {
                    
                    TileView(
                        colorToShow: tileBasedOnSelectedHue.baseColor,
                        size: 100.0
                    )
                    .padding(.trailing)

                    VStack(alignment: .leading) {
                                                
                        Text(tileBasedOnSelectedHue.hueFormattedAsString)

                        Slider(value: $selectedHue,
                               in: 0...360,
                               label: { Text("Base Hue") },
                               minimumValueLabel: { Text("0") },
                               maximumValueLabel: { Text("360") })


                    }
                }
                
                HStack {
                    
                    PaletteView(fromBaseTile: tileBasedOnSelectedHue)

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

            VStack {
                
                Picker("Filtering on", selection: $selectedHueRange) {
                    Text("All hues (no filtering)").tag(Hue.allHues)
                }
                .padding(10)

                List(history) { tile in
                    PaletteView(fromBaseTile: tile)
                }

            }
            
        }
        .padding()
    }
    
    func savePalette() {
        history.append(tileBasedOnSelectedHue)
    }
}

#Preview {

    BrowsingView()

}
