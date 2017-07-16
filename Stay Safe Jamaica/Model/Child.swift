//
//  Child.swift
//  
//
//  Created by Javon Davis on 7/15/17.
//
//

import Foundation

enum ChildAttribute: String {
    case height = "Height", hairColor = "Hair Color", race = "Race"
}
struct Child {
    
    var firstName: String?
    var lastName: String?
    var age: Int
    var lastSeen: Date?
    var isMale: Bool?
    var photos = [Photo]()
    var attributes = [ChildAttribute: String]()
    
    init(firstName: String, lastName: String, age: Int, lastSeen: Date, isMale: Bool) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        self.lastSeen = lastSeen
        self.isMale = isMale
    }
}
