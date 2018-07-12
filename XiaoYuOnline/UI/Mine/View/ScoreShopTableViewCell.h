//
//  ScoreShopTableViewCell.h
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/7.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScoreShopTableViewCell : UITableViewCell
@property (nonatomic, strong) UIImageView *titleImageView;
@property (nonatomic, strong) UILabel *titleLable;
@property (nonatomic, strong) UILabel *contentLabel;
@property (nonatomic, strong) UIButton *rightButton;
@end

@interface XYCouponConvertViewCell : ScoreShopTableViewCell
@property (nonatomic, strong) UILabel *valueLabel;
@property (nonatomic, strong) UILabel *descriptionLabel;
@end
