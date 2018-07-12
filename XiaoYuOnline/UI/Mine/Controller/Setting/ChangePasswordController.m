//
//  ChangePasswordController.m
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/6.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "ChangePasswordController.h"
#import "UIViewController+ShowTextHUD.h"
#import "SigleTextFieldCell.h"
#import "BaseInfoModel.h"

static NSString *changePwdReuseID = @"XYChangePasswordReuseIdentifier";

@interface ChangePasswordController ()

@property (nonatomic, strong) NSArray<BaseInfoModel *> *itemList;
@property (nonatomic, strong) UIButton *commitButton;

@end

@implementation ChangePasswordController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _itemList = [self datasource];
    
    self.title = NSLocalizedString(@"Mine_Setting_AC_LoginPwd", nil);
    self.tableView.backgroundColor = XYGlobalUI.backgroundColor;
    self.tableView.rowHeight = 48.0;
    self.tableView.sectionHeaderHeight = 7.0;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.tableFooterView = [self tableFooterView];
    self.tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    [self.tableView registerClass:[SigleTextFieldCell class] forCellReuseIdentifier:changePwdReuseID];
}

- (UIView *)tableFooterView {
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 120)];
    footerView.backgroundColor = XYGlobalUI.backgroundColor;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:XYGlobalUI.yellowButtonBackgroundImage forState:UIControlStateNormal];
    [button setTitleColor:XYGlobalUI.whiteColor forState:UIControlStateNormal];
    [button setTitle:NSLocalizedString(@"Public_Save", nil) forState:UIControlStateNormal];
    [button addTarget:self action:@selector(commitButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [footerView addSubview:button];
    button.enabled = NO;
    _commitButton = button;
    
    UILabel *label = [[UILabel alloc] init];
    label.font = XYGlobalUI.smallFont_12;
    label.textColor = XYGlobalUI.grayColor;
    label.text = NSLocalizedString(@"Mine_Setting_AC_LP_Alert", nil);
    [footerView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(footerView).offset(21.0);
        make.top.equalTo(footerView).offset(10.0);
        make.right.equalTo(footerView).offset(-21.0);
    }];
    
    // Layout
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(footerView);
        make.bottom.equalTo(footerView);
        make.size.mas_equalTo(CGSizeMake(260.0, 65.0));
    }];
    
    return footerView;
}

- (NSArray<BaseInfoModel *> *)datasource {
    return @[[[BaseInfoModel alloc] initWithTitle:nil content:nil description:NSLocalizedString(@"Mine_Setting_AC_LP_Origin", nil)],
             [[BaseInfoModel alloc] initWithTitle:nil content:nil description:NSLocalizedString(@"Mine_Setting_AC_LP_New", nil)],
             [[BaseInfoModel alloc] initWithTitle:nil content:nil description:NSLocalizedString(@"Mine_Setting_AC_LP_NewAgain", nil)]
             ];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _itemList.count;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [UIView new];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SigleTextFieldCell *cell = [tableView dequeueReusableCellWithIdentifier:changePwdReuseID forIndexPath:indexPath];
    BaseInfoModel *model = _itemList[indexPath.row];
    cell.textField.placeholder = model.scriptDescription;
    [cell.textField addTarget:self action:@selector(textValueDidChanged:) forControlEvents:UIControlEventEditingChanged];
    
    return cell;
}

- (void)textValueDidChanged:(UITextField *)textField {
    NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    for (NSUInteger i = 0, count = _itemList.count; i < count; i ++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
        BaseInfoModel *model = _itemList[i];
        SigleTextFieldCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
        NSString *textContent = [cell.textField.text stringByTrimmingCharactersInSet:set];
        if (textContent.length > 0) {
            model.content = textContent;
            _commitButton.enabled = YES;
        } else {
            _commitButton.enabled = NO;
            return;
        }
    }
}

- (void)commitButtonAction:(UIButton *)button {
    [self.view endEditing:YES];
    
    if (_itemList.count > 2) {
        if (![_itemList[1].content isEqualToString:_itemList[2].content]) {
            [self showHUDText:@"重复密码不一致"];
            return;
        }
    }
    
    NSArray *keys = @[@"pwd", @"oldpwd"];
    NSMutableDictionary *param = [NSMutableDictionary dictionaryWithObject:XYCurrentUser.userID forKey:@"userId"];
    for (NSUInteger i = 1, count = keys.count; i < count; i ++) {
        BaseInfoModel *model = _itemList[i];
        [param setObject:model.content forKey:keys[i]];
    }
    
    __weak typeof(self) weakSelf = self;
    [self sendRequest:^(XMRequest * _Nonnull request) {
        request.api = Mine_ChangePssword_URL;
        request.parameters = param;
    } onSuccess:^(id  _Nullable responseObject) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [weakSelf.navigationController popViewControllerAnimated:YES];
        });
    } successHint:@"修改成功" onFailure:NULL];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
