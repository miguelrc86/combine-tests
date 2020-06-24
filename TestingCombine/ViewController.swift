//
//  ViewController.swift
//  TestingCombine
//
//  Created by Miguel on 24/06/20.
//  Copyright © 2020 Miguel. All rights reserved.
//

import UIKit

/* Manual Communication Of State - Pre Combine */

final class ViewController: UIViewController {
    
    //MARK: - Stored Properties
    
    @IBOutlet weak private var randomNumberLabel: UILabel!
    
    private var randomValue = 0 {
        didSet {
            updateRandomNumberLabel()
        }
    }
    
    //MARK: - Actions
    
    @IBAction private func didTapRandomizerButton(_ sender: UIButton) {
        randomValue = Int.random(in: 1...9)
    }
    
    //MARK: - Private
    
    private func updateRandomNumberLabel() {
        randomNumberLabel.text = randomValue.description
    }
    
}
