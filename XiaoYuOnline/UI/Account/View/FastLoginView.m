//
//  XYFastLoginView.m
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/13.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "FastLoginView.h"
#import "NSTimer+Helper.h"
#import "SendVerifyCodeView.h"

@implementation FastLoginView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _phoneTextField = [[CustomTextEdgeField alloc] init];
        _phoneTextField.font = XYGlobalUI.smallFont_14;
        UIImage *bg = [[UIImage imageNamed:@"account_login_textField_bg"] stretchableImageWithLeftCapWidth:18 topCapHeight:18];
        UIEdgeInsets inset = UIEdgeInsetsMake(0, 10, 0, 10);
        UIEdgeInsets leftInset = UIEdgeInsetsMake(0, 15, 0, 0);
        _phoneTextField.background = bg;
        _phoneTextField.textEdge = inset;
        _phoneTextField.leftViewEdge = leftInset;
        _phoneTextField.placeholder = NSLocalizedString(@"Account_InputPhoneNum_PH", nil);
        [_phoneTextField  addTarget:self action:@selector(textFieldValueChanged) forControlEvents:UIControlEventEditingChanged];
        UIImageView *leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"account_login_phone_left_bg"]];
        _phoneTextField.leftView = leftView;
        leftView.contentMode = UIViewContentModeScaleAspectFit;
        leftView.bounds = CGRectMake(0, 0, 20, 20);
        _phoneTextField.leftViewMode = UITextFieldViewModeAlways;
        
        _bottomTextField = [[CustomTextEdgeField alloc] init];
        _bottomTextField.font = XYGlobalUI.smallFont_14;
        _bottomTextField.background = bg;
        _bottomTextField.textEdge = inset;
        _bottomTextField.leftViewEdge = leftInset;
        [_bottomTextField addTarget:self action:@selector(textFieldValueChanged) forControlEvents:UIControlEventEditingChanged];
        _bottomTextField.placeholder = NSLocalizedString(@"Account_InputVerifyCode_PH", nil);
        UIImageView *bottomLeft = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"account_login_verify_left_bg"]];
        bottomLeft.contentMode = UIViewContentModeScaleAspectFit;
        bottomLeft.bounds = CGRectMake(0, 0, 20, 20);
        _bottomTextField.leftView = bottomLeft;
        _bottomTextField.leftViewMode = UITextFieldViewModeAlways;
        
        _sendVerifyCodeView = [[SendVerifyCodeView alloc] init];
        _sendVerifyCodeView.bounds = CGRectMake(0, 0, 80, 30);
        _bottomTextField.rightViewMode = UITextFieldViewModeAlways;
        _bottomTextField.rightView = _sendVerifyCodeView;
        _bottomTextField.rightViewEdge = UIEdgeInsetsMake(0, 0, 0, 10);
        
        _loginButon = [UIButton buttonWithType:UIButtonTypeCustom];
        [_loginButon setTitle:NSLocalizedString(@"Account_Login_Title", nil) forState:UIControlStateNormal];
        [_loginButon setTitleColor:XYGlobalUI.whiteColor forState:UIControlStateNormal];
        UIImage *img2 = [[UIImage imageNamed:@"main_verifyCode_bg"] resizableImageWithCapInsets:UIEdgeInsetsMake(23, 15, 23, 15) resizingMode:UIImageResizingModeStretch];
        [_loginButon setBackgroundImage:img2 forState:UIControlStateNormal];
        
        _createAccountButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _createAccountButton.titleLabel.font = XYGlobalUI.smallFont_14;
        [_createAccountButton setTitle:NSLocalizedString(@"Account_Login_NoAccountAlert", nil) forState:UIControlStateNormal];
        [_createAccountButton setTitleColor:XYGlobalUI.mainColor forState:UIControlStateNormal];
        
        _sendVerifyCodeView.sendButton.enabled = NO;
        _loginButon.enabled = NO;
        
        UIView *superView = self;
        [superView addSubview:_phoneTextField];
        [superView addSubview:_bottomTextField];
        [superView addSubview:_loginButon];
        [superView addSubview:_createAccountButton];
        
        [_phoneTextField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(superView).offset(15.0);
            make.centerX.equalTo(superView);
            make.size.mas_equalTo(CGSizeMake(252, 50));
        }];
        [_bottomTextField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self->_phoneTextField.mas_bottom).offset(12.0);
            make.centerX.equalTo(superView);
            make.size.mas_equalTo(CGSizeMake(252, 50));
        }];
        [_loginButon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self->_bottomTextField.mas_bottom).offset(12.0);
            make.centerX.equalTo(superView);
            make.size.mas_equalTo(CGSizeMake(252, 50));
        }];
        [_createAccountButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self->_loginButon.mas_bottom).offset(20.0);
            make.centerX.equalTo(superView);
        }];
    }
    return self;
}

- (void)textFieldValueChanged {
    NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSString *text1 = [_phoneTextField.text stringByTrimmingCharactersInSet:set];
    NSString *text2 = [_bottomTextField.text stringByTrimmingCharactersInSet:set];
    
    if (text1.length == 11 && text2.length >= 4) {
        _loginButon.enabled = YES;
    } else {
        _loginButon.enabled = NO;
    }
    
    if (text1.length == 11) {
        _sendVerifyCodeView.sendButton.enabled = YES;
    } else {
        _sendVerifyCodeView.sendButton.enabled = NO;
    }
}

@end
