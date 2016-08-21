//
//  APIManager.swift
//  bluntApp
//
//  Created by davix on 8/20/16.
//  Copyright © 2016 geniemedialabs. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class APIManager{
    
    var delegate : APIOnCompleteCallBack
    
    init(delegate : APIOnCompleteCallBack){
        
        self.delegate = delegate
    }

    func login() -> Bool {
        
        let manager = Alamofire.Manager.sharedInstance
        let urlstring = "http://localhost:3000/users/facebook/login"
        let parameters: [String: AnyObject] = [
            "facebook": [ "token" : "EAAOzf3Dc5dYBADaZAm2CZAWeGX2XXp0VZB7XNx8bs6ZCBsl8bcThLv5DQON78vlxrPTZAdB9yv1bPRnd9drxRUU01Vs9drtmpvh54lbZCZAv3gHW0IvkAYBw9DZB3P2ArKPZAtHASM7Fujr4ZC5doHacJWqbHy5cdrazm99OLmMj4DbQwdHuNArciu"]
        ]
        manager.request(.POST, urlstring, parameters: parameters, encoding: .JSON)
            .responseJSON { response in
                print(response.request)  // original URL request
                print(response.response) // URL response
                print(response.data)     // server data
                print(response.result)   // result of response serialization
                
                switch response.result {
                case .Success:
                    
                    print("Validation Successful")
                    print(response)
                    self.delegate.onNetworkSuccess((response.data)!)
                    //FIRE SUCCESS DELEGATE
                    
                
                case .Failure(let error):
                    
                    print(error)
                    self.delegate.onNetworkFailure(404, message: "Network Called Failed")
                    //FIRE FAILURE DELEGATE
                    
                }
        }
        
        return true;
        
    }
    
    func getFilteredUsers(userId : String) -> Bool {
        
        let manager = Alamofire.Manager.sharedInstance
        let urlstring = "http://localhost:3000/users/" + userId
        let parameters: [String: AnyObject] = [
            "user": [ "latitude" : "51.5" , "longitude" : "0.128" ]
        ]
        manager.request(.GET, urlstring, parameters: parameters, encoding: .JSON)
            .responseJSON { response in
                print(response.request)  // original URL request
                print(response.response) // URL response
                print(response.data)     // server data
                print(response.result)   // result of response serialization
                
                switch response.result {
                case .Success:
                    
                    print("Validation Successful")
                    print(response)
                    self.delegate.onNetworkSuccess((response.data)!)
                    //FIRE SUCCESS DELEGATE
                    
                    
                case .Failure(let error):
                    
                    print(error)
                    self.delegate.onNetworkFailure(404, message: "Network Called Failed")
                    //FIRE FAILURE DELEGATE
                    
                }
        }
        
        return true;
        
    }
    
}