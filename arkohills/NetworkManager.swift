//
//  NetworkManager.swift
//  arkohills
//
//  Created by 広野　萌 on 2014/10/08.
//  Copyright (c) 2014年 hhirono. All rights reserved.
//

import UIKit

class NetworkManager: AFHTTPRequestOperationManager {
    class var sharedInstance : NetworkManager {
    struct Static {
        static var onceToken : dispatch_once_t = 0
        static var instance : NetworkManager? = nil
        }
        dispatch_once(&Static.onceToken) {
            
            Static.instance = NetworkManager(baseURL: NSURL(string: "http://api.gnavi.co.jp/"))
            Static.instance?.securityPolicy = AFSecurityPolicy.defaultPolicy()
            
        }
        return Static.instance!
    }
}
