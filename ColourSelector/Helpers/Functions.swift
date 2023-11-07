//
//  SharedFunctions.swift
//  ColourSelector
//
//  Created by Russell Gordon on 2022-10-28.
//

import Foundation

func filtering(originalList: [ColorTile], on desiredHueFloor: Hue) -> [ColorTile] {
    
    if desiredHueFloor == .allHues {
        return originalList
    }
    
    let desiredHueCeiling = desiredHueFloor.rawValue + 60.0
    let desiredHueRange = desiredHueFloor.rawValue...desiredHueCeiling

    var filteredListOfColorTiles: [ColorTile] = []
        
    for tile in originalList {
            
        if desiredHueRange.contains(tile.hue) {
            filteredListOfColorTiles.append(tile)
        }
            
    }
        
    return filteredListOfColorTiles

}
