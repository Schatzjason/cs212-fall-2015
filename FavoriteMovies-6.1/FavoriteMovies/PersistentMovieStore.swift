//
//  PersistentMovieStore.swift
//  FavoriteMovies
//
//  Created by Jason Schatz on 11/11/15.
//  Copyright © 2015 Jason Schatz. All rights reserved.
//

import Foundation

class PersistentMovieStore {
    
    private var movieArray: [Movie]! = nil
    private var name: String
    
    init (_ name: String) {
        self.name = name
        
        movieArray = open()
        
        // look at the hard drive to see if we already have array data
    }
    
    var movies: [Movie] {
        return movieArray
    }
    
    func append(movie: Movie) {
        if !contains(movie) {
            movieArray.append(movie)
        }
        
        save()
    }
    
    func remove(movie: Movie) {
        var i = 0
        
        for i = 0; i < movieArray.count; i++ {
            if movie.id == movieArray[i].id {
                removeAtIndex(i)
                return
            }
        }
        
        save()
    }
    
    func removeAtIndex(index: Int) {
        movieArray.removeAtIndex(index)
        
        save()
    }
    
    func contains(movie: Movie) -> Bool {
        for m in movieArray {
            if m.id == movie.id {
                return true
            }
        }
        
        return false
    }
    
    private func save() {
        // Save the array
        // We need to map our array of movies to an array of dictionaries.
        let dictionaries = movies.map(){
            $0.toDictionary()
        }
        
        let data = NSJSONSerialization.dataWithJSONObject(dictionaries, options: NSJSONWritingOptions.PrettyPrinted, error: nil)!
        
        data.writeToURL(fileURL(), atomically: true)
    }
    
    private func open() -> [Movie] {
        
        let data = NSData(contentsOfURL: fileURL())
        if let data = data {
            
            let dictionaries = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions(), error: nil)! as! [[String : AnyObject]]
            
            let movies = dictionaries.map() {
                Movie(dictionary: $0)   // takes [dictionaries] and maps to [Movie]
            }
            return movies
            
        } else {
            return [Movie]()    // make a brand-new empty array
        }
    }
    
    private func fileURL() -> NSURL {
        // get a URL for the Document directory
        let directoryURL = NSFileManager.defaultManager().URLsForDirectory(NSSearchPathDirectory.DocumentDirectory, inDomains: NSSearchPathDomainMask.UserDomainMask).first! as! NSURL
        
        // append name
        let fileURL = directoryURL.URLByAppendingPathComponent("\(name).json", isDirectory: false)
        return fileURL
    }
}
