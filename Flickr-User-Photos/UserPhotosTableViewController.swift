//
//  UserPhotosTableViewController.swift
//  Flickr-User-Photos
//
//  Created by Flatiron School on 10/31/16.
//  Copyright © 2016 jennyshalai. All rights reserved.
//

import UIKit

class UserPhotosTableViewController: UITableViewController {
        
        let store = DataStore.store
        
        override func viewDidLoad() {
            super.viewDidLoad()
            self.store.getUserPhotosWithCompletion (completion: {
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            })
        }
        
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return self.store.userPhotos.count
        }
        
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "photoCell", for: indexPath) as! UserPhotosCell
            //cell.textLabel?.text = self.store.userPhotos[indexPath.row].description
            
            if let url = URL(string: self.store.userPhotos[indexPath.row].photoURL) {
                
                do {
                    let imageData = try Data(contentsOf: url)
                    cell.photo.image = UIImage(data: imageData)
                    
                } catch {
                    print("There was an issue unwrapping the imageData for photo")
                }
            }
            
            cell.name.text = self.store.userPhotos[indexPath.row].userID
            cell.date.text = self.store.userPhotos[indexPath.row].date
            
            return cell
        }
        
}
