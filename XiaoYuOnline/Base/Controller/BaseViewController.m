//
//  XYBaseViewController.m
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/3.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "BaseViewController.h"
#import "UIImage+Common.h"
#import <MBProgressHUD/MBProgressHUD.h>

static UIImage *__kNavigationOrangeColorImage;
static UIImage *__kNavigationShadowImage;

@interface BaseViewController ()
@property (nonatomic, strong) NSMutableArray *executingRequests;
@property (nonatomic, strong) dispatch_group_t hudGroup;
@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = XYGlobalUI.whiteColor;
    
    if (!__kNavigationOrangeColorImage) {
        __kNavigationOrangeColorImage = [[UIImage imageWithColor:XYGlobalUI.mainColor size:CGSizeMake(2, 2)]stretchableImageWithLeftCapWidth:1 topCapHeight:1];
    }
    
    if (!__kNavigationShadowImage) {
        __kNavigationShadowImage = [UIImage new];
    }
    self.navigationController.navigationBar.translucent = NO;
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:NULL];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    UINavigationBar *navBar = self.navigationController.navigationBar;
    if ([navBar backgroundImageForBarMetrics:UIBarMetricsDefault] != __kNavigationOrangeColorImage) {
        [navBar setBackgroundImage:__kNavigationOrangeColorImage forBarMetrics:UIBarMetricsDefault];
    }
    
    if (navBar.shadowImage != __kNavigationShadowImage) {
        navBar.shadowImage = __kNavigationShadowImage;
    }
    
    if (navBar.translucent) {
        navBar.translucent = NO;
    }
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

#pragma mark -
#pragma mark - Public

+ (UIImage *)defaultNavigationBarImage {
    return __kNavigationOrangeColorImage;
}

+ (UIImage *)defaultNavigationBarShadowImage {
    return __kNavigationShadowImage;
}

- (NSString *)sendRequest:(XMRequestConfigBlock)request showHUD:(BOOL)show onSuccess:(XMSuccessBlock)successBlock successHint:(NSString *)hint onFailure:(XMFailureBlock)failureBlock onFinished:(XMFinishedBlock)finishedBlcok {
    if (!_executingRequests) {
        _executingRequests = [NSMutableArray array];
    }
    if (!_hudGroup) {
        _hudGroup = dispatch_group_create();
    }
    
    __weak typeof(self) weakSelf = self;
    MBProgressHUD *HUD = [MBProgressHUD HUDForView:self.view];
    if (show) {
        dispatch_group_enter(_hudGroup);
        if (!HUD) {
            HUD = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        }
    }
    
    NSString *identifier = [XMCenter sendRequest:request onSuccess:^(id  _Nullable responseObject) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if (hint && show  && strongSelf) {
            MBProgressHUD *hintHUD = [MBProgressHUD HUDForView:strongSelf.navigationController.view];
            if (!hintHUD && strongSelf) {
                hintHUD = [MBProgressHUD showHUDAddedTo:strongSelf.navigationController.view animated:YES];
            }
            hintHUD.mode = MBProgressHUDModeText;
            hintHUD.label.text = hint;
            [hintHUD hideAnimated:YES afterDelay:2.0];
        }
        
        if (successBlock) {
            successBlock(responseObject);
        }
    } onFailure:^(NSError * _Nullable error) {
        __strong typeof(self) strongSelf = weakSelf;
        if (strongSelf) {
            NSString *errorDes = error.userInfo[NSLocalizedDescriptionKey];
            MBProgressHUD *hintHUD = [MBProgressHUD HUDForView:strongSelf.navigationController.view];
            if (!hintHUD) {
                hintHUD = [MBProgressHUD showHUDAddedTo:strongSelf.navigationController.view animated:YES];
            }
            hintHUD.mode = MBProgressHUDModeText;
            hintHUD.label.text = errorDes;
            [hintHUD hideAnimated:YES afterDelay:2.0];
            
            if (failureBlock) {
                failureBlock(error);
            }
        }
    } onFinished:^(id  _Nullable responseObject, NSError * _Nullable error) {
        __strong typeof(self) strongSelf = weakSelf;
        if (strongSelf) {
            if (show) {
                dispatch_group_leave(strongSelf.hudGroup);
            }
            if (finishedBlcok) {
                finishedBlcok(responseObject, error);
            }
        }
    }];
    [_executingRequests addObject:identifier];
    
    dispatch_group_notify(_hudGroup, dispatch_get_main_queue(), ^{
        __strong typeof(weakSelf) strongSelf = weakSelf;
        [HUD hideAnimated:YES];
        if ([strongSelf.executingRequests containsObject:identifier]) {
            [strongSelf.executingRequests removeObject:identifier];
        }
    });
    
    return identifier;
}

- (NSString *)sendRequest:(XMRequestConfigBlock)requestBlcok onSuccess:(XMSuccessBlock)successBlock successHint:(NSString *)hint onFailure:(XMFailureBlock)failureBlock {
    return [self sendRequest:requestBlcok showHUD:YES onSuccess:successBlock successHint:hint onFailure:failureBlock onFinished:NULL];
}

- (NSString *)sendRequest:(XMRequestConfigBlock)requestBlock showHUD:(BOOL)show onSuccess:(XMSuccessBlock)successBlock {
    return [self sendRequest:requestBlock showHUD:show onSuccess:successBlock successHint:nil onFailure:NULL onFinished:NULL];
}

- (NSString *)sendSilentRequest:(XMRequestConfigBlock)request onSuccess:(XMSuccessBlock)successBlock onFinished:(XMFinishedBlock)finishBlcok {
    return [self sendRequest:request showHUD:NO onSuccess:successBlock successHint:nil onFailure:NULL onFinished:finishBlcok];
}

- (void)dealloc {
    if (_executingRequests && _executingRequests.count > 0) {
        [_executingRequests enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [XMCenter cancelRequest:obj];
        }];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
