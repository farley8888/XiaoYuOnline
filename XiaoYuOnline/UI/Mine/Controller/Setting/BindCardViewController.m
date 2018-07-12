//
//  BindCardViewController.m
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/5/8.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "BindCardViewController.h"
#import "XYRealNameModel.h"

@interface BindCardViewController ()

@end

@implementation BindCardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = NSLocalizedString(@"Mine_Setting_BindCard", nil);
    self.itemList = [XYRealNameModel bindBankCardDatasourceList];
}

- (void)footerViewButtonAction:(UIButton *)button {
    __weak typeof(self) weakSelf = self;
    NSArray *keys = @[@"realName", @"cardId", @"paypwd", @"phone"];
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithObject:XYCurrentUser.userID forKey:@"userId"];
    for (NSUInteger i = 0, count = keys.count; i < count; i ++) {
        XYRealNameModel *model = weakSelf.itemList[i];
        [params setObject:model.content forKey:keys[i]];
    }
    [self sendRequest:^(XMRequest * _Nonnull request) {
        request.api = Mine_BindCard_URL;
        request.parameters = params;
    } onSuccess:^(id  _Nullable responseObject) {
        [XYCurrentUser updateUserCardInfoWithData:responseObject[@"bank"]];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [weakSelf.navigationController popToRootViewControllerAnimated:NO];
        });
    } successHint:@"绑卡成功" onFailure:NULL];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
