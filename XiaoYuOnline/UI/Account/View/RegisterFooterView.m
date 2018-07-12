//
//  XYRegisterFooterView.m
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/14.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "RegisterFooterView.h"

@implementation RegisterFooterView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = XYGlobalUI.backgroundColor;
        
        UIView *footerView  = self;
        UIButton *checkbox = [UIButton buttonWithType:UIButtonTypeCustom];
        [checkbox setImage:[UIImage imageNamed:@"mine_setting_checkBox"] forState:UIControlStateNormal];
        [checkbox setImage:[UIImage imageNamed:@"account_login_remember_sel"] forState:UIControlStateSelected];
        [checkbox addTarget:self action:@selector(checboxButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        
        UIButton *protocolBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [footerView addSubview:protocolBtn];
        [footerView addSubview:checkbox];

        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setBackgroundImage:XYGlobalUI.yellowButtonBackgroundImage forState:UIControlStateNormal];
        [button setTitleColor:XYGlobalUI.whiteColor forState:UIControlStateNormal];
        [button setTitle:NSLocalizedString(@"Account_Register_Title", nil) forState:UIControlStateNormal];
        [footerView addSubview:button];
        
        UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [footerView addSubview:loginBtn];
        
        // Layout
        [checkbox mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(40.0, 40.0));
            make.top.equalTo(footerView);
            make.left.equalTo(footerView).offset(7.0);
        }];
        [protocolBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(checkbox.mas_right).offset(-5);
            make.centerY.equalTo(checkbox);
        }];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(footerView);
            make.top.equalTo(protocolBtn.mas_bottom).offset(20);
            make.size.mas_equalTo(CGSizeMake(260.0, 65.0));
        }];
        [loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(button.mas_bottom).offset(10);
            make.centerX.equalTo(footerView);
        }];
        
        NSString *text = @"我已经阅读并接受《平台注册协议》";
        NSDictionary *normalAtt = @{NSFontAttributeName : XYGlobalUI.smallFont_12, NSForegroundColorAttributeName : XYGlobalUI.blackColor};
        NSDictionary *orangeAtt = @{NSFontAttributeName : XYGlobalUI.smallFont_12, NSForegroundColorAttributeName : XYGlobalUI.yellowColor};
        NSMutableAttributedString *ms = [[NSMutableAttributedString alloc] initWithString:text attributes:normalAtt];
        [ms setAttributes:orangeAtt range:[text rangeOfString:@"《平台注册协议》"]];
        [protocolBtn setAttributedTitle:ms forState:UIControlStateNormal];
        
        NSString *login = @"已有帐号，立即登录";
        NSMutableAttributedString *loginMs = [[NSMutableAttributedString alloc] initWithString:login attributes:normalAtt];
        [loginMs setAttributes:orangeAtt range:[login rangeOfString:@"立即登录"]];
        [loginBtn setAttributedTitle:loginMs forState:UIControlStateNormal];
        
        _checkboxButton = checkbox;
        _protocolButton = protocolBtn;
        _registerButton = button;
        _loginButton = loginBtn;
    }
    return self;
}

- (void)checboxButtonAction:(UIButton *)button {
    button.selected = !button.selected;
}

@end
