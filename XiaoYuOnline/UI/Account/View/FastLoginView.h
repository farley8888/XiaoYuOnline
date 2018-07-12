//
//  XYFastLoginView.h
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/13.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomTextEdgeField.h"

@class SendVerifyCodeView;
@interface FastLoginView : UIView
@property (nonatomic, strong) CustomTextEdgeField *phoneTextField;
@property (nonatomic, strong) CustomTextEdgeField *bottomTextField;
@property (nonatomic, strong) UIButton *loginButon;
@property (nonatomic, strong) SendVerifyCodeView *sendVerifyCodeView;
@property (nonatomic, strong) UIButton *createAccountButton;

@end
