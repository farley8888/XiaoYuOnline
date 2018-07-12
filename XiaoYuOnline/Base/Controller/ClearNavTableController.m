//
//  XYClearNavTableController.m
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/27.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "ClearNavTableController.h"

@interface ClearNavTableController ()
@property (nonatomic, strong) UIImage *originNavigationBarImage;
@property (nonatomic, assign) BOOL isTranslucent;
@end

@implementation ClearNavTableController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _originNavigationBarImage = [self.navigationController.navigationBar backgroundImageForBarMetrics:UIBarMetricsDefault];
    _isTranslucent = self.navigationController.navigationBar.translucent;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.translucent = YES;
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"clear_color_bg"] forBarMetrics:UIBarMetricsDefault];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.translucent = _isTranslucent;
    [self.navigationController.navigationBar setBackgroundImage:_originNavigationBarImage forBarMetrics:UIBarMetricsDefault];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
