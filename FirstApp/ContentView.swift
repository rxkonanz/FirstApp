//
//  ContentView.swift
//  FirstApp
//
//  Created by Roberto Konanz on 1/7/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Welcome to My First App!")
                .font(.largeTitle)
                .padding()
            Button(action: {
                print("Button was tapped!")
            }) {
                Text("Tap Me")
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

