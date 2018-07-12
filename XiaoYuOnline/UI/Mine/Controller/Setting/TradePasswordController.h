//
//  TradePasswordController.h
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/6.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "BaseTableViewController.h"

@class RealNameModel;
@interface TradePasswordController : BaseTableViewController

@property (nonatomic, strong) RealNameModel *tradeModel;
@property (nonatomic, readonly) UIButton *footerButton;

/**
 footerView 上按钮的操作事件

 @param button 按钮
 */
- (void)footerOperateButtonAction:(UIButton *)button;

@end
