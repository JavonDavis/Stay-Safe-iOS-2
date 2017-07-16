//
//  MissingChildrenViewController.swift
//  
//
//  Created by Javon Davis on 7/15/17.
//

import UIKit
import FirebaseDatabase
import FirebaseStorage

class MissingChildrenViewController: UIViewController {
    @IBOutlet weak var missingChildrenTableView: UITableView!
    
    var ref: DatabaseReference!
    var storageRef:StorageReference!
    var children = [Child]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up the TableView
        missingChildrenTableView.dataSource = self
        missingChildrenTableView.delegate = self
        missingChildrenTableView.tableFooterView = nil
        
//        missingChildrenTableView.register(UINib(nibName: "MissingChildrenTableViewCell", bundle: nil), forCellReuseIdentifier: "missingChildTableViewCell")
        
        ref = Database.database().reference()
        
        let storage = Storage.storage()
        storageRef = storage.reference()
        
        ref.child("children").observe(.value, with: { snapshot in
            let childrenArray = snapshot.value as? [String : AnyObject] ?? [:]
            print(childrenArray)
//            let results = Child.buildChildren(childrenArray)
//            print(results.count)
//            print(results[0])
            self.children = Child.buildChildren(childrenArray)
            self.missingChildrenTableView.reloadData()
        })
        
    }
    

}
