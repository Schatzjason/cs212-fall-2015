//
//  ResultsViewController.swift
//  Roshambo
//
//  Created by Jason Schatz on 9/28/15.
//  Copyright (c) 2015 Jason Schatz. All rights reserved.
//

import UIKit

class MatchResultViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    var player1: RPS!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        // Generate a rancom move for the app
        let appsMove = RPS()
        
        // Generate a match instance
        let match = RPSMatch(player1: self.player1, player2: RPS())
        
        // Use the match to set the label
        resultLabel.text = match.description
    }
}
