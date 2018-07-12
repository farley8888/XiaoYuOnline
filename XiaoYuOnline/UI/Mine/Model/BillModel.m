//
//  BillModel.m
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/4.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "BillModel+Custeffet.h"
#import <YYKit/NSDictionary+YYAdd.h>

@implementation BillModel

- (instancetype)initWithBillListApiData:(NSDictionary *)data {
    self = [super init];
    if (self) {
        _title = [data stringValueForKey:@"typeName" default:nil];
        _moneyDisp = [data stringValueForKey:@"moneyDisp" default:nil];
        _addTime = [data doubleValueForKey:@"addTime" default:0];
        _addTime /= 1000.0;
        _status = [data intValueForKey:@"paymentsType" default:0];
        _remark = [data stringValueForKey:@"remark" default:nil];
    }
    return self;
}

@end
