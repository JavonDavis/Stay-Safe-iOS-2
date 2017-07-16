//
//  HttpManager.swift
//  Stay Safe Jamaica
//
//  Created by Jamel Reid  on 7/15/17.
//  Copyright © 2017 Stay Safe Jamaica. All rights reserved.
//

import Foundation
import Alamofire

// Encapsulates the logic for sending various HTTP Requests
class HttpManager {
    
    static var shared = HttpManager()
    
    func get(url: String, parameters: Dictionary<String, Any>, completion: @escaping (DataResponse<Any>) -> ()){
        Alamofire.request(url, parameters: parameters).responseJSON(completionHandler: completion)
    }
    
    func get(url: String, completion: @escaping (DataResponse<Any>) -> ()){
        Alamofire.request(url).responseJSON(completionHandler: completion)
    }
    
    func post(url: String!, parameters: Dictionary<String, Any>, completion: @escaping (DataResponse<Any>) -> ()){
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON(completionHandler: completion)
    }
}
