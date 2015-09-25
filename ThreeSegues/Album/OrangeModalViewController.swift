//
//  OrangeModalViewController.swift
//  Album
//
//  Created by Jason Schatz on 9/24/15.
//  Copyright (c) 2015 Jason Schatz. All rights reserved.
//

import UIKit

class OrangeModalViewController: UIViewController {
    
    // Should store a string specifying the way that the VC was presented
    var presentationTechnique: String = "empty"
    
    // Displays the presentationTechnique string on screen. (set in viewWillAppear...)
    @IBOutlet weak var techniqueLabel: UILabel!
    
    override func viewWillAppear(animated: Bool) {
        techniqueLabel.text = presentationTechnique
    }
   
    @IBAction func dismiss() {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
