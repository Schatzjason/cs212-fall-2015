//
//  MovieListViewController.swift
//  MovieList
//
//  Created by ccsfcomputers on 10/29/15.
//  Copyright (c) 2015 Jason Schatz. All rights reserved.
//

import UIKit

class MovieListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var tableView: UITableView!
    
    var movies: [Movie] = [Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let parameters = ["id" : 33]
        
        let url = TheMovieDB.URLForResource(TheMovieDB.Resources.PersonIDMovieCredits, parameters: parameters)

        let task = NSURLSession.sharedSession().dataTaskWithURL(url) { data, response, error in
            
            dispatch_async(dispatch_get_main_queue()) {
                self.activityIndicator.stopAnimating()
                self.activityIndicator.hidden = true
                self.tableView.alpha = 1.0
            }
            
            if let error = error {print(error);return}

            self.movies = TheMovieDB.moviesFromData(data)
            
            dispatch_async(dispatch_get_main_queue()) {
                self.tableView.reloadData()
            }
        }
        
        task.resume()
        
        self.activityIndicator.startAnimating()
        self.activityIndicator.hidden = false
        self.tableView.alpha = 0.2
    }
    
    // MARK: - Table View
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as! UITableViewCell
        
        let movie = movies[indexPath.row]
        
        cell.textLabel!.text = movie.title
        
        return cell
    }
}
