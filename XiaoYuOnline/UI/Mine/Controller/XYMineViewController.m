//
//  XYMineViewController.m
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/3.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "XYMineViewController.h"
#import "BillTableViewController.h"
#import "QAViewController.h"
#import "AboutUsViewController.h"
#import "SettingViewController.h"
#import "WellBeingViewController.h"
#import "WithdrawViewController.h"
#import "TradeRecordViewController.h"
#import "LoginViewController.h"
#import "XYChargeViewController.h"

#import "MineTableHeaderView.h"
#import "AssetGraphView.h"
#import "MineTableViewCell.h"
#import "UIImage+Common.h"
#import "MineTableModel.h"

static NSString *mineTableReuseID = @"XYMineCellReuseIdentifier";

@interface XYMineViewController ()<XYMineTableHeaderViewDelegate> {
    BOOL _isLogin;
}

@property (nonatomic, strong) UIImage *originNavigationBarImage;
@property (nonatomic, strong) UIImage *yellowNavigationBarImage;
@property (nonatomic, strong) UIImage *navigationShadowImage;
@property (nonatomic, strong) MineTableHeaderView *tableHeader;
@property (nonatomic, strong) NSArray <MineTableModel *> *itemList;

@end

@implementation XYMineViewController

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:XYUserDidLoginNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:XYUserDidLogoutNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:XYUserAssetDidChangedNotification object:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _originNavigationBarImage = [self.navigationController.navigationBar backgroundImageForBarMetrics:UIBarMetricsDefault];
    _yellowNavigationBarImage = [UIImage imageWithColor:XYGlobalUI.yellowColor size:CGSizeMake(2, 2)];
    _navigationShadowImage = [UIImage new];
    _itemList = [MineTableModel mineTableViewItemList];
    
    self.tableView.backgroundColor = XYGlobalUI.backgroundColor;
    self.tableView.sectionHeaderHeight = 8.0;
    self.tableView.rowHeight = 48.0;
    [self.tableView registerClass:[MineTableViewCell class] forCellReuseIdentifier:mineTableReuseID];
    self.navigationController.navigationBar.translucent = NO;
    
    self.tableView.tableHeaderView = [self tableHeaderView];
    
    [self loadUIContent];
    // 监听用户状态
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(userDidLogin) name:XYUserDidLoginNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(userDidSignOut) name:XYUserDidLogoutNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(userAssetChanged:) name:XYUserAssetDidChangedNotification object:nil];
}

- (void)loadUIContent {
    if (XYCurrentUser.userState == XYUserStateLogin) {
        // 用户登录状态的 UI 样式
        [_tableHeader setUserDidLoginState:NO];
        [_tableHeader.loginTextButton setTitle:XYCurrentUser.nickname forState:UIControlStateNormal];
        
        __weak typeof(self) weakSelf = self;
        [self sendRequest:^(XMRequest * _Nonnull request) {
            request.api = Mine_Assets_URL;
            request.parameters = @{@"userId" : XYCurrentUser.userID};
            request.httpMethod = kXMHTTPMethodGET;
        } showHUD:(self.view.window != nil) onSuccess:^(id  _Nullable responseObject) {
            [XYCurrentUser updateUserCardInfoWithData:responseObject[@"account"][@"user"]];
            [XYCurrentUser updateUserRealNameWithData:responseObject[@"account"][@"user"]];
            OLXYUserAsset *asset = [XYCurrentUser updateUserAssetWithApiData:responseObject];
            [weakSelf updateTableHeaderViewWiteAsset:asset];
        }];
    }
}

- (void)updateTableHeaderViewWiteAsset:(OLXYUserAsset *)asset {
    
    NSString *totalIncome = [asset.totalProfit stringByAppendingFormat:@"\n%@", NSLocalizedString(@"Mine_TotalIncomes", nil)];
    NSString *usable = [NSString stringWithFormat:@"%@\n%@", asset.useable, NSLocalizedString(@"Mine_UseableBalance", nil)];
    NSString *freezed = [NSString stringWithFormat:@"%@\n%@", asset.freezed, NSLocalizedString(@"Mine_FrozenCapital", nil)];
    [self.tableHeader.frozenCapitalButton setTitle:freezed forState:UIControlStateNormal];
    [self.tableHeader.useableBalanceButton setTitle:usable forState:UIControlStateNormal];
    [self.tableHeader.totalIncomButton setTitle:totalIncome forState:UIControlStateNormal];
    self.tableHeader.graphView.titleLabel.text = NSLocalizedString(@"Mine_TotalAssets", nil);
    self.tableHeader.graphView.valueLabel.text = [asset.total stringByAppendingString:@" 元"];
    self.tableHeader.graphView.progress = asset.total.floatValue > 0.1 ? (asset.useable.floatValue / asset.total.floatValue) : 0;
}

