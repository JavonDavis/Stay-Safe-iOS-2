//
//  Photo.swift
//  
//
//  Created by Javon Davis on 7/15/17.
//
//

import Foundation
import CoreData

struct Photo {
    
    var photoUrl: String?
    var month: String?
    var year: Int16?
    var dateCreated: Date?
    var image: NSData?
    var child: Child?
    
    init(photoUrl:String, month: String, year: Int, image: NSData) {
        self.photoUrl = photoUrl
        self.month = month
        self.year = Int16(year)
        self.image = image
        self.dateCreated = Date()
    }
}
