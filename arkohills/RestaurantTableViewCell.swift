//
//  RestaurantTableViewCell.swift
//  arkohills
//
//  Created by 広野　萌 on 2014/11/05.
//  Copyright (c) 2014年 hhirono. All rights reserved.
//

import UIKit

class RestaurantTableViewCell: UITableViewCell {

    @IBOutlet weak var thumbnailRestaurant: UIImageView!
    @IBOutlet weak var nameRetaurant: UILabel!
    @IBOutlet weak var checkMark: UIImageView!
    
    @IBOutlet weak var priceRestaurant: UILabel!
    
    @IBOutlet weak var distanceRestaurant: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // 緯度経度から距離を算出！
    func setDist(latRestaurant:Double, lngRestaurant:Double)
    {
        // アークヒルズの緯度経度 と レストランの緯度経度をgetDistに渡す
        let dist = util.getDist(35.6658715, 139.7394235, latRestaurant, lngRestaurant)
        self.distanceRestaurant.text = NSString(format: "%.2f", dist)
    }

}
