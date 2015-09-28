//
//  ViewController.swift
//  Roshambo
//
//  Created by Jason Schatz on 9/28/15.
//  Copyright (c) 2015 Jason Schatz. All rights reserved.
//

import UIKit

class MoveSelectionController: UIViewController {
    
    // Rock: The 'hard' way, all in code. No Storyboard Segue
    // Notice that the RPS property on the MatchResultViewController can be set directly
    
    @IBAction func crushWithRock(sender: UIButton) {
        // Instantiate the MatchResutsViewController using the storyboard property

        // Set the player1 property to .Rock
        
        // Push the MatchesultsViewController onto the navigation stack, using the navigationController property
    }
    
    // Scissors: The middle way. A Storyboard Segue triggered manually in an IBAction
    
    @IBAction func cutWithScissors(sender: UIButton) {
        // invoke performSegueWithIdentifier using the identifier "CutWithScissors"
    }
    
    // Paper: The 'easy' way. A Storyboard Segue triggered directly by a control.
    
    // The following method is important for both Scissors and Paper. It looks at the Segueue
    // identifier and sets the right RPS move in the destination controller. 
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

        // Get the MatchResutsViewController using the seque's destinationViewController property

        
        // Set the controller's player1 using the segue identifiers "CutWithScissors" and "CoverWithPaper"
    }
}

