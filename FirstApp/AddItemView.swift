//
//  AddItemView.swift
//  FirstApp
//
//  Created by Roberto Konanz on 1/7/25.
//

import SwiftUI

struct AddItemView: View {
    @Environment(\.dismiss) var dismiss // To close the sheet
    @Binding var groceryItems: [GroceryItem] // Binding to update the list in ContentView
    @State private var newItemName: String = "" // State to hold the input

    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter item name", text: $newItemName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                Button(action: {
                    addItem()
                }) {
                    Text("Add Item")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding()
                .disabled(newItemName.isEmpty) // Disable button if the text field is empty
            }
            .navigationTitle("Add Item")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss() // Close the sheet without adding an item
                    }
                }
            }
        }
    }

    // Add the new item to the list and dismiss the view
    private func addItem() {
        let newItem = GroceryItem(name: newItemName)
        groceryItems.append(newItem) // Update the list
        dismiss() // Close the sheet
    }
}

struct AddItemView_Previews: PreviewProvider {
    static var previews: some View {
        AddItemView(groceryItems: .constant([])) // Use a constant binding for previews
    }
}
