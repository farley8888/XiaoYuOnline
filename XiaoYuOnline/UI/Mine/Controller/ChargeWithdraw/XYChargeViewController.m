//
//  XYChargeViewController.m
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/7.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "XYChargeViewController.h"
#import "XYRealNameTableViewCell.h"
#import "XYChargeWithdrawViewCell.h"
#import "XYCompleteViewController.h"
#import "XYSettingRealNameController.h"
#import "XYBindCardViewController.h"
#import "UIViewController+ShowTextHUD.h"
#import "NSString+Common.h"

#if !TARGET_OS_SIMULATOR
#import <FUMobilePay/FUMobilePay.h>
#endif


static NSString *chargeReuseID = @"XYChargeCellReuseIdentifier";

@implementation XYChargeWithdrawModel
@end

#if !TARGET_OS_SIMULATOR
@interface XYChargeViewController ()<FYPayDelegate>
#else
@interface XYChargeViewController ()
#endif

@end

@implementation XYChargeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = NSLocalizedString(@"Mine_Setting_Charge_Title", nil);
    
    NSString *bankCard = @"";
    if (XYCurrentUser.userState == XYUserStateLogin && XYCurrentUser.realName) {
        bankCard = XYCurrentUser.partBankCardID;
    }
    
    self.itemList = @[[[XYChargeWithdrawModel alloc] initWithTitle:NSLocalizedString(@"Mine_Setting_Charge_BankNum.", nil) content:nil description:bankCard placeHolder:nil],
                      [[XYChargeWithdrawModel alloc] initWithTitle:NSLocalizedString(@"Mine_Setting_Charge_Volume", nil) content:nil description:nil placeHolder:NSLocalizedString(@"Mine_Setting_Charge_Volume_PH", nil)],
                      [[XYChargeWithdrawModel alloc] initWithTitle:NSLocalizedString(@"Mine_Setting_Charge_Password", nil) content:nil description:nil placeHolder:NSLocalizedString(@"Mine_Setting_OperatePwd_PH", nil)]
                      ];
    [self.tableView registerClass:[XYChargeWithdrawViewCell class] forCellReuseIdentifier:chargeReuseID];
}

- (UIView *)tableFooterView {
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 100)];
    footerView.backgroundColor = XYGlobalUI.backgroundColor;
    
    _operateButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_operateButton setBackgroundImage:XYGlobalUI.yellowButtonBackgroundImage forState:UIControlStateNormal];
    [_operateButton setTitleColor:XYGlobalUI.whiteColor forState:UIControlStateNormal];
    [_operateButton setTitle:NSLocalizedString(@"Mine_Setting_Charge_Now", nil) forState:UIControlStateNormal];
    [_operateButton addTarget:self action:@selector(operateButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    _operateButton.enabled = NO;
    [footerView addSubview:_operateButton];
    
    UIButton *forgetPwdBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    forgetPwdBtn.titleLabel.font = XYGlobalUI.smallFont_12;
    [forgetPwdBtn setTitleColor:XYGlobalUI.grayColor forState:UIControlStateNormal];
    [forgetPwdBtn setTitle:NSLocalizedString(@"Public_ForgotPwd", nil) forState:UIControlStateNormal];
    [footerView addSubview:forgetPwdBtn];
    
    [_operateButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(footerView).offset(8.0);
        make.centerX.equalTo(footerView);
        make.size.mas_equalTo(CGSizeMake(260.0, 65.0));
    }];
    [forgetPwdBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_operateButton.mas_bottom).offset(18.0);
        make.leading.equalTo(footerView).offset(18.0);
        make.trailing.equalTo(footerView).offset(-18.0);
    }];
    
    return footerView;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    if (XYCurrentUser.userState == XYUserStateLogin) {
        __weak typeof(self) weakSelf = self;
        UIAlertAction *operateAction;
        NSString *message;
        NSString *title;
        if (!XYCurrentUser.realName) {
            title = @"实名认证";
            message = @"你好，系统检测到您当前并没有实名认证，不能进行充值或者提现操作！";
            operateAction = [UIAlertAction actionWithTitle:@"实名认证" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                XYSettingRealNameController *vc = [[XYSettingRealNameController alloc] init];
                [weakSelf.navigationController pushViewController:vc animated:YES];
            }];
        } else if (!XYCurrentUser.bankCardID){
            title = @"绑定银行卡";
            message = @"你好，系统检测到您当前并没有绑定银行卡，不能进行充值或者提现操作！";
            operateAction = [UIAlertAction actionWithTitle:@"绑卡" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                XYBindCardViewController *vc = [[XYBindCardViewController alloc] init];
                [weakSelf.navigationController pushViewController:vc animated:YES];
            }];
        }
        
        if (!XYCurrentUser.realName || !XYCurrentUser.bankCardID) {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"返回" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                [weakSelf.navigationController popViewControllerAnimated:YES];
            }];
            
            [alert addAction:cancel];
            [alert addAction:operateAction];
            [self presentViewController:alert animated:YES completion:NULL];
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    XYChargeWithdrawViewCell *cell = [tableView dequeueReusableCellWithIdentifier:chargeReuseID forIndexPath:indexPath];
    if (indexPath.row == 0) {
        cell.textField.userInteractionEnabled = NO;
    } else {
        cell.textField.userInteractionEnabled = YES;
    }
    
    XYRealNameModel *model = self.itemList[indexPath.row];
    cell.titleLabel.text = model.title;
    cell.textField.placeholder = model.placeHolder;
    cell.descriptionLabel.text = model.scriptDescription;
    cell.descriptionLabel.textColor = XYGlobalUI.blackColor;
    cell.textField.textAlignment = NSTextAlignmentRight;
    [cell.textField addTarget:self action:@selector(textFieldValueChanged) forControlEvents:UIControlEventEditingChanged];
    
    return cell;
}

