//
//  XYMineTableHeaderView.h
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/8.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, XYMineHeaderButtonType) {
    XYMineHeaderButtonTypeAvatar,
    XYMineHeaderButtonTypeCharge,
    XYMineHeaderButtonTypeWithdraw
};

@class MineTableHeaderView, AssetGraphView;
@protocol XYMineTableHeaderViewDelegate<NSObject>

- (void)mineHeaderView:(MineTableHeaderView *)view buttonActionWityType:(XYMineHeaderButtonType)type;

@end

@interface MineTableHeaderView : UIView
@property (nonatomic, strong) UIButton *avatarButton;
@property (nonatomic, strong) UIButton *loginTextButton;
@property (nonatomic, strong) UIButton *totalIncomButton;
/// 可用余额
@property (nonatomic, strong) UIButton *useableBalanceButton;
/// 冻结金额
@property (nonatomic, strong) UIButton *frozenCapitalButton;
/// 充值
@property (nonatomic, strong) UIButton *chargeButton;
/// 提现
@property (nonatomic, strong) UIButton *withdrawButton;
/// 进度图
@property (nonatomic, strong) AssetGraphView *graphView;

@property (nonatomic, weak) id<XYMineTableHeaderViewDelegate> delegate;

// 登录状态的样式
- (void)setUserDidLoginState:(BOOL)animate;
// 未登录状态的样式
- (void)setUserDidSignOutState:(BOOL)animate;
@end
