//
//  XYManageMoneyModel.m
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/5/8.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "ManageMoneyModel.h"
#import <YYKit/NSDictionary+YYAdd.h>

@implementation ManageMoneyModel

- (instancetype)initWithManageMoneyListApi:(NSDictionary *)data {
    self = [super initWithHomePageListApi:data];
    if (self) {
        /*
        NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
        style.alignment = NSTextAlignmentCenter;
        style.lineSpacing = 4.0;
        NSDictionary *dit1 = @{NSFontAttributeName : XYGlobalUI.smallFont_14, NSForegroundColorAttributeName : XYGlobalUI.blackColor, NSParagraphStyleAttributeName : style};
        NSDictionary *dit2 = @{NSFontAttributeName : XYGlobalUI.smallFont_12, NSForegroundColorAttributeName : [UIColor grayColor], NSParagraphStyleAttributeName : style};
        NSString *planLimitMonth = @"理财期限";
        NSString *planTotal = @"预期年化收益率";
        NSString *investVolume = @"剩余金额";
        NSString *planLimitMonthL = [NSString stringWithFormat:@"%@ 个月\n%@", self.planLimitMonth, planLimitMonth];
        NSString *planTotalL = [NSString stringWithFormat:@"%@\n%@", self.planTotal, planTotal];
        NSString *investVolumeL = [NSString stringWithFormat:@"%@ 元\n%@", self.investableVolume, investVolume];
        NSMutableAttributedString *limitAtt = [[NSMutableAttributedString alloc] initWithString:planLimitMonthL attributes:dit1];
        [limitAtt setAttributes:dit2 range:[planLimitMonthL rangeOfString:planLimitMonth]];
        NSMutableAttributedString *totalAtt = [[NSMutableAttributedString alloc] initWithString:[planTotal stringByAppendingFormat:@"\n%@ 元", self.planTotal] attributes:dit1];
        [totalAtt setAttributes:dit2 range:[planTotalL rangeOfString:planTotal]];
        NSMutableAttributedString *investAtt = [[NSMutableAttributedString alloc] initWithString:[investVolume stringByAppendingFormat:@"\n%@ 元", self.investableVolume] attributes:dit1];
        [investAtt setAttributes:dit2 range:[investVolumeL rangeOfString:investVolume]];
        self.planLimitMonthAtt = limitAtt;
        self.planTotalAtt = totalAtt;
        self.investableVolumeAtt = investAtt;
         */
    }
    return self;
}

@end
