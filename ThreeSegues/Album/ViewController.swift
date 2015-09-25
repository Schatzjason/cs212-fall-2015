//
//  ViewController.swift
//  Album
//
//  Created by Jason Schatz on 9/24/15.
//  Copyright (c) 2015 Jason Schatz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let object: AnyObject = segue.destinationViewController
        let orange = object as! OrangeModalViewController
        
        if segue.identifier == "NamedSegue" {
            orange.presentationTechnique = "Named Segue"
        }
        
        else if segue.identifier == "TriggeredSegue" {
            orange.presentationTechnique = "Triggered Segue"
        }
        
        else {
            assert(false)
        }
    }

    @IBAction func presentOrangeUsingAllCode() {
        let object: AnyObject = storyboard!.instantiateViewControllerWithIdentifier("OrangeViewController")
        let orange = object as! OrangeModalViewController
        
        orange.presentationTechnique = "All Code!"
        
        presentViewController(orange, animated: true, completion: nil)
    }
    
    
    @IBAction func presetOrangeUsingNamedSegue(sender: UIButton) {
        performSegueWithIdentifier("NamedSegue", sender: self)
    }
    
}

