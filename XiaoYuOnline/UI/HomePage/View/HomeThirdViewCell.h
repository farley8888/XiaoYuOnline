//
//  XYHomeThirdViewCell.h
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/11.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HomeThirdViewCell;
@protocol XYHomeThirdViewCellDelegate<NSObject>
- (void)thirdCell:(HomeThirdViewCell *)cell didPressedBuyButton:(UIButton *)buyButton;
@end

@interface HomeThirdViewCell : UITableViewCell

@property (nonatomic, strong) UIImageView *addProfitImageView;
@property (nonatomic, strong) UIImageView *profitImageView;
@property (nonatomic, strong) UIImageView *voucherImageView;
@property (nonatomic, strong) UILabel *previousYearProfit;
@property (nonatomic, strong) UILabel *planTimeLabel;
@property (nonatomic, strong) UILabel *planTotalLabel;
@property (nonatomic, strong) UILabel *investableLabel;
@property (nonatomic, strong) UIProgressView *progressView;
@property (nonatomic, strong) UIButton *buyButton;
@property (nonatomic, strong) UIView *leftVerticalView;
@property (nonatomic, strong) UILabel *progressLabel;
@property (nonatomic, weak) id<XYHomeThirdViewCellDelegate> delegate;

@end
