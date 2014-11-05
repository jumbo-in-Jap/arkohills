//
//  util.m
//  arkohills
//
//  Created by 広野　萌 on 2014/11/05.
//  Copyright (c) 2014年 hhirono. All rights reserved.
//

#import "util.h"
#import <CoreLocation/CoreLocation.h>

@implementation util

+(double)getDist:(double)latA :(double)lngA :(double)latB :(double)lngB
{

    // 経緯・緯度からCLLocationを作成
    CLLocation *A = [[CLLocation alloc] initWithLatitude:latA longitude:lngA];
    CLLocation *B = [[CLLocation alloc] initWithLatitude:latB longitude:lngB];
    
    //　距離を取得
    CLLocationDistance distance = [A distanceFromLocation:B];
    
    // 距離をコンソールに表示
    NSLog(@"distance:%f", distance);
    return distance;
}
@end
