//
//  CardBagModel.m
//  XiaoYuOnline
//
//  Created by ChenWei on 2018/5/15.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "CardBagModel.h"
#import <YYKit/NSDictionary+YYAdd.h>

@implementation CardBagModel

- (instancetype)initWithApiData:(NSDictionary *)data {
    self = [super init];
    if (self) {
        _ticketID = [data stringValueForKey:@"id" default:nil];
        _used = [[data stringValueForKey:@"usestatus" default:nil] isEqualToString:@"2"];
        _valid = ![data[@"ticket"] boolValueForKey:@"isValidata" default:NO];
        _useableMoney = [data[@"ticket"] stringValueForKey:@"lowestMoney" default:nil];
        _value = [data[@"ticket"] stringValueForKey:@"ticketAmount" default:nil];
        _ticketName = [data[@"ticket"] stringValueForKey:@"ticketName" default:nil];
        _validDate = [data floatValueForKey:@"obtaintime" default:0] / 1000.0;
    }
    return self;
}

@end
