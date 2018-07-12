//
//  RealNameTableViewCell.h
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/5.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "AboutUsTableViewCell.h"
#import "SendVerifyCodeView.h"

@interface RealNameTableViewCell : AboutUsTableViewCell

@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) SendVerifyCodeView *rightView;

@end
