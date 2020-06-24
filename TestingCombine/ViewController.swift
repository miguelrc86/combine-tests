//
//  ViewController.swift
//  TestingCombine
//
//  Created by Miguel on 24/06/20.
//  Copyright © 2020 Miguel. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    //MARK: - Stored Properties
    
    @IBOutlet weak private var randomNumberLabel: UILabel!
    
    //MARK: - Actions
    
    @IBAction private func didTapRandomizerButton(_ sender: UIButton) {
        randomNumberLabel.text = Int.random(in: 1...9).description
    }
    
}
