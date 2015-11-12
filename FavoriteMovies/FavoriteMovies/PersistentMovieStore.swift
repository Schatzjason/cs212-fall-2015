//
//  PersistentMovieStore.swift
//  FavoriteMovies
//
//  Created by Jason Schatz on 11/11/15.
//  Copyright © 2015 Jason Schatz. All rights reserved.
//

import Foundation

class PersistentMovieStore {
    
    private var movieArray = [Movie]()
    private var name: String
    
    init (_ name: String) {
        self.name = name
    }
    
    var movies: [Movie] {
        return movieArray
    }
    
    func append(movie: Movie) {
    }
    
    func remove(movie: Movie) {
    }
    
    func removeAtIndex(index: Int) {
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
    }
    
    private func fileURL() -> NSURL {
        return NSURL(string: "")!
    }
}