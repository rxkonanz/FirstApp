//
//  ContentView.swift
//  FirstApp
//
//  Created by Roberto Konanz on 1/7/25.
//

import SwiftUI

struct ContentView: View {
    @State private var groceryItems: [GroceryItem] = [
        GroceryItem(name: "Milk"),
        GroceryItem(name: "Eggs"),
        GroceryItem(name: "Bread")
    ]
    @State private var isAddingItem = false // State to track if the AddItemView is showing

    var body: some View {
        NavigationView {
            List {
                ForEach(groceryItems) { item in
                    HStack {
                        Image(systemName: item.isPurchased ? "checkmark.circle.fill" : "circle")
                            .foregroundColor(item.isPurchased ? .green : .gray)
                            .onTapGesture {
                                togglePurchased(for: item)
                            }
                        
                        Text(item.name)
                            .strikethrough(item.isPurchased)
                            .foregroundColor(item.isPurchased ? .gray : .black)
                    }
                }
                .onDelete(perform: deleteItem) // Enable swipe-to-delete
            }
            .navigationTitle("Grocery List")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        isAddingItem = true
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $isAddingItem) {
                AddItemView(groceryItems: $groceryItems) // Pass the list to AddItemView
            }
        }
    }

    private func togglePurchased(for item: GroceryItem) {
        if let index = groceryItems.firstIndex(where: { $0.id == item.id }) {
            groceryItems[index].isPurchased.toggle()
        }
    }
    
    private func deleteItem(at offsets: IndexSet) {
        groceryItems.remove(atOffsets: offsets) // Remove the item(s) at the specified index(es)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
