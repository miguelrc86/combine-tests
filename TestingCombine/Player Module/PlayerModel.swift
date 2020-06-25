//
//  PlayerModel.swift
//  TestingCombine
//
//  Created by Miguel on 25/06/20.
//  Copyright © 2020 Miguel. All rights reserved.
//

import Combine

final class Player {
    
    /*
     The @ is syntax for a property wrapper
     $ prefix says this is a Publisher of the form <Int, Never> (Generic)
     If no one is listening, (no subscribers) this value is never published
     */
    @Published private(set) var randomValue = 0 // 3: Gets updated, being a Publisher this triggers and 'notifies' the Subscriber (Presenter)
    
    func randomize() {
        randomValue = Int.random(in: 1...9)
    }
    
}
