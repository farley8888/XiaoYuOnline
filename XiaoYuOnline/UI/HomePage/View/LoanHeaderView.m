//
//  LoanHeaderView.m
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/12.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "LoanHeaderView.h"

@implementation LoanHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = XYGlobalUI.whiteColor;
        UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"home_loan_input_bg"]];
        
        UILabel *topLabel = [[UILabel alloc] init];
        topLabel.font = XYGlobalUI.smallFont_14;
        
        UIView *bgView = [[UIView alloc] init];
        bgView.backgroundColor = XYGlobalUI.backgroundColor;
        UILabel *bottomLabel = [[UILabel alloc] init];
        bottomLabel.textColor = XYGlobalUI.yellowColor;
        bottomLabel.font = XYGlobalUI.smallFont_9;
        [bgView addSubview:bottomLabel];
        
        topLabel.text = NSLocalizedString(@"HomePage_Loan_InputTitle", nil);
        bottomLabel.text = NSLocalizedString(@"HomePage_Loan_InputDescription", nil);
        
        UIView *superView = self;
        [superView addSubview:imgView];
        [superView addSubview:topLabel];
        [superView addSubview:bgView];
        
        [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(superView).offset(20);
            make.top.equalTo(superView).offset(18);
            make.size.mas_equalTo(CGSizeMake(13, 13));
        }];
        [topLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(imgView.mas_right).offset(13.0);
            make.centerY.equalTo(imgView);
            make.right.equalTo(superView).offset(-20.0);
        }];
        [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.bottom.right.equalTo(superView);
            make.height.equalTo(@20);
        }];
        [bottomLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(bgView).offset(20);
            make.right.equalTo(bgView).offset(-20);
            make.top.bottom.equalTo(bgView);
        }];
    }
    return self;
}

@end

@implementation XYLoanFooterView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = XYGlobalUI.backgroundColor;
        
        UIButton *checkbox = [UIButton buttonWithType:UIButtonTypeCustom];
        [checkbox setImage:[UIImage imageNamed:@"mine_setting_checkBox"] forState:UIControlStateNormal];
        [checkbox setImage:[UIImage imageNamed:@"account_login_remember_sel"] forState:UIControlStateSelected];
        checkbox.selected = YES;
        _checkboxButton = checkbox;
        
        UIButton *protocolBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:protocolBtn];
        [self addSubview:checkbox];

        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setBackgroundImage:XYGlobalUI.yellowButtonBackgroundImage forState:UIControlStateNormal];
        [button setTitleColor:XYGlobalUI.whiteColor forState:UIControlStateNormal];
        [button setTitle:NSLocalizedString(@"HomePage_Loan_ApplyNow", nil) forState:UIControlStateNormal];
        [self addSubview:button];
        _confirmButton = button;
        
        // Layout
        [checkbox mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(40.0, 40.0));
            make.top.equalTo(self);
            make.left.equalTo(self).offset(7.0);
        }];
        [protocolBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(checkbox.mas_right).offset(-5);
            make.centerY.equalTo(checkbox);
        }];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.bottom.equalTo(self);
            make.size.mas_equalTo(CGSizeMake(260.0, 65.0));
        }];
        
        NSString *text = @"我已经阅读并同意《融资代理服务协议书》";
        NSDictionary *normalAtt = @{NSFontAttributeName : XYGlobalUI.smallFont_12, NSForegroundColorAttributeName : XYGlobalUI.blackColor};
        NSDictionary *orangeAtt = @{NSFontAttributeName : XYGlobalUI.smallFont_12, NSForegroundColorAttributeName : XYGlobalUI.yellowColor};
        NSMutableAttributedString *ms = [[NSMutableAttributedString alloc] initWithString:text attributes:normalAtt];
        [ms setAttributes:orangeAtt range:[text rangeOfString:@"《融资代理服务协议书》"]];
        [protocolBtn setAttributedTitle:ms forState:UIControlStateNormal];
    }
    return self;
}

@end
