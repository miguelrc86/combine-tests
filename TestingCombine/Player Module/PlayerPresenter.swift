//
//  PlayerPresenter.swift
//  TestingCombine
//
//  Created by Miguel on 25/06/20.
//  Copyright © 2020 Miguel. All rights reserved.
//

import Combine

final class PlayerPresenter {
    
    let player = Player()
    
    // Subscribes to player's Publisher, modify it and re-publish
    func playerValueAsString() -> AnyPublisher<String?, Never> {
        player
            .$randomValue // 4: Cancellable is listening for the change in the model, so we handle the model being modified
            .map{int in int.description}
            .eraseToAnyPublisher() // To avoid Publishers.Map<Published.Int>Publisher, String> because of re-publish
    }
    
    func randomize() {
        player.randomize() // 2: Triggers a change in the model
    }
    
}
