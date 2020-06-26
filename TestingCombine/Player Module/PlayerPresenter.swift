//
//  PlayerPresenter.swift
//  TestingCombine
//
//  Created by Miguel on 25/06/20.
//  Copyright © 2020 Miguel. All rights reserved.
//

import Combine

// Because ContentView is observing an instance of this, it needs to conform to ObservableObject protocol
final class PlayerPresenter: ObservableObject {
    
    let player = Player()
    var cancellable: AnyCancellable?
    
    // 3: ContentView is relying on this property to produce a UI update, so we need to Publish it
    @Published var playerValueAsString: String = ""
    
    init() {
        cancellable
            = player
                .$randomValue // 5: Cancellable is listening for a change in the model, so we handle the model being modified
                .map{int in int.description}
                .sink{ [weak self] string in // assing() strongly retains self so we use sink
                    self?.playerValueAsString = string // 6: Published value gets updated
        }
    }
    
    func randomize() {
        player.randomize() // 2: Triggers a change in the model
    }
    
}
