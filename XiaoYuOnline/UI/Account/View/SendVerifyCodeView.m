//
//  XYSendVerifyCodeView.m
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/25.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "SendVerifyCodeView.h"
#import "NSTimer+Helper.h"

@implementation SendVerifyCodeView {
    NSUInteger _secondCount;
    NSTimer *_timer;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _secondCount = 60;
        _sendButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _sendButton.titleLabel.font = XYGlobalUI.smallFont_14;
        [_sendButton setTitleColor:XYGlobalUI.blackColor forState:UIControlStateNormal];
        [_sendButton setTitleColor:XYGlobalUI.grayColor forState:UIControlStateDisabled];
        [_sendButton setTitle:NSLocalizedString(@"Account_SendVerifyCode", nil) forState:UIControlStateNormal];
        [self addSubview:_sendButton];
        [_sendButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
    }
    return self;
}

#pragma mark - Public

- (void)start60SecondCountDown {
    _sendButton.enabled = NO;
    NSString *title = [NSString stringWithFormat:@"%@s", @(_secondCount)];
    [_sendButton setTitle:title forState:UIControlStateDisabled];
    
    if (!_timer) {
        __weak SendVerifyCodeView *weakSelf = self;
        _timer = [NSTimer ez_scheduledTimerWithTimeInterval:1 block:^{
            __strong __typeof(weakSelf)strongSelf = weakSelf;
            if (!strongSelf) {
                return ;
            }
            if (strongSelf->_secondCount == 1) {
                [strongSelf->_timer invalidate];
                strongSelf->_timer = nil;
                
                strongSelf->_sendButton.enabled = YES;
                strongSelf->_secondCount = 60;
            }
            else {
                strongSelf->_secondCount --;
                NSString *title = [NSString stringWithFormat:@"%@s", @(strongSelf->_secondCount)];
                [strongSelf->_sendButton setTitle:title forState:UIControlStateDisabled];
            }
        } repeats:YES];
    }
}

@end
