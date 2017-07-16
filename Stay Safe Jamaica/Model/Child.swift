//
//  Child.swift
//  
//
//  Created by Javon Davis on 7/15/17.
//
//

import Foundation

struct Child {
    
    var firstName: String?
    var lastName: String?
    var age: Int16?
    var lastSeen: Date?
    var isMale: Bool?
    var photos = [Photo]()
    
    init(firstName: String, lastName: String, age: Int, lastSeen: Date, isMale: Bool) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = Int16(age)
        self.lastSeen = lastSeen
        self.isMale = isMale
    }
}
