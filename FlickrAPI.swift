//
//  FlickrAPI.swift
//  Flickr-User-Photos
//
//  Created by Flatiron School on 10/31/16.
//  Copyright © 2016 jennyshalai. All rights reserved.
//

import Foundation

class FlickrAPI {
    
    static let apiKey: String = "3811291d25152b30d8d4faf4e0137225"
    
    class func getUserPhotosInSession(userID: String, completionHandler: @escaping (NSDictionary) ->()) {
        
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        let flickrURL = URL(string: "https://api.flickr.com/services/feeds/photos_public.gne?id=\(userID)&format=json&nojsoncallback=1")
        
        let task = session.dataTask(with: flickrURL!) {
            (data, response, error) in
            
            //let responseString:String = String(data: data!, encoding: String.Encoding.utf8)!
            //let jsonInput = responseString.data(using: String.Encoding.utf8)!
            
            if let data = data {
                
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: []) as! NSDictionary
                    completionHandler(json)
                } catch {
                    print(error)
                }
            }
        }
        task.resume()
    }
    
}
