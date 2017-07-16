//
//  MissingChildrenViewController.swift
//  
//
//  Created by Javon Davis on 7/15/17.
//

import UIKit

class MissingChildrenViewController: UIViewController {
    @IBOutlet weak var missingChildrenTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up the TableView
        missingChildrenTableView.dataSource = self
        missingChildrenTableView.delegate = self
        
        missingChildrenTableView.register(UINib(nibName: "MissingChildrenTableViewCell", bundle: nil), forCellReuseIdentifier: "missingChildTableViewCell")
    }

}
