//
//  ContentView.swift
//  TestingCombine
//
//  Created by Miguel on 25/06/20.
//  Copyright © 2020 Miguel. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    // @ObservedObject We are interested to know when this changes
    @ObservedObject private var playerPresenter = PlayerPresenter()
    
    var body: some View {
        VStack {
            Spacer()
            Text(playerPresenter.playerValueAsString) // 7: Value changed, thus view gets updated
            Spacer()
            Button("Hit Me", action: valueRandomizer)
                .padding(.all, 12)
                .foregroundColor(.white)
                .background(Color.black)
            Spacer()
        }
    }
    
    private func valueRandomizer() {
        playerPresenter.randomize() // 1: User taps the button, view hands the BL off to the presenter
    }
    
}
