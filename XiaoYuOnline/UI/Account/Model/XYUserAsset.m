//
//  XYUserAsset.m
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/25.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "XYUserAsset.h"
#import <YYKit/NSDictionary+YYAdd.h>

@implementation XYUserAsset

- (instancetype)initWithMineAssetApiData:(NSDictionary *)data {
    self = [super init];
    if (self) {
        NSString *total = [data[@"account"] stringValueForKey:@"total" default:nil];
        NSString *freezed = [data[@"account"] stringValueForKey:@"noUseMoney" default:nil];
        NSString *useable = [data[@"account"] stringValueForKey:@"useMoney" default:nil];
        NSString *totalProfit = [data stringValueForKey:@"sumInterest" default:nil];
        
        _total = total;
        _freezed = freezed;
        _totalProfit = totalProfit;
        _useable = useable;
    }
    return self;
}

@end
