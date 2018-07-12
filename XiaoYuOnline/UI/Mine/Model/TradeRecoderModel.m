//
//  TradeRecoderModel.m
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/5/9.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "TradeRecoderModel.h"
#import <YYKit/NSDictionary+YYAdd.h>

@implementation TradeRecoderModel

- (instancetype)initWithMyInvestListApi:(NSDictionary *)data {
    self = [super init];
    if (self) {
        _account = [data stringValueForKey:@"account" default:nil];
        _createTime = [data floatValueForKey:@"addTime" default:0] / 1000.0;
        NSArray *invest = data[@"billInvests"];
        if (invest && invest.count > 0) {
            NSDictionary *investData = invest[0][@"borrow"];
            _title = [investData stringValueForKey:@"name" default:nil];
            _content = [investData stringValueForKey:@"content" default:nil];
            _bidNumber = [investData stringValueForKey:@"bidNo" default:nil];
            _useReason = [investData stringValueForKey:@"borrowUse" default:nil];
            float totalM = [investData floatValueForKey:@"guarantorMoney" default:0];
            _totalMoney = [NSString stringWithFormat:@"%.2f 元", totalM];
            _yearRatio = [[investData stringValueForKey:@"apr" default:nil] stringByAppendingString:@"%"];
        }
        
    }
    return self;
}

@end
