//
//  TradeDetailModel.m
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/13.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "TradeDetailModel.h"
#import "TradeRecoderModel.h"

static NSDateFormatter *__tradeDateFormatter;

@implementation TradeDetailModel

+ (NSArray<TradeDetailModel *> *)tradeDatasourceListWithTradeModel:(TradeRecoderModel *)model {
    TradeDetailModel *m = [[TradeDetailModel alloc] initWithTitle:NSLocalizedString(@"Mine_TradeRecord_Bid_Status", nil) content:@"待还款" description:nil];
    m.isSpecial = YES;
    
    if (!__tradeDateFormatter) {
        __tradeDateFormatter = [[NSDateFormatter alloc] init];
        __tradeDateFormatter.dateFormat = @"yyyy-MM-dd";
    }
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:model.createTime];
    
    return @[[[TradeDetailModel alloc] initWithTitle:NSLocalizedString(@"Mine_TradeRecord_Bid_Name", nil) content:model.title description:nil],
             [[TradeDetailModel alloc] initWithTitle:NSLocalizedString(@"Mine_TradeRecord_Bid_YearRatio", nil) content:model.yearRatio description:nil],
             [[TradeDetailModel alloc] initWithTitle:NSLocalizedString(@"Mine_TradeRecord_Bid_BillType", nil) content:model.useReason description:nil],
             [[TradeDetailModel alloc] initWithTitle:NSLocalizedString(@"Mine_TradeRecord_Bid_InvestLimite", nil) content:@"一个月" description:nil],
             m,
             [[TradeDetailModel alloc] initWithTitle:NSLocalizedString(@"Mine_TradeRecord_Bid_BackTime", nil) content:[__tradeDateFormatter stringFromDate:date] description:nil],
             [[TradeDetailModel alloc] initWithTitle:NSLocalizedString(@"Mine_TradeRecord_Bid_ExpectToAccout", nil) content:[__tradeDateFormatter stringFromDate:date] description:nil]
             ];
}

@end
