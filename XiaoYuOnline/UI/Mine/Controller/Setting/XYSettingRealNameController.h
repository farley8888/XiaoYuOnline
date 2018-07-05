//
//  XYSettingRealNameController.h
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/5.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "XYBaseTableViewController.h"

@class XYRealNameModel;
@interface XYSettingRealNameController : XYBaseTableViewController

@property (nonatomic, strong) NSArray<XYRealNameModel *> *itemList;

- (void)footerViewButtonAction:(UIButton *)button;

@end
