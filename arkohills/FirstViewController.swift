//
//  FirstViewController.swift
//  arkohills
//
//  Created by 広野　萌 on 2014/10/08.
//  Copyright (c) 2014年 hhirono. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        var query = ["key":"value"]
        TASKAPI.restaurantGet(NSDictionary(query),
            {(res:NSArray!)->Void in
                NSLog("%@", res[0].description)
            },
            {(err:NSError!)->Void in
        })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


