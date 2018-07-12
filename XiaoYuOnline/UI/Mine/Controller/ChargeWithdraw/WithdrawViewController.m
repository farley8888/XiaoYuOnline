//
//  XYWithdrawViewController.m
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/7.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "WithdrawViewController.h"
#import "CompleteViewController.h"

@interface WithdrawViewController ()

@end

@implementation WithdrawViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = NSLocalizedString(@"Mine_Setting_Withdraw_Title", nil);
    NSString *bankCard = @"";
    if (XYCurrentUser.userState == OLUserStateLogin && XYCurrentUser.realName) {
        bankCard = XYCurrentUser.partBankCardID;
    }
    self.itemList = @[[[ChargeWithdrawModel alloc] initWithTitle:NSLocalizedString(@"Mine_Setting_Withdraw_BankNum.", nil) content:nil description:bankCard placeHolder:nil],
                      [[ChargeWithdrawModel alloc] initWithTitle:NSLocalizedString(@"Mine_Setting_Withdraw_Volume", nil) content:nil description:nil placeHolder:NSLocalizedString(@"Mine_Setting_Withdraw_Volume_PH", nil)],
                      [[ChargeWithdrawModel alloc] initWithTitle:NSLocalizedString(@"Mine_Setting_Withdraw_Password", nil) content:nil description:nil placeHolder:NSLocalizedString(@"Mine_Setting_OperatePwd_PH", nil)]
                      ];
    
    [self.operateButton setTitle:NSLocalizedString(@"Mine_Setting_Withdraw_Now", nil) forState:UIControlStateNormal];
}

#pragma mark -
#pragma mark - EventResponse

- (void)operateButtonAction:(UIButton *)button {
    [self.view endEditing:YES];
    // 请求操作后
    // ...
    __weak typeof(self) weakSelf = self;
    NSArray *paramKeys = @[@"amt", @"pwd"];
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithObject:XYCurrentUser.userID forKey:@"userId"];
    [params setObject:XYCurrentUser.bankCardIdentifier forKey:@"bankId"];
    for (NSInteger i = 0, count = paramKeys.count; i < count; i ++) {
        ChargeWithdrawModel *m = (ChargeWithdrawModel *)self.itemList[i+1];
        [params setObject:m.scriptDescription forKey:paramKeys[i]];
    }
    
    [self sendRequest:^(XMRequest * _Nonnull request) {
        request.api = Mine_Withdraw_URL;
        request.parameters = params;
    } onSuccess:^(id  _Nullable responseObject) {
        [weakSelf completeWithState:YES];
        [[NSNotificationCenter defaultCenter] postNotificationName:OLUserAssetDidChangedNotification object:responseObject];
    } successHint:@"提现成功" onFailure:^(NSError * _Nullable error) {
        [weakSelf completeWithState:NO];
    }];
}

- (void)completeWithState:(BOOL)success {
    UIImage *image = nil;
    NSString *des = nil;
    NSString *btnT = nil;
    if (success) {
        image = [UIImage imageNamed:@"withdraw_success.jpg"];
        des = NSLocalizedString(@"Mine_Setting_Withdraw_Success", nil);
        btnT = NSLocalizedString(@"Public_Complete", nil);
    } else {
        image = [UIImage imageNamed:@"withdraw_failure.jpg"];
        des = NSLocalizedString(@"Mine_Setting_Withdraw_Failure", nil);
        btnT = NSLocalizedString(@"Public_Back", nil);
    }
    
    CompleteViewController *vc = [[CompleteViewController alloc] initWithImage:image title:NSLocalizedString(@"Mine_Setting_Withdraw_Title", nil)];
    vc.buttonTitle = btnT;
    vc.descriptText = des;
    vc.success = success;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
