//
//  FirstViewController.swift
//  arkohills
//
//  Created by 広野　萌 on 2014/10/08.
//  Copyright (c) 2014年 hhirono. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var restaurantsTableView: UITableView!
    
//    var restautrants:[AnyObject]!
    var restautrants = [AnyObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        var query = ["format":"json", "keyid":"811da19e50e1a13c3ca9be0662e75f84", "hit_per_page": 20]
        TASKAPI.restaurantGet(NSDictionary(dictionary: query),
            {(res:NSArray!)->Void in
                NSLog("%@", res[0].description)
                self.restautrants = res
                self.restaurantsTableView.reloadData()
            },
            {(err:NSError!)->Void in
                println(err)
        })
        
        self.restaurantsTableView.delegate = self
        self.restaurantsTableView.dataSource = self
        
    }
    
    // セルに表示するテキスト
    
    // セルの行数
    func tableView(retaurantsTableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.restautrants.count
    }
    
    // セルの内容を変更
    func tableView(retaurantsTableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = self.restautrants[indexPath.row]["name"] as? String
        return cell
    }
    
//    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//        <#code#>
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


