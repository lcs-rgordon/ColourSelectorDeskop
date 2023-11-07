//
//  SavedPalettesView.swift
//  ColourSelector
//
//  Created by Russell Gordon on 2022-10-27.
//

import SwiftUI

struct SavedPalettesView: View {
    
    // MARK: Stored properties
    @State private var selectedHue = 0.0
    
    // Our list of colour palettes that we like
    // "Derived value"
    @Binding var savedPalettes: [SavedPalette]
    
    // Whether a hue has been selected or not
    @State private var selectionMade = false
    
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
                
                ColourSwatchView(colour: baseColour,
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
            
            // Showing the reset button
            HStack {
                Spacer()
                Button(action: {
                    selectedHue = 0.0
                    selectionMade = false
                    print("Resetting")
                }, label: {
                    Text("Reset")
                })
            }
            
            List(filtered(by: hue,
                          from: savedPalettes,
                          selectionActive: selectionMade)) { palette in
                
                MonochromaticPaletteView(hue: palette.hue,
                                         showTitle: false)
                
            }
            
        }
        .padding()
        .onChange(of: selectedHue) { newValue in
            
            // The user has selected a hue, so start filtering
            if newValue > 0 {
                selectionMade = true
            }
            print("A selection has been made")
            
        }
    }
    
    // MARK: Functions (actions, logic, things that happen...)
    

    
}

struct SavedPalettesView_Previews: PreviewProvider {
    
    static var previews: some View {
        LiveSavedPalettesView()
    }
    
    // Create a view to simulate the App Level Entry Point -> ContentView connection
    struct LiveSavedPalettesView: View {
        
        // Populate with some palettes to start...
        @State var palettes: [SavedPalette] = examplePalettes
        
        var body: some View {
            
            SavedPalettesView(savedPalettes: $palettes)
            
        }
    }
    
    
}
