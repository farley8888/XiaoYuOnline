//
//  AppDelegate.m
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/2.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "AppDelegate.h"
#import "XYGuideViewController.h"
#import "UserDefaultsHelper.h"
#import "UIImage+Common.h"
#import "XYRootViewController.h"
#import "ThirdPartHelper.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    // Third party config
    [ThirdPartHelper configNetwork];
    
    UIViewController *rootViewController = nil;
    if ([UserDefaultsHelper isFirstLaunchOrUpdate]) {
//        rootViewController = [[XYGuideViewController alloc] init];
        rootViewController = [[XYRootViewController alloc] init];
    } else {
        rootViewController = [[XYRootViewController alloc] init];
    }
    
    self.window.rootViewController = rootViewController;
    [self initGlobalNavigationBarStyle];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark -
#pragma mark - Private

- (void)initGlobalNavigationBarStyle
{
    // 设置全局导航栏及状态栏
    
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    
    NSDictionary *titlAtt = @{NSForegroundColorAttributeName:[UIColor whiteColor]};
    [[UINavigationBar appearance] setTitleTextAttributes:titlAtt];
    [[UIBarButtonItem appearance] setTitleTextAttributes:titlAtt forState:UIControlStateNormal];
    
    [[UITabBar appearance] setBarTintColor:[UIColor whiteColor]];
    [[UITabBarItem appearance]  setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor lightGrayColor]} forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName : XYGlobalUI.mainColor} forState:UIControlStateSelected];
    [[UINavigationBar appearance] setBackIndicatorImage:[UIImage imageNamed:@"navigation_back_white"]];
    [[UINavigationBar appearance] setBackIndicatorTransitionMaskImage:[UIImage imageNamed:@"navigation_back_white"]];
}

@end
