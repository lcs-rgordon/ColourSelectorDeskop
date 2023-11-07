//
//  ColourSelectorApp.swift
//  ColourSelector
//
//  Created by Russell Gordon on 2022-10-27.
//

import SwiftUI

@main
struct ColourSelectorApp: App {
    
    // MARK: Stored properties
    
    // Our list of saved palettes
    // "Source of truth"
    @State private var savedPalettes: [SavedPalette] = [] // empty
    
    // MARK: Computed properties
    
    // Windows / screens that make up our app
    var body: some Scene {
        WindowGroup {
            TabView {
                
                ContentView(savedPalettes: $savedPalettes)
                    .tabItem {
                        Image(systemName: "swatchpalette")
                        Text("Browse")
                    }
                
                SavedPalettesView(savedPalettes: $savedPalettes)
                    .tabItem {
                        Image(systemName: "list.dash")
                        Text("Review")
                    }
                
            }
            
        }
    }
}
