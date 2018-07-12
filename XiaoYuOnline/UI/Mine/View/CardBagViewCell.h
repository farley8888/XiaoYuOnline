//
//  CardBagViewCell.h
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/6.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CardBagViewCell : UITableViewCell

@property (nonatomic, strong) UILabel *valueLabel;
@property (nonatomic, strong) UILabel *usageConditionLabel;
@property (nonatomic, strong) UILabel *validDateLabel;
@property (nonatomic, strong) UILabel *usageSateLabel;
@property (nonatomic, strong) UIImageView *usableTagView;
@property (nonatomic, strong) UIImageView *backgroundImageView;
@property (nonatomic, strong) UIImageView *canUseImageView;

@end
