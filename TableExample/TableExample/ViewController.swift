//
//  ViewController.swift
//  TableExample
//
//  Created by ccsfcomputers on 10/8/15.
//  Copyright (c) 2015 ccsfcomputers. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    struct Keys {
        static let Name = "Name"
        static let Description = "Description"
        static let Color = "Color"
    }
    
    var colorDictionaries: [[String : AnyObject]] = [
        [Keys.Name : "Red", Keys.Description : "Color of fire!", Keys.Color : UIColor.redColor()],
        [Keys.Name : "Blue", Keys.Description : "Color of water", Keys.Color : UIColor.blueColor()],
        [Keys.Name : "Green", Keys.Description : "Color of grass", Keys.Color : UIColor.greenColor()],
        [Keys.Name : "Orange", Keys.Description : "Color of the sun!", Keys.Color : UIColor.orangeColor()],
        [Keys.Name : "Yellow", Keys.Description : "Color of lemons", Keys.Color : UIColor.yellowColor()]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Get a cell from the table
        let cell = tableView.dequeueReusableCellWithIdentifier("MyCell") as! UITableViewCell
        
        // Get the data item associated with this row
        let dictionary = colorDictionaries[indexPath.row]
        
        // Decorate the cell (using the data for associated with this indexPath.row
        cell.textLabel!.text = dictionary[Keys.Name] as? String
        cell.detailTextLabel!.text = dictionary[Keys.Description] as? String
        cell.backgroundColor = dictionary[Keys.Color] as? UIColor
        cell.accessoryType = UITableViewCellAccessoryType.DetailButton
        
        // Return the cell to the table
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colorDictionaries.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("Selected row: \(indexPath.row)")
        
        colorDictionaries.removeAtIndex(indexPath.row)
        
        tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Left)
    }
}





