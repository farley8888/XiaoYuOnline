//
//  XYTradePasswordNextController.m
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/6.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "XYTradePasswordNextController.h"
#import "UIViewController+ShowTextHUD.h"
#import "XYRealNameModel.h"

@interface XYTradePasswordNextController ()
@property (nonatomic, copy) NSString *verifyCode;
@end

@implementation XYTradePasswordNextController

- (instancetype)initWithVerifyCode:(NSString *)verifyCode {
    self = [super init];
    if (self) {
        _verifyCode = verifyCode;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    self.tradeModel = [[XYRealNameModel alloc] initWithTitle:NSLocalizedString(@"Mine_Setting_AC_TP_Password", nil) content:nil description:nil placeHolder:NSLocalizedString(@"Mine_Setting_AC_TP_PasswordPH", nil)];
    [self.footerButton setTitle:NSLocalizedString(@"Public_Complete", nil) forState:UIControlStateNormal];
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 7.0)];
    headerView.backgroundColor = XYGlobalUI.backgroundColor;
    self.tableView.tableHeaderView = headerView;
}

#pragma mark -
#pragma mark - Override

- (void)footerOperateButtonAction:(UIButton *)button {
    if (!_verifyCode) {
        return;
    }
    
    [self.view endEditing:YES];
    // 自己的操作
    __weak typeof(self) weakSelf = self;
    [self sendRequest:^(XMRequest * _Nonnull request) {
        request.api = Mine_ChangeTradePassowrd_URL;
        request.parameters = @{@"userId" : XYCurrentUser.userID,
                               @"valiCode" : weakSelf.verifyCode,
                               @"pwd" : weakSelf.tradeModel.content
                               };
    } showHUD:YES onSuccess:^(id  _Nullable responseObject) {
        [weakSelf showHUDText:@"交易密码修改成功"];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [weakSelf.navigationController popToRootViewControllerAnimated:YES];
        });
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
