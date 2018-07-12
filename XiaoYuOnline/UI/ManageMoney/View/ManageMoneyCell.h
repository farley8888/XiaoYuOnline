//
//  ManageMoneyCell.h
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/10.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ManageMoneyCell;
@protocol ManageMoneyCellDelegate<NSObject>
- (void)manageMoneyCell:(ManageMoneyCell *)cell didPressedBuyButton:(UIButton *)button;
@end

@interface CustomProgressView : UIProgressView
@end

@interface ManageMoneyCell : UITableViewCell

/**
 标题
 */
@property (nonatomic, strong) UILabel *titleLabel;

/**
 最后期限
 */
@property (nonatomic, strong) UILabel *deadlineLabel;

/**
 收益
 */
@property (nonatomic, strong) UILabel *profitLabel;

/**
 剩余
 */
@property (nonatomic, strong) UILabel *surplusLabel;

/**
 进度
 */
@property (nonatomic, strong) UILabel *progressLabel;

/**
 立即抢购按钮
 */
@property (nonatomic, strong) UIButton *actionButton;

/**
 进度条
 */
@property (nonatomic, strong) UIProgressView *progressView;

/**
 新手
 */
@property (nonatomic, strong) UIImageView *freshImageView;

@property (nonatomic, weak) id<ManageMoneyCellDelegate> delegate;

/**
 子视图添加约束
 */
- (void)addConstrainsToSubviews;

/**
 移除底部空白
 */
- (void)removeBottomLineView;

@end
