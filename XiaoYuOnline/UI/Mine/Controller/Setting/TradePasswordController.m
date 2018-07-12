//
//  TradePasswordController.m
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/6.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "TradePasswordController.h"
#import "TradePasswordNextController.h"
#import "RealNameTableViewCell.h"
#import "RealNameModel.h"

static NSString *tradePasswordReuseID = @"XYTradePasswordReuseIdentifier";

@interface TradePasswordController ()
@end

@implementation TradePasswordController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tradeModel = [[RealNameModel alloc] initWithTitle:NSLocalizedString(@"Public_VerifyCode", nil) content:nil description:NSLocalizedString(@"Mine_Setting_RN_VerifyCode", nil) placeHolder:NSLocalizedString(@"Mine_Setting_AC_TP_PlaceHolder", nil)];
    
    self.title = NSLocalizedString(@"Mine_Setting_AC_TradePwd", nil);
    self.tableView.backgroundColor = XYGlobalUI.backgroundColor;
    self.tableView.rowHeight = 48.0;
    self.tableView.sectionHeaderHeight = 7.0;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.tableFooterView = [self tableFooterView];
    self.tableView.tableHeaderView = [self tableHeaderView];
    self.tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    [self.tableView registerClass:[RealNameTableViewCell class] forCellReuseIdentifier:tradePasswordReuseID];
}

- (UIView *)tableFooterView {
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 75)];
    footerView.backgroundColor = XYGlobalUI.backgroundColor;
    
    _footerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _footerButton.enabled = NO;
    [_footerButton setBackgroundImage:XYGlobalUI.yellowButtonBackgroundImage forState:UIControlStateNormal];
    [_footerButton setTitleColor:XYGlobalUI.whiteColor forState:UIControlStateNormal];
    [_footerButton setTitle:NSLocalizedString(@"Public_Next", nil) forState:UIControlStateNormal];
    [_footerButton addTarget:self action:@selector(footerOperateButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [footerView addSubview:_footerButton];
    
    // Layout
    [_footerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(footerView);
        make.bottom.equalTo(footerView);
        make.size.mas_equalTo(CGSizeMake(260.0, 65.0));
    }];
    
    return footerView;
}

- (UIView *)tableHeaderView {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 55.0)];
    label.backgroundColor = XYGlobalUI.backgroundColor;
    label.font = XYGlobalUI.smallFont_14;
    label.textColor = XYGlobalUI.grayColor;
    label.textAlignment = NSTextAlignmentCenter;
    label.text = [NSString stringWithFormat:@"%@ %@", NSLocalizedString(@"Mine_Setting_AC_TP_Alert", nil), XYCurrentUser.phoneNumber];
    
    return label;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RealNameTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tradePasswordReuseID forIndexPath:indexPath];
    cell.titleLabel.text = _tradeModel.title;
    cell.rightView.hidden = NO;
    cell.textField.placeholder = _tradeModel.placeHolder;
    [cell.rightView.sendButton setTitle:_tradeModel.scriptDescription forState:UIControlStateNormal];
    [cell.rightView.sendButton addTarget:self action:@selector(sendVerifyCodeButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [cell.textField addTarget:self action:@selector(textFieldEditingChanged:) forControlEvents:UIControlEventEditingChanged];
    
    return cell;
}

#pragma mrak -
#pragma mark - Event Response

- (void)textFieldEditingChanged:(UITextField *)textField {
    NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSString *text = [textField.text stringByTrimmingCharactersInSet:set];
    if (text.length > 0) {
        _footerButton.enabled = YES;
        _tradeModel.content = text;
    } else {
        _footerButton.enabled = NO;
    }
}

- (void)sendVerifyCodeButtonAction:(UIButton *)button {
    [self.view endEditing:YES];
    button.enabled = NO;
    
    [self sendRequest:^(XMRequest * _Nonnull request) {
        request.api = Account_SendVerifyCodeURL;
        request.parameters = @{@"mobile" : XYCurrentUser.phoneNumber};
    } onSuccess:^(id  _Nullable responseObject) {
        UIView *view = button.superview;
        if ([view isKindOfClass:[SendVerifyCodeView class]]) {
            [(SendVerifyCodeView *)view start60SecondCountDown];
        }
    } successHint:@"验证码已发送" onFailure:NULL];
    
}

- (void)footerOperateButtonAction:(UIButton *)button {
    // 验证后跳转
    //...
    TradePasswordNextController *vc = [[TradePasswordNextController alloc] initWithVerifyCode:_tradeModel.content];
    [self.navigationController pushViewController:vc animated:YES];
}


@end
