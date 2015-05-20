//
//  APIController.swift
//  Sample-Swift_instagram
//
//  Created by RYPE on 14/05/2015.
//  Copyright (c) 2015 weareopensource. All rights reserved.
//

import Foundation


/**************************************************************************************************/
// Protocol
/**************************************************************************************************/
protocol APIControllerProtocol {
    func didReceiveAPIResults(results: NSArray)
}

/**************************************************************************************************/
// Class
/**************************************************************************************************/
class APIController {
    
    /*************************************************/
    // Main
    /*************************************************/
    
    // Var
    /*************************/
    var delegate: APIControllerProtocol
    
    // init
    /*************************/
    init(delegate: APIControllerProtocol) {
        self.delegate = delegate
    }
    
    /*************************************************/
    // Functions
    /*************************************************/
    func get(path: String) {
        let url = NSURL(string: path)
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithURL(url!, completionHandler: {data, response, error -> Void in
            println("Task completed")
            if(error != nil) {
                // If there is an error in the web request, print it to the console
                println(error.localizedDescription)
            }
            var err: NSError?
            if let jsonResult = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &err) as? NSDictionary {
                if(err != nil) {
                    // If there is an error parsing JSON, print it to the console
                    println("JSON Error \(err!.localizedDescription)")
                }
                if let results: NSArray = jsonResult["data"] as? NSArray {
                    self.delegate.didReceiveAPIResults(results)
                }
            }
        })
        
        // The task is just an object with all these properties set
        // In order to actually make the web request, we need to "resume"
        task.resume()
    }
    
    func instagram() {
        get("https://api.instagram.com/v1/users/\(GlobalConstants.TwitterInstaUserId)/media/recent/?access_token=\(GlobalConstants.TwitterInstaAccessToken)")
    }
    
}

