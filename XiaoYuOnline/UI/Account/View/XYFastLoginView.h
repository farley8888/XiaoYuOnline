//
//  XYFastLoginView.h
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/13.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomTextEdgeField.h"

@class XYSendVerifyCodeView;
@interface XYFastLoginView : UIView
@property (nonatomic, strong) CustomTextEdgeField *phoneTextField;
@property (nonatomic, strong) CustomTextEdgeField *bottomTextField;
@property (nonatomic, strong) UIButton *loginButon;
@property (nonatomic, strong) XYSendVerifyCodeView *sendVerifyCodeView;
@property (nonatomic, strong) UIButton *createAccountButton;

@end
