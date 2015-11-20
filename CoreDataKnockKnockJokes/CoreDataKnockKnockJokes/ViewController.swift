//
//  ViewController.swift
//  CoreDataKnockKnockJokes
//
//  Created by ccsfcomputers on 11/19/15.
//  Copyright (c) 2015 ccsfcomputers. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Get our core data classes
        let delegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = delegate.managedObjectContext!
        let entity = NSEntityDescription.entityForName("Joke", inManagedObjectContext: context)!

        // Add another Boo Who joke
        let newJoke = NSManagedObject(entity: entity, insertIntoManagedObjectContext: context) as! Joke
        newJoke.name = "Boo"
        newJoke.answer = "Don't cry it's just a joke."
        context.save(nil)
        
        // Fetch all the jokes, so see if the collection is really growing
        let request = NSFetchRequest(entityName: "Joke")
        let jokes = context.executeFetchRequest(request, error: nil)!
        
        for joke in jokes {
            print("who's there: \(joke.name). \(joke.name) who?. \(joke.answer)\n")
        }
    }
}