- (UIView *)tableHeaderView {
    MineTableHeaderView *headerView = [[MineTableHeaderView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 330)];
    headerView.delegate = self;
    _tableHeader = headerView;
    
    return headerView;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.shadowImage = _navigationShadowImage;
    [self.navigationController.navigationBar setBackgroundImage:_yellowNavigationBarImage forBarMetrics:UIBarMetricsDefault];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar setBackgroundImage:_originNavigationBarImage forBarMetrics:UIBarMetricsDefault];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [UIView new];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _itemList.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MineTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:mineTableReuseID forIndexPath:indexPath];
    MineTableModel *model = _itemList[indexPath.section];
    cell.imageView.image = model.image;
    cell.textLabel.text = model.title;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UIViewController *desVC = nil;
    if (XYCurrentUser.userState == XYUserStateLogin) {
        switch (indexPath.section) {
            case 0:   // 账单
                desVC = [[BillTableViewController alloc] init];
                break;
            case 1:   // 交易记录
                desVC = [[TradeRecordViewController alloc] init];
                break;
            case 2:   // 福利
                desVC = [[WellBeingViewController alloc] init];
                break;
            case 3:   // 常见问题
                desVC = [[QAViewController alloc] init];
                break;
            case 4:   // 关于我们
                desVC = [[AboutUsViewController alloc] init];
                break;
            case 5:   // 设置
                desVC = [[SettingViewController alloc] init];
                break;
            default:
                break;
        }
    } else {
        desVC = [[LoginViewController alloc] init];
    }
    
    if (desVC) {
        desVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:desVC animated:YES];
    }
}

#pragma mark -
#pragma mark - Private

- (void)userDidLogin {
    // 登录后修改 UI
    [_tableHeader.loginTextButton setTitle:XYCurrentUser.nickname forState:UIControlStateNormal];
    [self loadUIContent];
}

- (void)userDidSignOut {
    // 退出登录后修改 UI
    [_tableHeader.frozenCapitalButton setTitle:NSLocalizedString(@"Mine_FrozenCapital", nil) forState:UIControlStateNormal];
    [_tableHeader.useableBalanceButton setTitle:NSLocalizedString(@"Mine_UseableBalance", nil) forState:UIControlStateNormal];
    [_tableHeader.totalIncomButton setTitle:NSLocalizedString(@"Mine_TotalIncomes", nil) forState:UIControlStateNormal];
    [_tableHeader.loginTextButton setTitle:NSLocalizedString(@"Mine_Login", nil) forState:UIControlStateNormal];
    [_tableHeader setUserDidSignOutState:YES];
}

- (void)userAssetChanged:(NSNotification *)notification {
    // 如果更新后的信息传递过来就直接使用
    // 否则就调用接口获取最新信息
    NSDictionary *data = notification.object;
    if (data) {
        [XYCurrentUser updateUserAssetWithApiData:data];
        [self updateTableHeaderViewWiteAsset:XYCurrentUser.userAsset];
    } else {
        [self loadUIContent];
    }
}

- (void)mineHeaderView:(MineTableHeaderView *)view buttonActionWityType:(XYMineHeaderButtonType)type {
    if (type == XYMineHeaderButtonTypeAvatar) {
        if (XYCurrentUser.userState == XYUserStateLogin) {
            
        } else {
            LoginViewController *vc = [[LoginViewController alloc] init];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
    } else if (type == XYMineHeaderButtonTypeCharge) {
        XYChargeViewController *vc = [[XYChargeViewController alloc] init];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    } else if (type == XYMineHeaderButtonTypeWithdraw) {
        WithdrawViewController *vc = [[WithdrawViewController alloc] init];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }
}

#pragma mark -
#pragma mark - Event Response


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
