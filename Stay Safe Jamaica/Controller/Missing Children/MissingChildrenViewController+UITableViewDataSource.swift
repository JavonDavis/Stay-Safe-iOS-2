//
//  MissingChildrenViewController+UITableViewDataSource.swift
//  Stay Safe Jamaica
//
//  Created by QualityWorks on 7/15/17.
//  Copyright © 2017 Stay Safe Jamaica. All rights reserved.
//

import Foundation
import UIKit

extension MissingChildrenViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return children.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "missingChildTableViewCell") as! MissingChildrenTableViewCell
        
        let child = children[indexPath.row]
        cell.childNameLabel.text = "\(child.firstName!) \(child.lastName!)"
        cell.childMissingSinceLabel.text = "Missing since \(child.missingSince!)"
        cell.childLastSeenLabel.text = "Last scene at \(child.lastSeen!)"
        
        storageRef.child(child.photos[0]).getData(maxSize: 1 * 1024 * 1024) { (data, error) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                let image = UIImage(data: data!)
                cell.childImageView.image = image
                cell.childImageView.setCornerRadius(radius: 10)
                cell.childImageView.clipsToBounds = true
            }
        }
        return cell
    }
}
