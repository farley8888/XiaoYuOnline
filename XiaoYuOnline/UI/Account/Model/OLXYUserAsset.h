//
//  OLXYUserAsset
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/25.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 用户资产
 */
@interface OLXYUserAsset : NSObject
// 总资产
@property (nonatomic, copy) NSString *total;
// 冻结资产
@property (nonatomic, copy) NSString *freezed;
// 可用余额
@property (nonatomic, copy) NSString *useable;
// 累计收益
@property (nonatomic, copy) NSString *totalProfit;

- (instancetype)initWithMineAssetApiData:(NSDictionary *)data;

@end
