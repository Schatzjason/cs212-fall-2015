//
//  TheMovieDB.swift
//  TheMovieDB
//
//  Created by Jason Schatz on 1/10/15.
//

import Foundation

class TheMovieDB : NSObject {
    
    typealias CompletionHander = (result: AnyObject!, error: NSError?) -> Void
    
    var session: NSURLSession
    
    override init() {
        session = NSURLSession.sharedSession()
        super.init()        
    }

    
    // MARK: - URL Helper
    
    class func URLForResource(resource: String, parameters: [String : AnyObject]) -> NSURL {
        var mutableParameters = parameters
        var mutableResource = resource
        
        // Add in the API Key
        mutableParameters["api_key"] = Constants.ApiKey
        
        // Substitute the id parameter into the resource
        if resource.rangeOfString(":id") != nil {
            assert(parameters[Keys.ID] != nil)
            
            mutableResource = mutableResource.stringByReplacingOccurrencesOfString(":id", withString: "\(parameters[Keys.ID]!)")
            mutableParameters.removeValueForKey(Keys.ID)
        }
        
        let urlString = Constants.BaseURL + mutableResource + TheMovieDB.escapedParameters(mutableParameters)
        let url = NSURL(string: urlString)!
        
        return url
    }
    
    class func URLForImageWithPath(filePath: String, var size: String? = nil) -> NSURL {
        
        size = size ?? "w154"
        
        let baseURL = NSURL(string: Constants.BaseImageURL)!
        
        return baseURL.URLByAppendingPathComponent(size!).URLByAppendingPathComponent(filePath)
    }
    
    
    // URL Encoding a dictionary into a parameter string
    
    class func escapedParameters(parameters: [String : AnyObject]) -> String {
        
        if parameters.isEmpty {
            return ""
        }
        
        var urlKeyValuePairs = [String]()

        for (key, value) in parameters {
            
            // make sure that it is a string value
            let stringValue = "\(value)"
            
            // Escape it
            let escapedValue = stringValue.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())
            
            // Append it
            
            if let escapedValue = escapedValue {
                let keyValuePair = "\(key)=\(escapedValue)"
                urlKeyValuePairs.append(keyValuePair)
            } else {
                print("Warning: trouble excaping string \"\(stringValue)\"")
            }
        }
        
        return join("&", urlKeyValuePairs)
        //return urlKeyValuePairs.joinWithSeparator("&") // More modern approach...
    }
    
    
    // MARK: - Shared Image Cache

    struct Caches {
        static let imageCache = ImageCache()
    }

}