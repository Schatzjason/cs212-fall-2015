//
//  MovieListViewController.swift
//  MovieList
//
//  Created by ccsfcomputers on 10/29/15.
//  Copyright (c) 2015 Jason Schatz. All rights reserved.
//

import UIKit

class MovieListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var movies: [Movie] = [Movie]()
    
    // This will store out task for downloading movies.
    var task: NSURLSessionTask?
    
    // Here we make a queue that is guaranteed to execute blocks one at a time
    var serialQueue = dispatch_queue_create("MovieListViewController.SerialQueue", DISPATCH_QUEUE_SERIAL)
    
    
    // MARK: - Search Task
    
    func taskForMoviesWithQuerry(querry: String) -> NSURLSessionTask {
    
        let parameters = ["query" : querry]
        
        let url = TheMovieDB.URLForResource(TheMovieDB.Resources.SearchMovie, parameters: parameters)
        
        print(url)

        let task = NSURLSession.sharedSession().dataTaskWithURL(url) { data, response, error in
            
            if let error = error {
                print(error)
                return
            }
            
            dispatch_async(self.serialQueue) {
                
                self.task = nil
                
                if let error = error {print(error);return}

                self.movies = TheMovieDB.moviesFromData(data!)
            
                dispatch_async(dispatch_get_main_queue()) {
                    self.tableView.reloadData()
                }
            }
        }
        
        return task
    }
    
    
    // MARK: - Search Bar Delegate
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        
        dispatch_async(serialQueue) {
            
            if let task = self.task {
                task.cancel()
            }
            
            if searchText.isEmpty {
                self.task = nil
                self.movies = [Movie]()
                
                dispatch_async(dispatch_get_main_queue()) {
                    self.tableView.reloadData()
                }
            } else {
                self.task = self.taskForMoviesWithQuerry(searchText)
                self.task!.resume()
            }
        }
    }
    
    
    // MARK: - Toggle UI while downloading
    
    func setUIToDownloading(isDownloading: Bool) {
        
        if isDownloading {
            self.activityIndicator.startAnimating()
        } else {
            self.activityIndicator.stopAnimating()
        }
        
        self.activityIndicator.hidden = isDownloading
        self.tableView.alpha = isDownloading ? 0.2 : 1.0
    }
    
    // MARK: - Table View
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as! UITableViewCell
        
        let movie = movies[indexPath.row]
        
        cell.textLabel!.text = movie.title
        
        // check for cached image
        if let image = movie.posterImage {
            cell.imageView!.image = image
        } else {
            cell.imageView!.image = UIImage(named: "placeHolder")
            fetchPosterForMovie(movie, cell: cell)
        }
        
        return cell
    }
    
    func fetchPosterForMovie(movie: Movie, cell: UITableViewCell) {
     
        // It this movie does not have an image in the db, we can stop here
        if movie.posterPath == nil {
            cell.imageView!.image = UIImage(named: "noImage")
            return
        }
        
        let url = TheMovieDB.URLForImageWithPath(movie.posterPath!)
                
        let task = NSURLSession.sharedSession().dataTaskWithURL(url) {
            data, response, error in
            
            // Start with no image
            var image = UIImage(named: "noImage")!
            
            // If there is an error, print it, and leve the no-image in place
            if let error = error {
                print(error)
            }
            
            // Otherwise try to make an image
            else if let data = data {
                if let newImage = UIImage(data: data) {
                    image = newImage                // Replace the no-image
                    movie.posterImage = newImage    // Cache it
                }
            }
            
            // Set the cell's image back on the main thread
            dispatch_async(dispatch_get_main_queue()){
                cell.imageView!.image = image
            }
        }
        
        task.resume()
    }
}





