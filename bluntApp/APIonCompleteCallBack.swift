//
//  APIonCompleteCallBack.swift
//  bluntApp
//
//  Created by davix on 8/20/16.
//  Copyright © 2016 geniemedialabs. All rights reserved.
//

import Foundation

protocol APIOnCompleteCallBack{
    
    func onNetworkSuccess(nsobject : NSObject) -> Void
    func onNetworkFailure(statusCode : Int , message : String) -> Void
    
}