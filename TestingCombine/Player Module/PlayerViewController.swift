//
//  PlayerViewController.swift
//  TestingCombine
//
//  Created by Miguel on 24/06/20.
//  Copyright © 2020 Miguel. All rights reserved.
//

import UIKit
import Combine

/*
 Combine: Takes the changes in state and communicates them back to the UI
 Composed by:
 - Publisher
 - Subscriber
 - Subscription
 - Operators (where needed)
 */

final class PlayerViewController: UIViewController {
    
    //MARK: - Stored Properties
    
    @IBOutlet weak private var randomNumberLabel: UILabel! // 6: Gets updated
    
    private let playerPresenter = PlayerPresenter()
    
    // The Subscription object that holds the change from Publisher to Subscriber
    private var cancellable: AnyCancellable?
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cancellable
            = playerPresenter
                .playerValueAsString() // 5. We were listening for changes in this method so we proceed to update the label
                .receive(on: RunLoop.main) // Just to make sure UI work is done on the main thread
                .assign(to: \.text, on: randomNumberLabel)
    }
    
    //MARK: - Actions
    
    @IBAction private func didTapHitMeButton(_ sender: UIButton) {
        playerPresenter.randomize() // 1: User taps the button, view hands the BL off to the presenter
    }
    
}
