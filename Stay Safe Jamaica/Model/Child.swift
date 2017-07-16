//
//  Child.swift
//  
//
//  Created by Javon Davis on 7/15/17.
//
//

import Foundation

enum ChildAttribute: String {
    case hairColor = "Hair Color", race = "Race"
}
struct Child {
    
    var id: String?
    var firstName: String?
    var lastName: String?
    var age: Int?
    var description: String?
    var lastSeen: String?
    var missingSince: String?
    var isMale: Bool?
    var photos = [String]()
    var lat: Double?
    var lon: Double?
    var contactNumber: String?
    var height: String?
    var attributes = [ChildAttribute: String]()
    
    static func buildChildren(_ childObjects: [String: Any]) -> [Child] {
        var children = [Child]()
        
        for (key, value) in childObjects {
            var child = Child()
            if let object = value as? [String: Any] {
                if let location = object["location"] as? [String:Any] {
                    child.lat = Double(location["lat"] as! NSNumber)
                    child.lon = Double(location["lon"] as! NSNumber)
                }
                    
                child.firstName = object["firstName"] as? String ?? ""
                child.lastName = object["lastName"] as? String ?? ""
                child.height = object["height"] as? String ?? ""
                child.lastSeen = object["lastSeen"] as? String ?? ""
                child.missingSince = object["missingSince"] as? String ?? ""
                child.contactNumber = object["contactNumber"] as? String ?? ""
                child.age = object["age"] as? Int ?? 0
                child.id = key
                
                if let photos = object["photos"] as? [String] {
                    child.photos = photos
                }
                
            }
            children.append(child)
        }
        
        return children
    }
}
