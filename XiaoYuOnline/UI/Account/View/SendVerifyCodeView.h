//
//  XYSendVerifyCodeView.h
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/25.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SendVerifyCodeView : UIView

@property (nonatomic, readonly) UIButton *sendButton;

/**
 在短信验证码发送成功后开始 60s 倒计时
 */
- (void)start60SecondCountDown;

@end
