//
//  SharedFunctions.swift
//  ColourSelector
//
//  Created by Russell Gordon on 2022-10-28.
//

import Foundation

func filtering(originalList: [Palette], on desiredFloor: Hue) -> [Palette] {
    
    if desiredFloor == .allHues {
        return originalList
    }
    
    let desiredCeiling = desiredFloor.rawValue + 60.0
    let desiredHueRange = desiredFloor.rawValue...desiredCeiling

    var filteredListOfPalettes: [Palette] = []
        
    for palette in originalList {
            
        if desiredHueRange.contains(palette.base.hue) {
            filteredListOfPalettes.append(palette)
        }
            
    }
        
    return filteredListOfPalettes

}
