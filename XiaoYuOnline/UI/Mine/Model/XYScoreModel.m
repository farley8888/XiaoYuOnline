//
//  XYScoreModel.m
//  XiaoYuOnline
//
//  Created by WilliamChen on 2018/5/24.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "XYScoreModel.h"

@implementation XYScoreModel

- (instancetype)initWithScoreShopListData:(NSDictionary *)data {
    self = [super init];
    if (self) {
        _scoreID = [data stringValueForKey:@"id" default:nil];
        _title = [data[@"ticket"] stringValueForKey:@"ticketName" default:nil];
        _validDate = [data[@"ticket"] intValueForKey:@"effectiveTime" default:0];
        _score = [data stringValueForKey:@"productAmount" default:nil];
        _cashValue = [data[@"ticket"] stringValueForKey:@"ticketAmount" default:nil];
    }
    return self;
}

@end
