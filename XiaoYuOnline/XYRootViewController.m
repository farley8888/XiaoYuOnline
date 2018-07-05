//
//  XYRootViewController.m
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/8.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "XYRootViewController.h"
#import "XYHomePageViewController.h"
#import "XYManageMoneyViewController.h"
#import "XYDiscoveryViewController.h"
#import "XYBaseNavigationController.h"
#import "XYMineViewController.h"
#import "UIImage+Common.h"

@interface XYRootViewController ()

@property (nonatomic, strong) XYHomePageViewController *homePageController;
@property (nonatomic, strong) XYManageMoneyViewController *managerMoneyController;
@property (nonatomic, strong) XYDiscoveryViewController *discoveryController;
@property (nonatomic, strong) XYMineViewController *mineController;

@end

@implementation XYRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _homePageController = [[XYHomePageViewController alloc] init];
    _homePageController.tabBarItem.title = NSLocalizedString(@"HomePage_Title", nil);
    _homePageController.tabBarItem.image = [UIImage imageNamed:@"tab_home"];
    _homePageController.tabBarItem.selectedImage = [UIImage imageNamed:@"tab_home_sel"];
    _homePageController.title = NSLocalizedString(@"HomePage_Title", nil);
    XYBaseNavigationController *hNav = [[XYBaseNavigationController alloc]initWithRootViewController:_homePageController];
    
    _managerMoneyController = [[XYManageMoneyViewController alloc] init];
    _managerMoneyController.tabBarItem.title = NSLocalizedString(@"ManageMoney_Title", nil);
    _managerMoneyController.tabBarItem.image = [UIImage imageNamed:@"tab_manageMoney"];
    _managerMoneyController.tabBarItem.selectedImage = [UIImage imageNamed:@"tab_manageMoney_sel"];
    _managerMoneyController.title = NSLocalizedString(@"ManageMoney_Title", nil);
    XYBaseNavigationController *mmNav = [[XYBaseNavigationController alloc]initWithRootViewController:_managerMoneyController];
    
    _discoveryController = [[XYDiscoveryViewController alloc] init];
    _discoveryController.tabBarItem.title = NSLocalizedString(@"Discovery_Title", nil);
    _discoveryController.tabBarItem.image = [UIImage imageNamed:@"tab_discovery"];
    _discoveryController.tabBarItem.selectedImage = [UIImage imageNamed:@"tab_discovery_sel"];
    _discoveryController.title = NSLocalizedString(@"Discovery_Title", nil);
    XYBaseNavigationController *dNav = [[XYBaseNavigationController alloc]initWithRootViewController:_discoveryController];
    
    _mineController = [[XYMineViewController alloc] init];
    _mineController.tabBarItem.title = NSLocalizedString(@"Mine_Title", nil);
    _mineController.tabBarItem.image = [UIImage imageNamed:@"tab_mine"];
    _mineController.tabBarItem.selectedImage = [UIImage imageNamed:@"tab_mine_sel"];
    _mineController.title = NSLocalizedString(@"Mine_Title", nil);
    XYBaseNavigationController *mNav = [[XYBaseNavigationController alloc]initWithRootViewController:_mineController];
    
    self.viewControllers = @[hNav, mmNav, dNav, mNav];
    self.tabBar.tintColor = XYGlobalUI.mainColor;
    
    /*
    UIImage *white = [UIImage imageWithColor:[UIColor whiteColor] size:CGSizeMake(2, 2)];
    self.tabBar.shadowImage = [UIImage new];
    [self.tabBar setBackgroundImage:[white stretchableImageWithLeftCapWidth:1 topCapHeight:1]];
     */
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

