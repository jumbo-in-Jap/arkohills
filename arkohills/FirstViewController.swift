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
        
        var nib:UINib = UINib(nibName: "restaurantCell", bundle: nil)
        self.restaurantsTableView.registerNib(nib, forCellReuseIdentifier: "Cell")
    }
    
    
    // セルの行数
    func tableView(retaurantsTableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.restautrants.count
    }
    
    // セルの内容を変更
    func tableView(retaurantsTableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // 再利用でセル宣言
        let cell:RestaurantTableViewCell = self.restaurantsTableView.dequeueReusableCellWithIdentifier("Cell") as RestaurantTableViewCell
        
        // アクセサリータイプ
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        
        // レストランの名前
        cell.nameRetaurant.text = self.restautrants[indexPath.row]["name"] as? String
        
            // レストランの名前の行間を変更
            let attributedText = NSMutableAttributedString(string: cell.nameRetaurant.text!)
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = 5
            attributedText.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: NSMakeRange(0, attributedText.length))
            cell.nameRetaurant.attributedText = attributedText
        
        // レストランのサムネイル
        cell.thumbnailRestaurant.setImageWithURL(NSURL(string: "http://path/to/image.webp"))
        
        // setDistで距離呼び出す
        cell.setDist(130.444, lngRestaurant: 134.09)
        
        // 最後にセルを返す！
        return cell
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 120
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


