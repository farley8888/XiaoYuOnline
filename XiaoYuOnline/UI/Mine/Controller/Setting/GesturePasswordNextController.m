//
//  GesturePasswordNextController.m
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/6.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "GesturePasswordNextController.h"
#import "JinnLockViewController.h"
#import "BaseInfoModel.h"

@interface GesturePasswordNextController ()

@end

@implementation GesturePasswordNextController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = NSLocalizedString(@"Mine_Setting_AC_GP_Title", nil);
    self.itemList = @[[[BaseInfoModel alloc] initWithTitle:NSLocalizedString(@"Mine_Setting_AC_GP_Setting", nil) content:nil description:nil]];
    self.tableView.tableFooterView = [self tableFooterView];
}

- (UIView *)tableFooterView {
    UIView *footer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 55.0)];
    footer.backgroundColor = XYGlobalUI.backgroundColor;
    UIButton *closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    closeBtn.backgroundColor = XYGlobalUI.whiteColor;
    closeBtn.titleLabel.font = XYGlobalUI.smallFont_14;
    [closeBtn setTitle:NSLocalizedString(@"Mine_Setting_AC_GP_Close", nil) forState:UIControlStateNormal];
    [closeBtn setTitleColor:XYGlobalUI.grayColor forState:UIControlStateNormal];
    [footer addSubview:closeBtn];
    
    [closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(footer);
        make.top.equalTo(footer).offset(7.0);
    }];
    
    return footer;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    JinnLockViewController *vc = [[JinnLockViewController alloc] initWithType:JinnLockTypeCreate appearMode:JinnLockAppearModePush];
    vc.title = NSLocalizedString(@"Mine_Setting_AC_GP_Setting", nil);
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
