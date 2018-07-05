//
//  XYChargeViewController.h
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/7.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "XYSettingRealNameController.h"
#import "XYRealNameModel.h"

@interface XYChargeWithdrawModel : XYRealNameModel
@end

@interface XYChargeViewController : XYSettingRealNameController

/**
 操作按钮，“立即充值”、“立即提现”
 */
@property (nonatomic, readonly)UIButton *operateButton;

/**
 操作按钮的点击事件

 @param button 按钮
 */
- (void)operateButtonAction:(UIButton *)button;
@end
