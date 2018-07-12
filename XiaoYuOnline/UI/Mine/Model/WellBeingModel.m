//
//  XYWellBeingModel.m
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/6.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "WellBeingModel.h"

@implementation WellBeingModel

- (instancetype)initWithTitle:(NSString *)title imageURL:(NSString *)imageURL {
    self = [super init];
    if (self) {
        _title = title;
        _imageURL = imageURL;
    }
    return self;
}

+ (NSArray<WellBeingModel *> *)placeholderDatasourceList {
    // 占位数据源
    return @[[[WellBeingModel alloc] initWithTitle:NSLocalizedString(@"Mine_Setting_WB_CardBag", nil) imageURL:@"mine_wb_cardbag_bg"],
             [[WellBeingModel alloc] initWithTitle:NSLocalizedString(@"Mine_Setting_WB_ScoreShop", nil) imageURL:@"mine_wb_scoreshop_bg"],
//             [[XYWellBeingModel alloc] initWithTitle:NSLocalizedString(@"Mine_Setting_WB_Turntable", nil) imageURL:@"mine_wb_turntable_bg"]
             ];
}

@end
