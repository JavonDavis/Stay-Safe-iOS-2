//
//  MissingChildrenViewController+UITableViewDelegate.swift
//  Stay Safe Jamaica
//
//  Created by Javon Davis on 7/15/17.
//  Copyright © 2017 Stay Safe Jamaica. All rights reserved.
//

import Foundation
import UIKit

extension MissingChildrenViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "profile", sender: nil)
    }
}
