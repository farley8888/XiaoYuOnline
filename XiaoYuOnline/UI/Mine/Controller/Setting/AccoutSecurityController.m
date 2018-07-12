//
//  XYAccoutSecurityController.m
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/6.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "AccoutSecurityController.h"
#import "ChangePasswordController.h"
#import "TradePasswordController.h"
#import "GesturePasswordNextController.h"
#import "SettingTableViewCell.h"
#import "BaseInfoModel.h"

static NSString *accountSecurityReuseID = @"AccountSecurityReuseIdentifier";

@interface BaseInfoModel(AccountSecurity)
+ (NSArray<BaseInfoModel *> *)accountSecurityDatasourceList;
@end

@interface AccoutSecurityController ()
@end

@implementation AccoutSecurityController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = NSLocalizedString(@"Mine_Setting_AccoutSafe", nil);
    
    _itemList = [BaseInfoModel accountSecurityDatasourceList];
    
    self.tableView.backgroundColor = XYGlobalUI.backgroundColor;
    self.tableView.rowHeight = 48.0;
    self.tableView.sectionHeaderHeight = 7.0;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    [self.tableView registerClass:[SettingTableViewCell class] forCellReuseIdentifier:accountSecurityReuseID];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _itemList.count;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [UIView new];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SettingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:accountSecurityReuseID forIndexPath:indexPath];
    cell.descriptionLabel.textColor = XYGlobalUI.mainColor;
    BaseInfoModel *model = _itemList[indexPath.row];
    cell.titleLabel.text = model.title;
    cell.descriptionLabel.text = model.scriptDescription;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UIViewController *desVC = nil;
    switch (indexPath.row) {
        case 0:
            desVC = [[ChangePasswordController alloc] init];
            break;
        case 1:
            desVC = [[TradePasswordController alloc] init];
            break;
        case 2:
            desVC = [[GesturePasswordNextController alloc] init];
            break;
        default:
            break;
    }
    
    if (desVC) {
        [self.navigationController pushViewController:desVC animated:YES];
    }
}

@end

@implementation BaseInfoModel(AccountSecurity)

+ (NSArray <BaseInfoModel *> *)accountSecurityDatasourceList {
    return @[[[BaseInfoModel alloc] initWithTitle:NSLocalizedString(@"Mine_Setting_AC_LoginPwd", nil) content:nil description:nil],
             [[BaseInfoModel alloc] initWithTitle:NSLocalizedString(@"Mine_Setting_AC_TradePwd", nil) content:nil description:nil],
//             [[XYBaseInfoModel alloc] initWithTitle:NSLocalizedString(@"Mine_Setting_AC_GesturePwd", nil) content:nil description:NSLocalizedString(@"Mine_Setting_AC_GestureUnable", nil)]
             ];
}

@end
