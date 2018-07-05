//
//  XYAccoutSecurityController.m
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/6.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "XYAccoutSecurityController.h"
#import "XYChangePasswordController.h"
#import "XYTradePasswordController.h"
#import "XYGesturePasswordNextController.h"
#import "XYSettingTableViewCell.h"
#import "XYBaseInfoModel.h"

static NSString *accountSecurityReuseID = @"AccountSecurityReuseIdentifier";

@interface XYBaseInfoModel(AccountSecurity)
+ (NSArray<XYBaseInfoModel *> *)accountSecurityDatasourceList;
@end

@interface XYAccoutSecurityController ()
@end

@implementation XYAccoutSecurityController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = NSLocalizedString(@"Mine_Setting_AccoutSafe", nil);
    
    _itemList = [XYBaseInfoModel accountSecurityDatasourceList];
    
    self.tableView.backgroundColor = XYGlobalUI.backgroundColor;
    self.tableView.rowHeight = 48.0;
    self.tableView.sectionHeaderHeight = 7.0;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    [self.tableView registerClass:[XYSettingTableViewCell class] forCellReuseIdentifier:accountSecurityReuseID];
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
    XYSettingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:accountSecurityReuseID forIndexPath:indexPath];
    cell.descriptionLabel.textColor = XYGlobalUI.mainColor;
    XYBaseInfoModel *model = _itemList[indexPath.row];
    cell.titleLabel.text = model.title;
    cell.descriptionLabel.text = model.scriptDescription;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    UIViewController *desVC = nil;
    switch (indexPath.row) {
        case 0:
            desVC = [[XYChangePasswordController alloc] init];
            break;
        case 1:
            desVC = [[XYTradePasswordController alloc] init];
            break;
        case 2:
            desVC = [[XYGesturePasswordNextController alloc] init];
            break;
        default:
            break;
    }
    
    if (desVC) {
        [self.navigationController pushViewController:desVC animated:YES];
    }
}

@end

@implementation XYBaseInfoModel(AccountSecurity)

+ (NSArray <XYBaseInfoModel *> *)accountSecurityDatasourceList {
    return @[[[XYBaseInfoModel alloc] initWithTitle:NSLocalizedString(@"Mine_Setting_AC_LoginPwd", nil) content:nil description:nil],
             [[XYBaseInfoModel alloc] initWithTitle:NSLocalizedString(@"Mine_Setting_AC_TradePwd", nil) content:nil description:nil],
//             [[XYBaseInfoModel alloc] initWithTitle:NSLocalizedString(@"Mine_Setting_AC_GesturePwd", nil) content:nil description:NSLocalizedString(@"Mine_Setting_AC_GestureUnable", nil)]
             ];
}

@end
