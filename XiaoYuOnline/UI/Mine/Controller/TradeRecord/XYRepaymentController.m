//
//  XYRepaymentController.m
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/13.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "XYRepaymentController.h"
#import "XYCompleteViewController.h"
#import "XYPhoneCodeVerifyView.h"
#import "XYCompleteViewController.h"

@interface XYRepaymentController ()

@end

@implementation XYRepaymentController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = NSLocalizedString(@"Mine_TradeRecord_Bid_Repayment", nil);
    NSString *testS = @"上海银行（尾号:0000）";
    self.itemList = @[[[XYChargeWithdrawModel alloc] initWithTitle:NSLocalizedString(@"Mine_TR_BR_BankAccount", nil) content:nil description:testS placeHolder:nil],
                      [[XYChargeWithdrawModel alloc] initWithTitle:NSLocalizedString(@"Mine_TR_BR_RepaymentVolumn", nil) content:nil description:nil placeHolder:NSLocalizedString(@"Mine_TR_BR_RepaymentVolumn_PH", nil)],
                      [[XYChargeWithdrawModel alloc] initWithTitle:NSLocalizedString(@"Mine_Setting_Withdraw_Password", nil) content:nil description:nil placeHolder:NSLocalizedString(@"Mine_Setting_OperatePwd_PH", nil)]
                      ];
    
    [self.operateButton setTitle:NSLocalizedString(@"Mine_TR_BR_RepaymentNow", nil) forState:UIControlStateNormal];
}

#pragma mark -
#pragma mark - EventResponse

- (void)operateButtonAction:(UIButton *)button {
    // 请求操作后
    // ... 下面都是测试代码
    BOOL succ = arc4random() % 2 ==0;
    UIImage *image = nil;
    NSString *des = nil;
    NSString *btnT = nil;
    if (succ) {
        image = [UIImage imageNamed:@"withdraw_success.jpg"];
        des = NSLocalizedString(@"Mine_TR_BR_RepaymentNow_Success", nil);
        btnT = NSLocalizedString(@"Public_Complete", nil);
    } else {
        image = [UIImage imageNamed:@"withdraw_failure.jpg"];
        des = NSLocalizedString(@"Mine_TR_BR_RepaymentNow_Failure", nil);
        btnT = NSLocalizedString(@"Public_Back", nil);
    }
    
    XYPhoneCodeVerifyView *view = [XYPhoneCodeVerifyView phoneCodeVerifyView];
    [view show];
    __weak typeof(self) weakSelf = self;
    __weak typeof(view) weakView = view;
    view.commitBlock = ^(NSString *phone, NSString *code) {
        [weakView dismiss];
    };
    
    view.dismissBlock = ^() {
        XYCompleteViewController *vc = [[XYCompleteViewController alloc] initWithImage:image title:NSLocalizedString(@"Mine_TradeRecord_Bid_Repayment", nil)];
        vc.buttonTitle = btnT;
        vc.descriptText = des;
        vc.success = succ;
        [weakSelf.navigationController pushViewController:vc animated:YES];
    };
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
