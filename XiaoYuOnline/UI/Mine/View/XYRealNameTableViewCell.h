//
//  XYRealNameTableViewCell.h
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/5.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "XYAboutUsTableViewCell.h"
#import "XYSendVerifyCodeView.h"

@interface XYRealNameTableViewCell : XYAboutUsTableViewCell

@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) XYSendVerifyCodeView *rightView;

@end
