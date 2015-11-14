//
//  PersistentJokeStore.swift
//  KnockKnock
//
//  Created by Jason Schatz on 11/13/15.
//  Copyright © 2015 Jason Schatz. All rights reserved.
//

import Foundation

class PersistentJokeStore {
    
    struct Keys {
        static let Name = "PersistentJokeStore.Name"
        static let Response = "PersistentJokeStore.Response"
    }
    
    private var _name: String?
    private var _response: String?
    
    // Name Property.
    var name: String? {
        
        set(value) {
            _name = value
            save()
        }
        
        get {
            return _name
        }
    }
    
    // Response Property
    var response: String? {
        set(value) {
            _response = value
            save()
        }
        
        get {
            return _response
        }
    }
    
    init() {
        if let dictionary = openDictionary() {
            _name = dictionary[Keys.Name] as? String
            _response = dictionary[Keys.Response] as? String
        } else {
            _name = "Canoe"
            _response = "Canoe Help Me With My Homework?"
        }
    }
    
    private func save() {
        // Create a dictionary with Name and Response keys to store the objects data
        // Convert the dictionary into JSON data
        // Save the data to a file in the documents directory
    }
    
    func openDictionary() -> [String : AnyObject]? {
        // read the contents of the saved file. If the file is there, you will have JSON data
        // Unserialize the JSON data into a [String : AnyObject] dictionary
        
        return nil
    }
}