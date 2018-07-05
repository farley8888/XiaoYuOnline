//
//  XYPhoneCodeVerifyView.m
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/13.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "XYPhoneCodeVerifyView.h"
#import "CustomTextEdgeField.h"
#import "UIView+Common.h"

static const NSUInteger kXYPhoneCodeVerifyViewTag = 1210;

@interface XYPhoneCodeVerifyView()

@property (nonatomic, strong) UIView *conentView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) CustomTextEdgeField *phoneTextField;
@property (nonatomic, strong) CustomTextEdgeField *verifyCodeTextField;
@property (nonatomic, strong) UIButton *sendButton;
@property (nonatomic, strong) UIButton *commitButton;

@end

@implementation XYPhoneCodeVerifyView

- (void)dealloc {
    [self removeKeyboardNotification];
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:[UIScreen mainScreen].bounds];
    if (self) {
        _conentView = [[UIView alloc] init];
        _conentView.backgroundColor = XYGlobalUI.whiteColor;
        _conentView.layer.cornerRadius = 5.0;
        _conentView.clipsToBounds = YES;
        
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = XYGlobalUI.whiteColor;
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = [UIFont boldSystemFontOfSize:17.0];
        _titleLabel.backgroundColor = XYGlobalUI.mainColor;
        
        _phoneTextField = [[CustomTextEdgeField alloc] init];
        _phoneTextField.font = XYGlobalUI.smallFont_14;
        _phoneTextField.background = [[UIImage imageNamed:@"main_colorBackground_10diameter"] stretchableImageWithLeftCapWidth:5 topCapHeight:5];
        _phoneTextField.layer.borderColor = XYGlobalUI.backgroundColor.CGColor;
        _phoneTextField.placeholder = NSLocalizedString(@"Account_InputPhoneNum_PH", nil);
        _phoneTextField.textEdge = UIEdgeInsetsMake(0, 14, 0, 14);
        
        _verifyCodeTextField = [[CustomTextEdgeField alloc] init];
        _verifyCodeTextField.font = XYGlobalUI.smallFont_14;
        _verifyCodeTextField.background = [[UIImage imageNamed:@"main_colorBackground_10diameter"] stretchableImageWithLeftCapWidth:5 topCapHeight:5];
        _verifyCodeTextField.placeholder = NSLocalizedString(@"Account_InputVerifyCode_PH", nil);
        _verifyCodeTextField.textEdge = UIEdgeInsetsMake(0, 14, 0, 14);
        
        _sendButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _sendButton.titleLabel.font = XYGlobalUI.smallFont_12;
        [_sendButton setTitleColor:XYGlobalUI.whiteColor forState:UIControlStateNormal];
        UIImage *img1 = [[UIImage imageNamed:@"main_colorMain_10diameter"] stretchableImageWithLeftCapWidth:5 topCapHeight:5];
        [_sendButton setBackgroundImage:img1 forState:UIControlStateNormal];
        [_sendButton setTitle:NSLocalizedString(@"Account_SendVerifyCode", nil) forState:UIControlStateNormal];
        [_sendButton addTarget:self action:@selector(sendCodeButtonAction) forControlEvents:UIControlEventTouchUpInside];
        
        _commitButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_commitButton setTitleColor:XYGlobalUI.whiteColor forState:UIControlStateNormal];
        [_commitButton setTitle:NSLocalizedString(@"Public_Confirm", nil) forState:UIControlStateNormal];
        UIImage *img2 = [[UIImage imageNamed:@"main_verifyCode_bg"] resizableImageWithCapInsets:UIEdgeInsetsMake(23, 15, 23, 15) resizingMode:UIImageResizingModeStretch];
        [_commitButton setBackgroundImage:img2 forState:UIControlStateNormal];
        [_commitButton addTarget:self action:@selector(commitButtonAction) forControlEvents:UIControlEventTouchUpInside];
        
        
        [self addSubview:_conentView];
        UIView *superView = _conentView;
        [superView addSubview:_titleLabel];
        [superView addSubview:_phoneTextField];
        [superView addSubview:_verifyCodeTextField];
        [superView addSubview:_sendButton];
        [superView addSubview:_commitButton];
        
        _titleLabel.text = NSLocalizedString(@"Account_GetVerifyCode", nil);
        _conentView.alpha = 0;
        self.backgroundColor = [UIColor clearColor];
        
        [self registerKeyboardNotification];
    }
    return self;
}

