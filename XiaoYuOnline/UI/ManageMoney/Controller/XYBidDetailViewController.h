//
//  XYBidDetailViewController.h
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/10.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "XYBaseTableViewController.h"

/**
 标的详情
 */
@class XYBidModel;
@interface XYBidDetailViewController : XYBaseTableViewController

- (instancetype)initWithBidModel:(XYBidModel *)bidModel;

@end
