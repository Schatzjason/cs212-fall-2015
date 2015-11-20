//
//  Joke.swift
//  CoreDataKnockKnockJokes
//
//  Created by ccsfcomputers on 11/19/15.
//  Copyright (c) 2015 ccsfcomputers. All rights reserved.
//

import Foundation
import CoreData

@objc class Joke: NSManagedObject {

    @NSManaged var name: String
    @NSManaged var answer: String
    @NSManaged var rating: NSNumber

}