+ (XYPhoneCodeVerifyView *)phoneCodeVerifyView {
    UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
    UIView *tagView = [window viewWithTag:kXYPhoneCodeVerifyViewTag];
    if (tagView) {
        return (XYPhoneCodeVerifyView *)tagView;
    } else {
        for (UIView *v in window.subviews) {
            if ([v isKindOfClass:[XYPhoneCodeVerifyView class]]) {
                v.tag = kXYPhoneCodeVerifyViewTag;
                return (XYPhoneCodeVerifyView *)v;
            }
        }
    }
    
    XYPhoneCodeVerifyView *view = [[XYPhoneCodeVerifyView alloc] init];
    view.tag = kXYPhoneCodeVerifyViewTag;
    
    return view;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGSize size = self.frame.size;
    _conentView.bounds = CGRectMake(0, 0, 312, 267);
    _conentView.center = CGPointMake(size.width / 2.0, size.height / 2.0 - 50.0);
    
    CGFloat leftM = 25.0, tFTop = 17, tFH = 48.0;
    _titleLabel.frame = CGRectMake(0, 0, _conentView.width, tFH);
    _phoneTextField.frame = CGRectMake(leftM, _titleLabel.bottom + tFTop, _conentView.width - leftM * 2, tFH);
    _verifyCodeTextField.frame = CGRectMake(leftM, _phoneTextField.bottom + 15, 167, tFH);
    _sendButton.bounds = CGRectMake(0, 0, 85, 35);
    _sendButton.centerY = _verifyCodeTextField.centerY;
    _sendButton.x = _verifyCodeTextField.right + 12;
    _commitButton.frame = CGRectMake(leftM, _verifyCodeTextField.bottom + 23, _phoneTextField.width, 46.0);
}

- (void)show {
    UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
    if (self == [window viewWithTag:kXYPhoneCodeVerifyViewTag]) {
        return;
    }
    
    [window addSubview:self];
    
    [UIView animateWithDuration:0.25 animations:^{
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.7];
        self.conentView.alpha = 1.0;
    }];
}

- (void)dismiss {
    UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
    if (self == [window viewWithTag:kXYPhoneCodeVerifyViewTag]) {
        [UIView animateWithDuration:0.25 animations:^{
            self.backgroundColor = [UIColor clearColor];
            self.conentView.alpha = 0;
        } completion:^(BOOL finished) {
            self.sendCodeBlock = nil;
            self.commitBlock = nil;
            if (self.dismissBlock) {
                self.dismissBlock();
            }
            self.dismissBlock = nil;
            [self removeFromSuperview];
        }];
    }
}

- (void)sendCodeButtonAction {
    if (_sendCodeBlock) {
        _sendCodeBlock(_phoneTextField.text);
    }
}

- (void)commitButtonAction {
    if (_phoneTextField.text.length > 0 && _verifyCodeTextField.text.length > 0) {
        if (_commitBlock) {
            _commitBlock(_phoneTextField.text, _verifyCodeTextField.text);
        }
    }
}

#pragma mark Keyboard Handle

- (void)registerKeyboardNotification{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillAppearHandle:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHiddenHandle:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
}

- (void)removeKeyboardNotification{
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillShowNotification
                                                  object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillHideNotification
                                                  object:nil];
}

- (UIViewAnimationOptions)animationOptionsWithKeyboardNotification:(NSNotification *)noti{
    UIViewAnimationCurve animationCurve = [noti.userInfo[UIKeyboardAnimationCurveUserInfoKey] unsignedIntegerValue];
    UIViewAnimationOptions animationOptions = UIViewAnimationOptionBeginFromCurrentState;
    if (animationCurve == UIViewAnimationCurveEaseIn) {
        animationOptions |= UIViewAnimationOptionCurveEaseIn;
    }
    else if (animationCurve == UIViewAnimationCurveEaseInOut) {
        animationOptions |= UIViewAnimationOptionCurveEaseInOut;
    }
    else if (animationCurve == UIViewAnimationCurveEaseOut) {
        animationOptions |= UIViewAnimationOptionCurveEaseOut;
    }
    else if (animationCurve == UIViewAnimationCurveLinear) {
        animationOptions |= UIViewAnimationOptionCurveLinear;
    }
    return animationOptions;
}

- (void)keyboardWillAppearHandle:(NSNotification *)noti{
    UIViewAnimationOptions options = [self animationOptionsWithKeyboardNotification:noti];
    NSTimeInterval  aniTime = [noti.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    CGRect endRect = [noti.userInfo[UIKeyboardFrameEndUserInfoKey ] CGRectValue];
    if (!CGRectIntersectsRect(endRect, _conentView.frame)) {
        return;
    }
    
    if (aniTime > 0) {
        [UIView animateWithDuration:aniTime delay:0 options:options animations:^{
            self.conentView.center = CGPointMake(self.conentView.centerX, endRect.origin.y - 10 - self.conentView.height / 2.0);
        } completion:nil];
    }
    else{
        _conentView.center = CGPointMake(_conentView.centerX, endRect.origin.y - 10 - _conentView.height / 2.0);
    }
}

- (void)keyboardWillHiddenHandle:(NSNotification *)noti
{
    UIViewAnimationOptions options = [self animationOptionsWithKeyboardNotification:noti];
    NSTimeInterval  aniTime = [noti.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    if (aniTime > 0) {
        [UIView animateWithDuration:aniTime delay:0 options:options animations:^{
            self.conentView.center = CGPointMake(self.conentView.centerX, self.height / 2.0 - 50);
        } completion:nil];
    }
    else{
        _conentView.center = CGPointMake(_conentView.centerX, self.height / 2.0 - 50);
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self endEditing:YES];
}

@end
