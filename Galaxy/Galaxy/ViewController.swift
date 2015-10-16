//
//  ViewController.swift
//  Galaxy
//
//  Created by ccsfcomputers on 10/15/15.
//  Copyright (c) 2015 ccsfcomputers. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let GalaxyURL: String = "https://s3.amazonaws.com/policymic-images/oidbjjmfalmyrfd1ohj8sjezcqu7kwxg7bpil5pddk8ky09amyszdhenheurzrj2.jpg"
    
//    let GalaxyURL: String = "http://icons.iconarchive.com/icons/aha-soft/space/256/Galaxy-icon.png"
    
    var request: NSURLRequest!
    var session: NSURLSession!
    var task: NSURLSessionDataTask?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var downloading : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.hidden = true
        progressView.hidden = true
        
        self.request = NSURLRequest(URL: NSURL(string: GalaxyURL)!)
        self.session = NSURLSession.sharedSession()
    }
    
    @IBAction func startOrCancel(sender: UIButton) {
        
        downloading = !downloading
        
        if downloading {
            button.setTitle("Cancel", forState: UIControlState.Normal)
            activityIndicator.hidden = false
            activityIndicator.startAnimating()
            progressView.hidden = false
            startDownload()
        }
            
        else {
            button.setTitle("Start", forState: UIControlState.Normal)
            activityIndicator.hidden = true
            activityIndicator.stopAnimating()
            progressView.hidden = true
            
            assert(task != nil, "Task should not be nil")
            
            task!.cancel()
            task = nil
        }
        
    }
    
    func startDownload() {
        task = session.dataTaskWithRequest(request, completionHandler: {
            data, response, error in
            
            if let error = error {
                println(error)
            } else {
                
                let image = UIImage(data: data)
                
                // This should be sent back to the MAIN Thread
                // Grand Central Dispatch code
                dispatch_async(dispatch_get_main_queue(), {
                    self.downloading = false
                    self.imageView.image = image
                    
                    self.activityIndicator.stopAnimating()
                    self.activityIndicator.hidden = true
                    self.progressView.hidden = true
                    self.button.setTitle("Start", forState: UIControlState.Normal)
                })

                println("Download complete")
            }
        })
        task!.resume()
    }

}







