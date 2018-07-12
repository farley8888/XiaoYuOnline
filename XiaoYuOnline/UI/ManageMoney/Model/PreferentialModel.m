//
//  XYPreferentialModel.m
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/5/12.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "PreferentialModel.h"
#import <YYKit/NSDictionary+YYAdd.h>

@implementation PreferentialModel

- (instancetype)initWithApiData:(NSDictionary *)data {
    self = [super init];
    if (self) {
        _preferentialID = [data stringValueForKey:@"id" default:nil];
        _module = [data stringValueForKey:@"module" default:nil];
        _count = [data integerValueForKey:@"count" default:0];
        _obtainTime = [data floatValueForKey:@"obtaintime" default:0] / 1000.0;
        
        _name = [data stringValueForKey:@"ticketName" default:nil];;
        _usableMoney = [data stringValueForKey:@"lowest_money" default:nil];
        _value = [data stringValueForKey:@"ticketAmount" default:nil];
        // 121438，121446
        NSNumber *type = data[@"id"];
        if ([type isEqualToNumber:@(121438)]) {
            _type = XYPreferentialTypeBonus;
        } else if ([type isEqualToNumber:@(121446)]) {
            _type = XYPreferentialTypeCashTicket;
        }
    }
    return self;
}

@end
