//
//  TaskAPI.swift
//  arkohills
//
//  Created by 広野　萌 on 2014/10/08.
//  Copyright (c) 2014年 hhirono. All rights reserved.
//

import UIKit

class TASKAPI: NSObject {
    class func restaurantGet(query:NSDictionary!,
        success: ((NSArray!) -> Void)!,
        failure: ((NSError!) -> Void)!)->Void
    {
        var operationCtn:NSInteger = NetworkManager.sharedInstance.operationQueue.operationCount
        if(operationCtn == 0){
            
            NetworkManager.sharedInstance.GET(
                "ver1/RestSearchAPI/?",
                parameters: query,
                success:
                {(operaton:AFHTTPRequestOperation!, response:AnyObject!)->Void in
                    //                    var res:NSDictionary = response as NSArray
                    if let restaurants:AnyObject! = response["rest"]
                    {
                        success(restaurants as NSArray)
                    }
                },
                failure:
                {(operation:AFHTTPRequestOperation!, err:NSError!)->Void in
                    failure(err)
                }
            )
        }
    }
    
    func get(query:NSDictionary!,
        success: ((NSDictionary!) -> Void)!,
        failure: ((NSError!) -> Void)!)
    {
        
    }
}
