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

//ftool
#import "FTabBarController.h"
#import "IQKeyboardManager.h"
#import "NSDate+BRAdd.h"
//ftool end

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    if (DataUtil.isPass) {

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
        
    }else {
        [self FTLaunch];
    }
    
    return YES;
}

//ftool
-(void)FTLaunch{
    NSString *clientVersion = [[NSUserDefaults standardUserDefaults] stringForKey:@"clientVersion"];
    //判断应用程序是否更新了版本
    NSLog(@"clientVersion = [%@]", clientVersion);
    if ([clientVersion isEqualToString:CLIENT_VERSION]) {
        NSLog(@"未更新,正常使用");
        
    }else if(clientVersion == nil ){
        NSLog(@"首次安装");
        [[NSUserDefaults standardUserDefaults] setObject:CLIENT_VERSION forKey:@"clientVersion"];
        [FUsersTool setDefaultUser];
    } else{
        NSLog(@"更新了APP");
        [[NSUserDefaults standardUserDefaults] setObject:CLIENT_VERSION forKey:@"clientVersion"];
    }
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    FTabBarController *tabbarVC = [[FTabBarController alloc] init];
    self.window.rootViewController = tabbarVC;
    
    
    [self setUpKeyboardManager];
    
    self.userInfo = [FUserModel userFrom_NSUserDefaults];
}

- (void)setUserInfo:(FUserModel *)userInfo{
    _userInfo = userInfo;
    [[AppDefaultUtil sharedInstance] setLoginState:userInfo?YES:NO]; //测试登录
    
    if (!userInfo) {
        return;
    }
    self.aFAccountCategaries = [FAccountRecordSaveTool readLocalUserAccountCategaries];
    // 为默认用户专门生成预算
    if ([userInfo.phone isEqualToString:defName]) {
        for (FFirstType *expandseFirstType in self.aFAccountCategaries.expensesTypeArr) {
            expandseFirstType.budget = expandseFirstType.initBudget;
        }
    }
    
    [self initcurrentMonthRecord];
}

- (void)initcurrentMonthRecord{
    
    self.currentMonthRecord = [FAccountRecordSaveTool readLoaclCurrentMonthBlanceRecords];
    if (!self.currentMonthRecord) {//
    }
}

#pragma  mark - 以下自定义方法
- (void)setUpKeyboardManager
{
    IQKeyboardManager *manager = [IQKeyboardManager sharedManager];
    manager.enable = YES;
    manager.shouldResignOnTouchOutside = YES;
    manager.shouldToolbarUsesTextFieldTintColor = YES;
    manager.shouldShowToolbarPlaceholder = NO;
    manager.toolbarManageBehaviour = IQAutoToolbarByTag;
    //    manager.previousNextDisplayMode = IQPreviousNextDisplayModeDefault;
}
//ftool end

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.

    if (!DataUtil.isPass)  [self.userInfo saveTo_NSUserDefaults];
   
}
//ftool end

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
