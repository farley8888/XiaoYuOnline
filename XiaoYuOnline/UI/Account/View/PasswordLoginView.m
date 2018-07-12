//
//  XYPasswordLoginView.m
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/13.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "PasswordLoginView.h"

@implementation PasswordLoginView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
         UIImageView *leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"account_login_pwd_left_bg"]];
        self.bottomTextField.leftView = leftView;
        self.bottomTextField.rightView = nil;
        self.bottomTextField.secureTextEntry = YES;
        self.bottomTextField.placeholder = NSLocalizedString(@"Account_Login_InputPassword_PH", nil);
        self.bottomTextField.returnKeyType = UIReturnKeyGo;
        
        _forgotPassword = [UIButton buttonWithType:UIButtonTypeCustom];
        _forgotPassword.titleLabel.font = XYGlobalUI.smallFont_12;
        [_forgotPassword setTitle:NSLocalizedString(@"Public_ForgotPwd", nil) forState:UIControlStateNormal];
        [_forgotPassword setTitleColor:XYGlobalUI.grayColor forState:UIControlStateNormal];
        
        _rememberPassword = [UIButton buttonWithType:UIButtonTypeCustom];
        _rememberPassword.titleLabel.font = XYGlobalUI.smallFont_12;
        _rememberPassword.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, -5);
        [_rememberPassword setTitle:NSLocalizedString(@"Account_Login_RememberPassword", nil) forState:UIControlStateNormal];
        [_rememberPassword setImage:[UIImage imageNamed:@"mine_setting_checkBox"] forState:UIControlStateNormal];
        [_rememberPassword setImage:[UIImage imageNamed:@"account_login_remember_sel"] forState:UIControlStateSelected];
        [_rememberPassword addTarget:self action:@selector(rememberButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [_rememberPassword setTitleColor:XYGlobalUI.grayColor forState:UIControlStateNormal];
        
        UIView *superView = self;
        [superView addSubview:_forgotPassword];
        [superView addSubview:_rememberPassword];
        
        [self.loginButon mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.bottomTextField.mas_bottom).offset(45.0);
        }];
        [_forgotPassword mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.bottomTextField.mas_bottom).offset(10.0);
            make.left.equalTo(self.bottomTextField);
        }];
        [_rememberPassword mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.bottomTextField.mas_bottom).offset(10.0);
            make.right.equalTo(self.bottomTextField);
        }];
    }
    return self;
}

- (void)rememberButtonAction:(UIButton *)button {
    button.selected = !button.selected;
}

@end
