//
//  XYBaseTableViewController.m
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/3.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "XYBaseTableViewController.h"
#import "XYBaseViewController.h"
#import <MBProgressHUD/MBProgressHUD.h>
#import "SVPullToRefresh.h"

@interface XYBaseTableViewController ()
@property (nonatomic, strong) NSMutableArray *executingRequests;
@property (nonatomic, strong) dispatch_group_t hudGroup;
@property (nonatomic, assign) NSInteger page;
@property (nonatomic, assign) BOOL viewAppeared;

@end

@implementation XYBaseTableViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        _page = 0;
        _pageSize = 20;
        _enablePullToRefresh = NO;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.navigationController.navigationBar.translucent = NO;
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:NULL];
}

- (void)loadDataWithPage:(NSInteger)page isRefresh:(BOOL)isRefresh {
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    UINavigationBar *navBar = self.navigationController.navigationBar;
    
    if ([navBar backgroundImageForBarMetrics:UIBarMetricsDefault] != [XYBaseViewController defaultNavigationBarImage]) {
        [navBar setBackgroundImage:[XYBaseViewController defaultNavigationBarImage] forBarMetrics:UIBarMetricsDefault];
    }
    
    if (navBar.shadowImage != [XYBaseViewController defaultNavigationBarShadowImage]) {
        navBar.shadowImage = [XYBaseViewController defaultNavigationBarShadowImage];
    }
    
    if (navBar.translucent) {
        navBar.translucent = NO;
    }
}

- (NSString *)sendSilentRequest:(XMRequestConfigBlock)request onSuccess:(XMSuccessBlock)successBlock {
    __weak typeof(self) weakSelf = self;
    return [self sendSilentRequest:request onSuccess:successBlock onFinished:^(id  _Nullable responseObject, NSError * _Nullable error) {
        if (error) {
            [weakSelf didLoadDataCount:0];
        }
    }];
}

- (void)didLoadDataCount:(NSInteger)count {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (self.tableView.showsPullToRefresh &&
            (self.tableView.pullToRefreshView.state == SVPullToRefreshStateLoading)) {
            [self.tableView.pullToRefreshView stopAnimating];
        }
        
        if (self.tableView.showsInfiniteScrolling &&
            (self.tableView.infiniteScrollingView.state == SVInfiniteScrollingStateLoading)) {
            [self.tableView.infiniteScrollingView stopAnimating];
        }
    });
    
    if (count >= self.pageSize) {
        _page ++;
        self.tableView.showsInfiniteScrolling = YES;
    } else {
        self.tableView.showsInfiniteScrolling = NO;
    }
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    if (!_viewAppeared) {
        UIEdgeInsets inset =self.tableView.contentInset;
        inset.top += _tableAdjustContentInsets.top;
        inset.left += _tableAdjustContentInsets.left;
        inset.bottom += _tableAdjustContentInsets.bottom;
        inset.right += _tableAdjustContentInsets.right;
        self.tableView.contentInset = inset;
        
        self.tableView.pullToRefreshView.originalTopInset = inset.top;
        self.tableView.infiniteScrollingView.originalBottomInset = inset.bottom;
        
        // 添加上下拉刷新
        if (_enablePullToRefresh) {
            __weak typeof(self) weakSelf = self;
            [self.tableView addPullToRefreshWithActionHandler:^{
                weakSelf.page = 0;
                [weakSelf loadDataWithPage:weakSelf.page isRefresh:YES];
            }];
            [self.tableView addInfiniteScrollingWithActionHandler:^{
                [weakSelf loadDataWithPage:weakSelf.page isRefresh:NO];
            }];
            
            self.tableView.showsInfiniteScrolling = NO;
            self.tableView.pullToRefreshView.arrowColor = XYGlobalUI.blackColor;
            self.tableView.pullToRefreshView.textColor = XYGlobalUI.blackColor;
            [self.tableView.pullToRefreshView setTitle:@"下拉刷新" forState:SVPullToRefreshStateStopped];
            [self.tableView.pullToRefreshView setTitle:@"松开更新" forState:SVPullToRefreshStateTriggered];
            [self.tableView.pullToRefreshView setTitle:@"加载中..." forState:SVPullToRefreshStateLoading];
        }
    }
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    if (!_viewAppeared) {
        [self.tableView triggerPullToRefresh];
        _viewAppeared = YES;
    }
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

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

#pragma mark - Setter and Getter

- (void)setEnablePullToRefresh:(BOOL)enablePullToRefresh {
    if (enablePullToRefresh) {
        if (!self.tableView.pullToRefreshView) {
            __weak typeof(self) weakSelf = self;
            [self.tableView addPullToRefreshWithActionHandler:^{
                weakSelf.page = 0;
                [weakSelf loadDataWithPage:weakSelf.page isRefresh:YES];
            }];
            [self.tableView addInfiniteScrollingWithActionHandler:^{
                [weakSelf loadDataWithPage:weakSelf.page isRefresh:NO];
            }];
            
            self.tableView.showsInfiniteScrolling = NO;
            self.tableView.pullToRefreshView.arrowColor = XYGlobalUI.blackColor;
            self.tableView.pullToRefreshView.textColor = XYGlobalUI.blackColor;
            [self.tableView.pullToRefreshView setTitle:@"下拉刷新" forState:SVPullToRefreshStateStopped];
            [self.tableView.pullToRefreshView setTitle:@"松开更新" forState:SVPullToRefreshStateTriggered];
            [self.tableView.pullToRefreshView setTitle:@"加载中..." forState:SVPullToRefreshStateLoading];
        }
    } else {
        if (self.tableView.pullToRefreshView) {
            self.tableView.showsPullToRefresh = NO;
            self.tableView.showsInfiniteScrolling = NO;
            [self.tableView.pullToRefreshView removeFromSuperview];
            [self.tableView.infiniteScrollingView removeFromSuperview];
        }
    }
}

@end
