//
//  XYBidModel.m
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/27.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "BidModel.h"
#import <YYKit/NSDictionary+YYAdd.h>

@implementation BidModel

- (instancetype)initWithHomePageListApi:(NSDictionary *)data {
    self = [super init];
    if (self) {
        _title = [data stringValueForKey:@"name" default:nil];
        _bidID = [data stringValueForKey:@"id" default:nil];
        _bidNumber = [data stringValueForKey:@"bidNo" default:nil];
        _awardMoney = [data stringValueForKey:@"award" default:nil];
        float yearRatio = [data floatValueForKey:@"apr" default:0];
        _yearProfitRatio = [NSString stringWithFormat:@"%.2f", yearRatio];
        _planLimitMonth = [data stringValueForKey:@"timeLimit" default:@""];
        _planTotal = [data stringValueForKey:@"account" default:@""];
        _isNovice = [data boolValueForKey:@"isNovice" default:NO];
        _restTime = [NSString stringWithFormat:@"%@ 天", [data stringValueForKey:@"validTime" default:nil]];
        NSInteger numT = [data integerValueForKey:@"account" default:0];
        NSInteger alT = [data integerValueForKey:@"accountYes" default:0];
        _investableVolume = [NSString stringWithFormat:@"%@", @(numT - alT)];
        _investProgress = [data floatValueForKey:@"scales" default:0] / 100;
        float progress = [data floatValueForKey:@"scales" default:0];
        _progressString = [NSString stringWithFormat:@"%d%%", (int)progress];
        _reapymentType = [data intValueForKey:@"style" default:0];
        _content = [data stringValueForKey:@"content" default:nil];
        
        NSInteger scales = [data integerValueForKey:@"scales" default:0];
        NSInteger status = [data integerValueForKey:@"status" default:-1];
        if (status == 1 && scales < 100) {
            _status = XYBidStatusBuyNow;
            _statusText = @"立即抢购";
        } else if((status == 1 && scales >= 100) || status == 2) {
            _status = XYBidStatusSellOut;
            _statusText = @"已售完";
        } else if (status == 3) {
            _status = XYBidStatusSelling;
            _statusText = @"履约中";
        } else if (status == 4) {
            _status = XYBidStatusFinished;
            _statusText = @"已结束";
        }
        
        if (_reapymentType == XYRepaymentTypeMonth) {
            _repaymentString = @"按月分期还款";
        } else if (_reapymentType == XYRepaymentTypeSingle) {
            _repaymentString = @"一次性还款";
        } else if (_reapymentType == XYRepaymentTypeMontyProfit) {
            _repaymentString = @"每月还息到期还本";
        }
        
        NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
        style.alignment = NSTextAlignmentCenter;
        style.lineSpacing = 4.0;
        NSDictionary *dit1 = @{NSFontAttributeName : XYGlobalUI.smallFont_12, NSForegroundColorAttributeName : XYGlobalUI.blackColor, NSParagraphStyleAttributeName : style};
        NSDictionary *dit2 = @{NSFontAttributeName : XYGlobalUI.smallFont_12, NSForegroundColorAttributeName : [UIColor grayColor], NSParagraphStyleAttributeName : style};
        NSString *yearProfitRatio = @"往期年化收益";
        NSString *planLimitMonth = @"计划期限";
        NSString *planTotal = @"计划总额";
        NSString *investVolume = @"可投金额";
        NSMutableAttributedString *yearAtt = [[NSMutableAttributedString alloc] initWithString:[yearProfitRatio stringByAppendingFormat:@"\n%@%%", _yearProfitRatio] attributes:dit2];
        [yearAtt setAttributes:dit1 range:NSMakeRange(0, yearProfitRatio.length)];
        NSMutableAttributedString *limitAtt = [[NSMutableAttributedString alloc] initWithString:[planLimitMonth stringByAppendingFormat:@"\n%@ 个月", _planLimitMonth] attributes:dit2];
        [limitAtt setAttributes:dit1 range:NSMakeRange(0, planLimitMonth.length)];
        NSMutableAttributedString *totalAtt = [[NSMutableAttributedString alloc] initWithString:[planTotal stringByAppendingFormat:@"\n%@ 元", _planTotal] attributes:dit2];
        [totalAtt setAttributes:dit1 range:NSMakeRange(0, planTotal.length)];
        NSMutableAttributedString *investAtt = [[NSMutableAttributedString alloc] initWithString:[investVolume stringByAppendingFormat:@"\n%@ 元", _investableVolume] attributes:dit2];
        [investAtt setAttributes:dit1 range:NSMakeRange(0, investVolume.length)];
        _yearProfitRatioAtt = yearAtt;
        _planLimitMonthAtt = limitAtt;
        _planTotalAtt = totalAtt;
        _investableVolumeAtt = investAtt;
    }
    return self;
}

@end
