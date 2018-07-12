//
//  XYSettingViewController.m
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/5.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "SettingViewController.h"
#import "XYSettingTableViewCell.h"
#import "SettingRealNameController.h"
#import "ShippingAddressController.h"
#import "AccoutSecurityController.h"
#import "BindCardViewController.h"
#import "SettingModel.h"

static NSString *settingReuseID = @"XYSettingReuseIdentifer";

@interface SettingViewController ()
@property (nonatomic, strong) NSArray<NSArray <SettingModel *> *> *itemList;
@end

@implementation SettingViewController

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:XYUserInfoDidChangedNotification object:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _itemList = [SettingModel settingDatasourceList];
    
    self.title = NSLocalizedString(@"Mine_Setting", nil);
    self.tableView.backgroundColor = XYGlobalUI.backgroundColor;
    self.tableView.rowHeight = 54.0;
    self.tableView.sectionHeaderHeight = 7.0;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.tableFooterView = [self tableFooterView];
    [self.tableView registerClass:[XYSettingTableViewCell class] forCellReuseIdentifier:settingReuseID];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(userInfoChangeAction) name:XYUserInfoDidChangedNotification object:nil];
}

- (UIView *)tableFooterView {
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 100)];
    footerView.backgroundColor = XYGlobalUI.backgroundColor;
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:XYGlobalUI.yellowButtonBackgroundImage forState:UIControlStateNormal];
    [button setTitleColor:XYGlobalUI.whiteColor forState:UIControlStateNormal];
    [button setTitle:NSLocalizedString(@"Mine_Setting_SafeQuit", nil) forState:UIControlStateNormal];
    [button addTarget:self action:@selector(safeSignOutAction:) forControlEvents:UIControlEventTouchUpInside];
    [footerView addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(footerView);
        make.size.mas_equalTo(CGSizeMake(260.0, 65.0));
    }];
    
    return footerView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _itemList.count;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [UIView new];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *sectionItem = _itemList[section];
    return sectionItem.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    XYSettingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:settingReuseID forIndexPath:indexPath];
    NSArray *sectionItem = _itemList[indexPath.section];
    SettingModel *model = sectionItem[indexPath.row];
    cell.titleLabel.text = model.title;
    cell.descriptionLabel.text = model.content;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UIViewController *desVC = nil;
    if (indexPath.section == 0) {
        switch (indexPath.row) {
            case 0:   /// 实名认证
                if (!XYCurrentUser.cardID) {
                    desVC = [[SettingRealNameController alloc] init];
                }
                break;
            case 2:   // 银行卡绑定
                if (!XYCurrentUser.bankCardID) {
                    desVC = [[BindCardViewController alloc] init];
                }
                break;
            case 3:   /// 账户安全
                desVC = [[AccoutSecurityController alloc] init];
                break;
            default:
                break;
        }
    } if (indexPath.section == 1) {
        desVC = [[ShippingAddressController alloc] init];
    } if (indexPath.section == 2) {
        
    }
    
    if (desVC) {
        [self.navigationController pushViewController:desVC animated:YES];
    }
}

- (void)userInfoChangeAction {
    _itemList = [SettingModel settingDatasourceList];
    [self.tableView reloadData];
}

#pragma mark - EventResponse

- (void)safeSignOutAction:(UIButton *)button {
    button.enabled = NO;
    __weak typeof(self) weakSelf = self;
    [self sendRequest:^(XMRequest * _Nonnull request) {
        request.api = Account_SiginOutURL;
        request.parameters = @{@"userId" : XYCurrentUser.userID};
    } onSuccess:^(id  _Nullable responseObject) {
        [XYCurrentUser userSignOut];
        button.enabled = YES;
        [weakSelf.navigationController popViewControllerAnimated:YES];
    } successHint:@"退出成功" onFailure:^(NSError * _Nullable error) {
        button.enabled = YES;
    }];
}

@end
