//
//  XYSettingRealNameController.h
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/5.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "BaseTableViewController.h"

@class RealNameModel;
@interface SettingRealNameController : BaseTableViewController

@property (nonatomic, strong) NSArray<RealNameModel *> *itemList;

- (void)footerViewButtonAction:(UIButton *)button;

@end
