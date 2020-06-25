//
//  ContentView.swift
//  TestingCombine
//
//  Created by Miguel on 24/06/20.
//  Copyright © 2020 Miguel. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    // @State makes possible to treat this value as a reference type (We are in a struct)
    @State private var randomValue: Int = 0
    
    var body: some View {
        VStack {
            Spacer()
            Text(randomValue.description)
            Spacer()
            Button("Hit Me", action: valueRandomizer)
                .padding(.all, 12)
                .foregroundColor(.white)
                .background(Color.black)
            Spacer()
        }
    }
    
    private func valueRandomizer() {
        randomValue = Int.random(in: 1...9)
    }
    
}
