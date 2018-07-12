//
//  XYRootViewController.m
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/8.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "RootViewController.h"
#import "HomePageViewController.h"
#import "ManageMoneyViewController.h"
#import "DiscoveryViewController.h"
#import "BaseNavigationController.h"
#import "MineViewController.h"
#import "UIImage+Common.h"

@interface RootViewController ()

@property (nonatomic, strong) HomePageViewController *homePageController;
@property (nonatomic, strong) ManageMoneyViewController *managerMoneyController;
@property (nonatomic, strong) DiscoveryViewController *discoveryController;
@property (nonatomic, strong) MineViewController *mineController;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _homePageController = [[HomePageViewController alloc] init];
    _homePageController.tabBarItem.title = NSLocalizedString(@"HomePage_Title", nil);
    _homePageController.tabBarItem.image = [UIImage imageNamed:@"tab_home"];
    _homePageController.tabBarItem.selectedImage = [UIImage imageNamed:@"tab_home_sel"];
    _homePageController.title = NSLocalizedString(@"HomePage_Title", nil);
    BaseNavigationController *hNav = [[BaseNavigationController alloc]initWithRootViewController:_homePageController];
    
    _managerMoneyController = [[ManageMoneyViewController alloc] init];
    _managerMoneyController.tabBarItem.title = NSLocalizedString(@"ManageMoney_Title", nil);
    _managerMoneyController.tabBarItem.image = [UIImage imageNamed:@"tab_manageMoney"];
    _managerMoneyController.tabBarItem.selectedImage = [UIImage imageNamed:@"tab_manageMoney_sel"];
    _managerMoneyController.title = NSLocalizedString(@"ManageMoney_Title", nil);
    BaseNavigationController *mmNav = [[BaseNavigationController alloc]initWithRootViewController:_managerMoneyController];
    
    _discoveryController = [[DiscoveryViewController alloc] init];
    _discoveryController.tabBarItem.title = NSLocalizedString(@"Discovery_Title", nil);
    _discoveryController.tabBarItem.image = [UIImage imageNamed:@"tab_discovery"];
    _discoveryController.tabBarItem.selectedImage = [UIImage imageNamed:@"tab_discovery_sel"];
    _discoveryController.title = NSLocalizedString(@"Discovery_Title", nil);
    BaseNavigationController *dNav = [[BaseNavigationController alloc]initWithRootViewController:_discoveryController];
    
    _mineController = [[MineViewController alloc] init];
    _mineController.tabBarItem.title = NSLocalizedString(@"Mine_Title", nil);
    _mineController.tabBarItem.image = [UIImage imageNamed:@"tab_mine"];
    _mineController.tabBarItem.selectedImage = [UIImage imageNamed:@"tab_mine_sel"];
    _mineController.title = NSLocalizedString(@"Mine_Title", nil);
    BaseNavigationController *mNav = [[BaseNavigationController alloc]initWithRootViewController:_mineController];
    
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

