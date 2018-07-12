//
//  XYBidDetailViewController.h
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/10.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "BaseTableViewController.h"

/**
 标的详情
 */
@class BidModel;
@interface BidDetailViewController : BaseTableViewController

- (instancetype)initWithBidModel:(BidModel *)bidModel;

@end
