    //
//  DatabaseManager.swift
//  Stay Safe Jamaica
//
//  Created by Jamel Reid  on 7/15/17.
//  Copyright © 2017 Stay Safe Jamaica. All rights reserved.
//

import Foundation
    
typealias RequestCallback = (Error?) -> ()
typealias SuccessCallback = (Bool) ->()
    
class DatabaseManager {
    
    static var shared = DatabaseManager()
    let httpManager = HttpManager.shared
    
    var reports = [Report]()
    var children = [Child]()
    
    func createReport( report: Report, completion: @escaping SuccessCallback) {
        
        let serverUrl = Constants.Path.serverUrl + Constants.Path.postReport
        
        let objectPatameters = report.buildObject()
        
        httpManager.post(url: serverUrl, parameters: objectPatameters, completion: { response in
            
            if let serverResponse = response.result.value as? [String : Any] {
                if let error = serverResponse["error"] as? String {
                    print("Server Error \(error)")
                    completion(false)
                } else {
                    if let success = serverResponse["success"] as? Bool {
                        print("Sucess: \(success)")
                        completion(success)
                    }
                }
            } else {
                print(response)
                completion(false)
            }
        });
        
    }
    
    func loadReports(completion: @escaping RequestCallback){
        
        let serverUrl = Constants.Path.serverUrl + Constants.Path.reportList
        
        print(serverUrl)
        
        httpManager.get(url: serverUrl, completion: { response  in
            
            if let results = response.result.value as? [String: Any] {
                print(results)
                self.reports = Report.buildReports(results)
                
                completion(nil)
            } else {
                
                if let error = response.error {
                    completion(error)
                } else {
                    let error = response.result.value as? String
                    let userInfo = [NSLocalizedDescriptionKey : error]
                    completion(NSError(domain: "ServerError", code: 1, userInfo: userInfo))
                }
                
            }
        });
    }
    
    func createMissingChild(_ child: Child, completion: RequestCallback) {
        let serverUrl = Constants.Path.serverUrl + Constants.Path.childrenList
        
        print(serverUrl)
        
        httpManager.get(url: serverUrl, completion: { response  in
            
        });
    }
    
    func loadMissingChildren(completion: RequestCallback) {
        let serverUrl = Constants.Path.serverUrl + Constants.Path.childrenList
        
        print(serverUrl)
        
        httpManager.get(url: serverUrl, completion: { response  in
            
        });
    }
    
    
}
