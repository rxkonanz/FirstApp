//
//  GroceryItem.swift
//  FirstApp
//
//  Created by Roberto Konanz on 1/7/25.
//

import Foundation

struct GroceryItem: Identifiable {
    let id = UUID() // Unique identifier for each item
    var name: String // Name of the grocery item
    var isPurchased: Bool = false // Tracks whether the item is checked off
}

