//
//  ViewController.swift
//  KnockKnock
//
//  Created by Jason Schatz on 11/13/15.
//  Copyright © 2015 Jason Schatz. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var nameWhoLabel: UILabel!
    @IBOutlet weak var responseTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        let oldText: NSString = textField.text!
        let newString = oldText.stringByReplacingCharactersInRange(range, withString: string)
        
        if textField == nameTextField {
            nameWhoLabel.text = "\(newString) Who?"
        }
        
        else if textField == responseTextField {
            
        }
        
        return true
    }
}

