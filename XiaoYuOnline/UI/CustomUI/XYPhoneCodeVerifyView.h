//
//  XYPhoneCodeVerifyView.h
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/13.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^PhoneVerifyCommitBlcok)(NSString *phone, NSString *code);
typedef void(^PhoneVerifySendCodeBlcok)(NSString *phone);
typedef void(^PhoneVerifyDismissBlcok) (void);

@interface XYPhoneCodeVerifyView : UIView

/**
 提交按钮的 Block
 */
@property (nonatomic, copy) PhoneVerifyCommitBlcok commitBlock;
@property (nonatomic, copy) PhoneVerifySendCodeBlcok sendCodeBlock;
@property (nonatomic, copy) PhoneVerifyDismissBlcok dismissBlock;

+ (XYPhoneCodeVerifyView *)phoneCodeVerifyView;

- (void)show;
- (void)dismiss;

@end
