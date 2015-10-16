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

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

