//
//  UIViewController+ShowTextHUD.h
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/25.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MBProgressHUD/MBProgressHUD.h>

@interface UIViewController (ShowTextHUD)

- (MBProgressHUD *)showHUDText:(NSString *)text;
- (MBProgressHUD *)showHUDText:(NSString *)text description:(NSString *)desprition;

@end
