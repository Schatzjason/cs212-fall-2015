//
//  ViewController.swift
//  FirstApp
//
//  Created by Jason Schatz on 9/3/15.
//  Copyright (c) 2015 Jason Schatz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var count: Int = 0
    var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's background color
        view.backgroundColor = UIColor.orangeColor()
        
        // Create a label object, add as subview of view
        let labelFrame = CGRect(x: 160, y: 150, width: 200, height: 100)
        label = UILabel(frame: labelFrame)
        label.font = UIFont.systemFontOfSize(120)
        label.text = "0"
        view.addSubview(label)
        
        // Create a button, add it as a subview
        let buttonFrame = CGRect(x: 100, y: 250, width: 200, height: 100)
        var button = UIButton.buttonWithType(UIButtonType.System) as! UIButton
        button.frame = buttonFrame
        button.setTitle("Click", forState: UIControlState.Normal)
        view.addSubview(button)
        
        // Add a target/action to the button
        button.addTarget(self, action: Selector("bumpUpTheCount"), forControlEvents: UIControlEvents.TouchDown)
        button.addTarget(self, action: Selector("printClick"), forControlEvents: UIControlEvents.TouchDown)
    }
    
    func bumpUpTheCount() {
        count++
        label.text = "\(count)"
    }
    
    func printClick() {
        print("clicked.")
    }
    
}





