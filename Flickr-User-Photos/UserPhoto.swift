//
//  UserPhoto.swift
//  Flickr-User-Photos
//
//  Created by Flatiron School on 10/31/16.
//  Copyright © 2016 jennyshalai. All rights reserved.
//

import Foundation

class UserPhoto: CustomStringConvertible {
    
    var userID: String
    var photoURL: String
    var date: String
    var description: String {
        return "\(self.userID) \(self.date)"
    }
    
    init(userID: String, photoURL: String, date: String) {
        
        self.userID = userID
        self.photoURL = photoURL
        self.date = date
    }
    
}
