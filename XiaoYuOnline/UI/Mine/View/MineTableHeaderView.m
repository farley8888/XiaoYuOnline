//
//  XYMineTableHeaderView.m
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/8.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "MineTableHeaderView.h"
#import "AssetGraphView.h"

@interface MineTableHeaderView ()
@property (nonatomic, strong) CAGradientLayer *backgroundLayer;
@end

@implementation MineTableHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = XYGlobalUI.backgroundColor;
        _avatarButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _avatarButton.titleLabel.font = XYGlobalUI.smallFont_14;
        [_avatarButton setTitleColor:XYGlobalUI.whiteColor forState:UIControlStateNormal];
        [_avatarButton setTitle:NSLocalizedString(@"", nil) forState:UIControlStateNormal];
        [_avatarButton addTarget:self action:@selector(avatarButtonAction) forControlEvents:UIControlEventTouchUpInside];
        [_avatarButton setImage:[UIImage imageNamed:@"mine_avatar_placeholder"] forState:UIControlStateNormal];
        
        _loginTextButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_loginTextButton setTitleColor:XYGlobalUI.whiteColor forState:UIControlStateNormal];
        _loginTextButton.titleLabel.font = XYGlobalUI.smallFont_12;
        [_loginTextButton setTitle:NSLocalizedString(@"Mine_Login", nil) forState:UIControlStateNormal];
        [_loginTextButton addTarget:self action:@selector(avatarButtonAction) forControlEvents:UIControlEventTouchUpInside];
        
        _graphView = [[AssetGraphView alloc] init];
        _graphView.backgroundColor = [UIColor clearColor];
        _graphView.hidden = YES;
        
        UIColor *bgColor = RGB_COLOR(190, 98, 70);
        _totalIncomButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _totalIncomButton.titleLabel.font = XYGlobalUI.smallFont_14;
        _totalIncomButton.titleLabel.numberOfLines = 2;
        _totalIncomButton.backgroundColor = bgColor;
        _totalIncomButton.titleLabel.textAlignment = NSTextAlignmentCenter;;
        [_totalIncomButton setTitleColor:XYGlobalUI.whiteColor forState:UIControlStateNormal];
        
        _useableBalanceButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _useableBalanceButton.titleLabel.font = XYGlobalUI.smallFont_14;
        _useableBalanceButton.backgroundColor = bgColor;
        _useableBalanceButton.titleLabel.numberOfLines = 2;
        _useableBalanceButton.titleLabel.textAlignment = NSTextAlignmentCenter;
        _useableBalanceButton.contentHorizontalAlignment = UIControlContentVerticalAlignmentCenter;
        [_useableBalanceButton setTitleColor:XYGlobalUI.whiteColor forState:UIControlStateNormal];
        
        _frozenCapitalButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _frozenCapitalButton.titleLabel.font = XYGlobalUI.smallFont_14;
        _frozenCapitalButton.backgroundColor = bgColor;
        _frozenCapitalButton.titleLabel.numberOfLines = 2;
        _frozenCapitalButton.titleLabel.textAlignment = NSTextAlignmentCenter;
        [_frozenCapitalButton setTitleColor:XYGlobalUI.whiteColor forState:UIControlStateNormal];
        
        _chargeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _chargeButton.titleLabel.font = XYGlobalUI.smallFont_14;
        _chargeButton.backgroundColor = XYGlobalUI.whiteColor;
        [_chargeButton setImage:[UIImage imageNamed:@"mine_charge_btn"] forState:UIControlStateNormal];
        [_chargeButton setTitleColor:XYGlobalUI.blackColor forState:UIControlStateNormal];
        [_chargeButton setTitle:NSLocalizedString(@"Mine_Charge", nil) forState:UIControlStateNormal];
        [_chargeButton addTarget:self action:@selector(chargeButtonAction) forControlEvents:UIControlEventTouchUpInside];
        
        _withdrawButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _withdrawButton.titleLabel.font = XYGlobalUI.smallFont_14;
        _withdrawButton.backgroundColor = XYGlobalUI.whiteColor;
        [_withdrawButton setImage:[UIImage imageNamed:@"mine_withdraw_btn"] forState:UIControlStateNormal];
        [_withdrawButton setTitleColor:XYGlobalUI.blackColor forState:UIControlStateNormal];
        [_withdrawButton setTitle:NSLocalizedString(@"Mine_Withdraw", nil) forState:UIControlStateNormal];
        [_withdrawButton addTarget:self action:@selector(withdrawButtonAction) forControlEvents:UIControlEventTouchUpInside];
        
        [_frozenCapitalButton setTitle:NSLocalizedString(@"Mine_FrozenCapital", nil) forState:UIControlStateNormal];
        [_useableBalanceButton setTitle:NSLocalizedString(@"Mine_UseableBalance", nil) forState:UIControlStateNormal];
        [_totalIncomButton setTitle:NSLocalizedString(@"Mine_TotalIncomes", nil) forState:UIControlStateNormal];
        
        CGSize offset = CGSizeMake(1.0, 0);
        CGFloat redC = 200 / 255.0;
        UIColor *color = [UIColor colorWithRed:redC green:redC blue:redC alpha:1.0];
        
        for (UIButton *btn in @[_totalIncomButton, _useableBalanceButton, _chargeButton]) {
            btn.layer.shadowOffset = offset;
            btn.layer.shadowColor = color.CGColor;
            btn.layer.shadowOpacity = 1.0;
            btn.layer.shadowRadius = 0;
        }
        
        _chargeButton.imageEdgeInsets = UIEdgeInsetsMake(0, -3.0, 0, 3.0);
        _chargeButton.titleEdgeInsets = UIEdgeInsetsMake(0, 3.0, 0, -3.0);
        _withdrawButton.imageEdgeInsets = UIEdgeInsetsMake(0, -3.0, 0, 3.0);
        _withdrawButton.titleEdgeInsets = UIEdgeInsetsMake(0, 3.0, 0, -3.0);
        
        _backgroundLayer = [CAGradientLayer layer];
        _backgroundLayer.colors = @[(__bridge id)XYGlobalUI.yellowColor.CGColor, (__bridge id)XYGlobalUI.yellowColor.CGColor,(__bridge id)XYGlobalUI.mainColor.CGColor];
        _backgroundLayer.startPoint = CGPointMake(0.5, 0);
        _backgroundLayer.endPoint = CGPointMake(0.5, 1);
        [self.layer insertSublayer:_backgroundLayer atIndex:0];
        
        // Layout
        UIView *superView = self;
        [superView addSubview:_avatarButton];
        [superView addSubview:_loginTextButton];
        [superView addSubview:_graphView];
        [superView addSubview:_totalIncomButton];
        [superView addSubview:_useableBalanceButton];
        [superView addSubview:_frozenCapitalButton];
        [superView addSubview:_chargeButton];
        [superView addSubview:_withdrawButton];
        
        [_avatarButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(superView).offset(40.0);
            make.size.mas_equalTo(CGSizeMake(65.0, 65.0));
            make.centerX.equalTo(superView);
        }];
        [_loginTextButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self->_avatarButton.mas_bottom).offset(10.0);
            make.centerX.equalTo(superView);
        }];
        
        NSArray *totBtns = @[_totalIncomButton, _useableBalanceButton, _frozenCapitalButton];
        [totBtns mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@48.0);
            make.bottom.equalTo(superView).offset(-60.0);
        }];
        [_totalIncomButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(superView);
        }];
        [_useableBalanceButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(self->_totalIncomButton.mas_trailing).offset(1.0);
            make.width.equalTo(self->_totalIncomButton);
        }];
        [_frozenCapitalButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(self->_useableBalanceButton.mas_trailing).offset(1.0);
            make.width.equalTo(self->_useableBalanceButton);
            make.trailing.equalTo(superView);
        }];
        [@[_chargeButton, _withdrawButton] mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@52.0);
            make.bottom.equalTo(superView);
        }];
        [_chargeButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(superView);
        }];
        [_withdrawButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(self->_chargeButton.mas_trailing).offset(1.0);
            make.trailing.equalTo(superView);
            make.width.equalTo(self->_chargeButton);
        }];
        [_graphView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(superView);
            make.centerY.equalTo(superView).offset(-50);
            make.size.mas_equalTo(CGSizeMake(170, 170));
        }];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGSize selfS = self.frame.size;
    CGFloat h = SCREEN_HEIGHT - 60.0;
    _backgroundLayer.frame = CGRectMake(0, selfS.height - SCREEN_HEIGHT , selfS.width, h);
    _backgroundLayer.locations = @[@0, @((h - selfS.height+64) / h)];
}

