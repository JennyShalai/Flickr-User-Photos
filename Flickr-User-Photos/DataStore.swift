//
//  DataStore.swift
//  Flickr-User-Photos
//
//  Created by Flatiron School on 10/31/16.
//  Copyright © 2016 jennyshalai. All rights reserved.
//

import Foundation


class DataStore {
    
    static let store = DataStore()
    var userPhotos: [UserPhoto] = []
    
    let userID: String = "24597348@N03"
    
    func getUserPhotosWithCompletion(completion: @escaping () -> ()) {
        
        // get data from API and inits photos objects
        FlickrAPI.getUserPhotosInSession(userID: userID) {
            (photosData) in
            
            if let photosDict = photosData["items"] as? [NSDictionary] {
                
                self.userPhotos.removeAll()
                
                for dict in photosDict {
                    
                    // parse JSON
                    let user: String = dict["author_id"] as! String
                    let date: String = dict["date_taken"] as! String
                    let linkInfo: NSDictionary = dict["media"] as! NSDictionary
                    let link: String = linkInfo["m"] as! String
                    
                    // init new instance of photot
                    let photo: UserPhoto = UserPhoto.init(userID: user, photoURL: link, date: date)
                    
                    // add photo to store
                    self.userPhotos.append(photo)
                }
            }
            
            if self.userPhotos.count > 0 {
                completion()
            }
        }
    }
    
    
    
}
