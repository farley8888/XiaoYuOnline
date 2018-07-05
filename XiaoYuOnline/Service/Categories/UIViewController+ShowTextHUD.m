//
//  UIViewController+ShowTextHUD.m
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/25.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "UIViewController+ShowTextHUD.h"

@implementation UIViewController (ShowTextHUD)

- (MBProgressHUD *)showHUDText:(NSString *)text {
    return [self showHUDText:text description:nil];
}

- (MBProgressHUD *)showHUDText:(NSString *)text description:(NSString *)desprition {
    MBProgressHUD *HUD = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    HUD.mode = MBProgressHUDModeText;
    HUD.label.text = text;
    HUD.detailsLabel.text = desprition;
    [HUD hideAnimated:YES afterDelay:2];
    
    return HUD;
}

@end
