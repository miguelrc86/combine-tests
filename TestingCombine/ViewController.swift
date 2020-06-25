//
//  ViewController.swift
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
 */

final class ViewController: UIViewController {
    
    //MARK: - Stored Properties
    
    @IBOutlet weak private var randomNumberLabel: UILabel! // 4: Gets updated
    
    /*
     The @ is syntax for a property wrapper
     $ prefix says this is a Publisher of the form <Int, Never> (Generic)
     */
    @Published private var randomValue = 0 // 2: Gets updated, being a Publisher this triggers and 'notifies' Subscriber
    
    // The Subscription object that holds the change from Publisher to Subscriber
    private var cancellable: AnyCancellable?
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cancellable
            = $randomValue // 3: As cancellable was listening, we handle the result of the user action here
                .map{int in int.description}
                .receive(on: RunLoop.main) // Just to make sure UI work is done on the main thread
                .assign(to: \.text, on: randomNumberLabel)
    }
    
    //MARK: - Actions
    
    @IBAction private func didTapHitMeButton(_ sender: UIButton) {
        randomValue = Int.random(in: 1...9) // 1: User taps the button, random value is assigned to randomValue
    }
    
}
