//
//  BidFirstViewCell.h
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/10.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "ManageMoneyCell.h"

/**
 标的详情，第一个 Cell
 */
@interface BidFirstViewCell : ManageMoneyCell

/**
 加息券
 */
@property (nonatomic, strong) UILabel *addInterestLabel;

/**
 现金券
 */
@property (nonatomic, strong) UILabel *cashVoucherLabel;

/**
 剩余融资金额
 */
@property (nonatomic, strong) UILabel *surplusRaiseLabel;

@end