#pragma mark - Event Response

- (void)textFieldValueChanged {
    for (NSUInteger i = 1, count = self.itemList.count; i < count; i ++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
        UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
        UITextField *tf = ((XYRealNameTableViewCell *)cell).textField;
        self.itemList[i].scriptDescription = tf.text;
        
        NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
        if ([tf.text stringByTrimmingCharactersInSet:set].length > 0) {
            _operateButton.enabled = YES;
        } else {
            _operateButton.enabled = NO;
            return;
        }
    }
}

#pragma mark -
#pragma mark - EventResponse

- (void)operateButtonAction:(UIButton *)button {
    [self.view endEditing:YES];
    
    // 请求操作后
    if (self.itemList.count == 3) {
        NSString *bankNum = XYCurrentUser.bankCardID;
        NSString *value = self.itemList[1].scriptDescription;
        NSString *pwd = self.itemList[2].scriptDescription;
        NSString *orderId = [[NSString stringWithFormat:@"%@-%@-%@",XYCurrentUser.userID, @(arc4random()), @([[NSDate date] timeIntervalSince1970])] md5];
        
        NSArray *keys = @[@"bankCard", @"amt", @"pwd"];
        NSMutableDictionary *params = [NSMutableDictionary dictionaryWithObject:orderId forKey:@"orderId"];
        [params setObject:XYCurrentUser.userID forKey:@"userId"];
        for (NSUInteger i = 0, count = keys.count; i < count; i ++) {
            XYRealNameModel *model = self.itemList[i];
            [params setObject:model.scriptDescription forKey:keys[i]];
        }
        
        __weak typeof(self) weakSelf = self;
        [self sendRequest:^(XMRequest * _Nonnull request) {
            request.api = Mine_Charge_URL;
            request.parameters = params;
        } onSuccess:^(id  _Nullable responseObject) {
            [weakSelf chargeWithBankNum:bankNum value:value tradePassword:pwd orderID:orderId];
        } successHint:nil onFailure:NULL];
    }
}

- (void)chargeWithBankNum:(NSString *)bankNum value:(NSString *)value tradePassword:(NSString *)tradePassword orderID:(NSString *)orderId {
#if !TARGET_OS_SIMULATOR
    // 发起富友支付
    NSString * myVERSION = FY_MYVERSION;
    NSString * myMCHNTCD = FY_MCHNTCD;
    NSString * myMCHNTORDERID = orderId;
    NSString * myUSERID = XYCurrentUser.userID;
    NSString * myAMT = [NSString stringWithFormat:@"%@", @(value.floatValue * 100)];
    NSString * myBANKCARD = bankNum;
    NSString * myBACKURL = [NSString stringWithFormat:@"%@%@?userId=%@", XYBaseURL, Mine_Charge_CallBack_URL, XYCurrentUser.userID];
    NSString * myNAME = XYCurrentUser.realName;
    NSString * myIDNO = XYCurrentUser.cardID;
    NSString * myIDTYPE = FY_IDTYPE;
    NSString * myTYPE = FY_PAYTYPE;
    NSString * mySIGNTP = FY_SIGNTP;
    NSString * myMCHNTCDKEY= FY_MCHNTCDKEY;
    NSString * mySIGN = [[NSString stringWithFormat:@"%@|%@|%@|%@|%@|%@|%@|%@|%@|%@|%@|%@", myTYPE,myVERSION,myMCHNTCD,myMCHNTORDERID,myUSERID,myAMT,myBANKCARD,myBACKURL,myNAME,myIDNO,myIDTYPE,myMCHNTCDKEY] md5];
    NSDictionary * param = @{@"TYPE":myTYPE,@"VERSION":myVERSION,@"MCHNTCD":myMCHNTCD,@"MCHNTORDERID":myMCHNTORDERID,@"USERID":myUSERID,
                             @"AMT":myAMT,@"BANKCARD":myBANKCARD,@"BACKURL":myBACKURL,@"NAME":myNAME,@"IDNO":myIDNO,@"IDTYPE":myIDTYPE,
                             @"SIGNTP":mySIGNTP,@"SIGN":mySIGN , @"TEST" : FY_ISTEST
                             };
 
    FUMobilePay * pay = [FUMobilePay shareInstance];
    [pay mobilePay:param delegate:self];
#endif
 }

- (void)payCallBack:(BOOL)success responseParams:(NSDictionary *)responseParams {
#if !TARGET_OS_SIMULATOR
    NSLog(@"fuiouPayFailure:%@", responseParams);
    NSString *code = [NSString stringWithFormat:@"%@", responseParams[@"RESPONSECODE"]];
    if ([code isEqualToString:@"0000"]) {
        [self showHUDText:@"充值成功"];
        // 要求充值成功后返回首页
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.navigationController popToRootViewControllerAnimated:NO];
            UIWindow *window = [UIApplication sharedApplication].delegate.window;
            if ([window.rootViewController isKindOfClass:[UITabBarController class]]) {
                UITabBarController *tabBar = (UITabBarController *)window.rootViewController;
                [tabBar setSelectedIndex:0];
                // 充值成功后更新用户信息
                [[NSNotificationCenter defaultCenter] postNotificationName:XYUserAssetDidChangedNotification object:nil];
            }
        });
    } else {
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"提示" message:[NSString stringWithFormat:@"%@-%@", responseParams[@"RESPONSEMSG"], responseParams[@"RESPONSECODE"]] delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [alert show];
    }
#endif
}

-(void) fuWeiXinPayCallBackWithResponseParams:(NSDictionary*) responseParams {
    
}

@end