- (void)avatarButtonAction {
    if ([self.delegate respondsToSelector:@selector(mineHeaderView:buttonActionWityType:)]) {
        [self.delegate mineHeaderView:self buttonActionWityType:XYMineHeaderButtonTypeAvatar];
    }
}

- (void)chargeButtonAction {
    if ([self.delegate respondsToSelector:@selector(mineHeaderView:buttonActionWityType:)]) {
        [self.delegate mineHeaderView:self buttonActionWityType:XYMineHeaderButtonTypeCharge];
    }
}

- (void)withdrawButtonAction {
    if ([self.delegate respondsToSelector:@selector(mineHeaderView:buttonActionWityType:)]) {
        [self.delegate mineHeaderView:self buttonActionWityType:XYMineHeaderButtonTypeWithdraw];
    }
}

- (void)setUserDidLoginState:(BOOL)animate {
    [_avatarButton mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(33, 33));
        make.top.equalTo(self);
        make.left.equalTo(self).offset(20);
    }];
    [_loginTextButton mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self->_avatarButton);
        make.left.equalTo(self->_avatarButton.mas_right).offset(10);
    }];
    
    if (animate) {
        [UIView animateWithDuration:0.25 animations:^{
            [self layoutIfNeeded];
        }];
    } else {
        [self layoutIfNeeded];
    }
    
    _graphView.hidden = NO;
}

- (void)setUserDidSignOutState:(BOOL)animate {
    UIView *superView = self;
    [_avatarButton mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(superView).offset(40.0);
        make.size.mas_equalTo(CGSizeMake(65.0, 65.0));
        make.centerX.equalTo(superView);
    }];
    [_loginTextButton mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_avatarButton.mas_bottom).offset(10.0);
        make.centerX.equalTo(superView);
    }];
    
    if (animate) {
        [UIView animateWithDuration:0.25 animations:^{
            [self layoutIfNeeded];
        }];
    } else {
        [self layoutIfNeeded];
    }
    
    _graphView.hidden = YES;
}

@end
