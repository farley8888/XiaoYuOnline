//
//  UIViewController+KeyboardHandler.h
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/14.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (KeyboardHandler)

@property (nonatomic, strong) NSValue *originContentInset;

- (void)registerKeyboardNotification;
- (void)removeKeyboardNotification;

@end
