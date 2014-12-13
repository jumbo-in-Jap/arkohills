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
    func tableView(restaurantsTableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.restautrants.count
    }
    
    // セルの内容を変更
    func tableView(restaurantsTableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // 再利用でセル宣言
        let cell:RestaurantTableViewCell = self.restaurantsTableView.dequeueReusableCellWithIdentifier("Cell") as RestaurantTableViewCell
        
        // アクセサリータイプ
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        
        // gnaviというイベントの定義で書くこともできる↓
            // let gnavi: Dictionary<String,AnyObject> =  as Dictionary<String, AnyObject>
            // let name:AnyObject = gnavi["name"]!
        
        // レストランの名前
        cell.nameRestaurant.text = self.restautrants[indexPath.row]["name"] as? String
        
            // レストランの名前の行間を変更
            let attributedText = NSMutableAttributedString(string: cell.nameRestaurant.text!)
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = 5
            attributedText.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: NSMakeRange(0, attributedText.length))
            cell.nameRestaurant.attributedText = attributedText
            // はみ出した部分を「...」で表示
            cell.nameRestaurant.lineBreakMode = NSLineBreakMode.ByTruncatingTail
        
        
        // レストランの平均予算
        let price = self.restautrants[indexPath.row]["budget"] as? String
        cell.priceRestaurant.text = price! + "円"

        // レストランのサムネイル
        //let thumbnail:AnyObject = self.restautrants[indexPath.row]["image_url"]["shop_image1"]
        cell.thumbnailRestaurant.sd_setImageWithURL(NSURL(string: "http://d3lncrho1w0yzl.cloudfront.net/photo1.100x133.jpg"))
        
        // 暫定的解決策
        // swiftのOptional型の罠で、型の変換がややこしいのが原因
        var tlat = self.restautrants[indexPath.row]["latitude"]
        var lat:Double = (("\(tlat!!)") as NSString).doubleValue
        var tlng = self.restautrants[indexPath.row]["longitude"]
        var lng:Double = (("\(tlng!!)") as NSString).doubleValue
        
        // setDistで距離呼び出す
        cell.setDist(lat , lngRestaurant: lng)
    
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


