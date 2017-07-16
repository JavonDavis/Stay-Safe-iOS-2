//
//  MissingChildrenTableViewCell.swift
//  Stay Safe Jamaica
//
//  Created by Javon Davis on 7/15/17.
//  Copyright © 2017 Stay Safe Jamaica. All rights reserved.
//

import UIKit

class MissingChildrenTableViewCell: UITableViewCell {
    @IBOutlet weak var childImageView: UIImageView!
    @IBOutlet weak var childNameLabel: UILabel!
    @IBOutlet weak var childAgeLabel: UILabel!
    @IBOutlet weak var childLastSeenLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
