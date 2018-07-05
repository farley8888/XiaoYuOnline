//
//  XYMineTableModel.m
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/8.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "XYMineTableModel.h"

@implementation XYMineTableModel

- (instancetype)initWithImage:(UIImage *)image title:(NSString *)title {
    self = [super init];
    if (self) {
        _image = image;
        _title = title;
    }
    return self;
}

+ (NSArray<XYMineTableModel *> *)mineTableViewItemList {
    return @[[[XYMineTableModel alloc] initWithImage:[UIImage imageNamed:@"mine_bill"] title:NSLocalizedString(@"Mine_BillTitle", nil)],
             [[XYMineTableModel alloc] initWithImage:[UIImage imageNamed:@"mine_trade_record"] title:NSLocalizedString(@"Mine_TradeRecord", nil)],
             [[XYMineTableModel alloc] initWithImage:[UIImage imageNamed:@"mine_wellbeing"] title:NSLocalizedString(@"Mine_WellBeingTitle", nil)],
             [[XYMineTableModel alloc] initWithImage:[UIImage imageNamed:@"mine_QA"] title:NSLocalizedString(@"Mine_QA", nil)],
             [[XYMineTableModel alloc] initWithImage:[UIImage imageNamed:@"mine_aboutUs"] title:NSLocalizedString(@"Mine_AboutUs", nil)],
             [[XYMineTableModel alloc] initWithImage:[UIImage imageNamed:@"mine_setting"] title:NSLocalizedString(@"Mine_Setting", nil)]
             ];
}
@end
