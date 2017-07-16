//
//  Report.swift
//  Stay Safe Jamaica
//
//  Created by Javon Davis on 7/15/17.
//  Copyright © 2017 Stay Safe Jamaica. All rights reserved.
//

import Foundation

struct Report {
    
    var category: String?
    var description: String?
    var lat: Double?
    var lon: Double?
    var id: String?
    
    init (category: String?, description: String?, lat: Double?, long: Double?) {
        
        self.category = category
        self.description = description
        self.lat = lat
        self.lon = long
    }
    
    func buildObject() -> [String:Any] {
        
        let reportObject = [
            "category": self.category ?? "",
            "description": self.description ?? "",
            "location" : [
                "lat": self.lat,
                "long": self.lon
                ] as! [String: Double]
            
            ] as [String : Any]
        
        return reportObject
    }
    
    static func buildReports(_ reportObjects: [String: Any]) -> [Report] {
        
        var reportArray = [Report]()
        
        for (key, value) in reportObjects {
            
            if let object = value as? [String: Any] {
                if let location = object["location"] as? [String:Double] {
                    
                    var reportObject = Report(category: object["category"] as? String, description: object["description"] as? String, lat: location["lat"]!, long: location["long"]!)
                    reportObject.id = key
                    
                    reportArray.append(reportObject)
                }
            }
        }
        
        print(reportArray)
        
        return reportArray
        
    }
}
