//
//  MovieListViewController.swift
//  MovieList
//
//  Created by ccsfcomputers on 10/29/15.
//  Copyright (c) 2015 Jason Schatz. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var tableView: UITableView!
    
    var favoriteMovieStore: PersistentMovieStore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let delegate = UIApplication.sharedApplication().delegate as! AppDelegate
        favoriteMovieStore = delegate.favoriteMovieStore
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
    // MARK: - Table View Data Source
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteMovieStore.movies.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell")!
        
        let movie = favoriteMovieStore.movies[indexPath.row]
        
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
    
    // MARK: - Table View Delegate
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        // We only delete
        assert(editingStyle == UITableViewCellEditingStyle.Delete)
        
        // Remove the movie from the store
        // Remove the movie from the table
    }
}
