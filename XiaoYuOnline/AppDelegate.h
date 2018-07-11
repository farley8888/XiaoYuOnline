//
//  AppDelegate.h
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/2.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import <UIKit/UIKit.h>

//ftool
@class FAccountCategaries, FCurrentMonthRecord;
//ftool end
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

//ftool
@property (nonatomic, strong) FUserModel *userInfo;
@property (nonatomic,strong) FAccountCategaries *aFAccountCategaries;
@property (nonatomic,strong) FCurrentMonthRecord *currentMonthRecord;
//ftool end

@end

