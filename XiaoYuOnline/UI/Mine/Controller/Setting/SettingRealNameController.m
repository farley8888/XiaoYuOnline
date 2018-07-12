//
//  XYSettingRealNameController.m
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/5.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "SettingRealNameController.h"
#import "BindCardViewController.h"
#import "XYRealNameTableViewCell.h"
#import "XYRealNameModel.h"

static NSString *realNameReuseID = @"XYRealNameReuseIdentifier";

@interface SettingRealNameController ()
@property (nonatomic, strong) UIButton *acceptLicenseButton;
@property (nonatomic, strong) UIButton *commitButton;
@end

@implementation SettingRealNameController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    _itemList = [XYRealNameModel realNameDatasourceList];
    
    self.title = NSLocalizedString(@"Mine_Setting_RealName", nil);
    self.tableView.backgroundColor = XYGlobalUI.backgroundColor;
    self.tableView.rowHeight = 48.0;
    self.tableView.sectionHeaderHeight = 7.0;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.tableFooterView = [self tableFooterView];
    self.tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    [self.tableView registerClass:[XYRealNameTableViewCell class] forCellReuseIdentifier:realNameReuseID];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapContentScrollAction)];
    [self.view addGestureRecognizer:tap];
}

- (UIView *)tableFooterView {
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 100)];
    footerView.backgroundColor = XYGlobalUI.backgroundColor;
    
    UIButton *checkbox = [UIButton buttonWithType:UIButtonTypeCustom];
    [checkbox setImage:[UIImage imageNamed:@"mine_setting_checkBox"] forState:UIControlStateNormal];
    [checkbox setImage:[UIImage imageNamed:@"account_login_remember_sel"] forState:UIControlStateSelected];
    [checkbox addTarget:self action:@selector(checboxButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *protocolBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [footerView addSubview:protocolBtn];
    [footerView addSubview:checkbox];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:XYGlobalUI.yellowButtonBackgroundImage forState:UIControlStateNormal];
    [button addTarget:self action:@selector(footerViewButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [button setTitleColor:XYGlobalUI.whiteColor forState:UIControlStateNormal];
    [button setTitle:NSLocalizedString(@"Public_Sure", nil) forState:UIControlStateNormal];
    [footerView addSubview:button];
    
    // Layout
    [checkbox mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(40.0, 40.0));
        make.top.equalTo(footerView);
        make.left.equalTo(footerView).offset(7.0);
    }];
    [protocolBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(checkbox.mas_right).offset(-5.0);
        make.centerY.equalTo(checkbox);
    }];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(footerView);
        make.bottom.equalTo(footerView);
        make.size.mas_equalTo(CGSizeMake(260.0, 65.0));
    }];
    
    NSString *text = @"我已经阅读并接受《平台注册协议》";
    NSDictionary *normalAtt = @{NSFontAttributeName : XYGlobalUI.smallFont_12, NSForegroundColorAttributeName : XYGlobalUI.blackColor};
    NSDictionary *orangeAtt = @{NSFontAttributeName : XYGlobalUI.smallFont_12, NSForegroundColorAttributeName : XYGlobalUI.yellowColor};
    NSMutableAttributedString *ms = [[NSMutableAttributedString alloc] initWithString:text attributes:normalAtt];
    [ms setAttributes:orangeAtt range:[text rangeOfString:@"《平台注册协议》"]];
    [protocolBtn setAttributedTitle:ms forState:UIControlStateNormal];
    _acceptLicenseButton = checkbox;
    _commitButton = button;
    _acceptLicenseButton.selected = YES;
    _commitButton.enabled = NO;
    
    return footerView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _itemList.count;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [UIView new];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    XYRealNameTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:realNameReuseID forIndexPath:indexPath];
    XYRealNameModel *model = _itemList[indexPath.row];
    cell.titleLabel.text = model.title;
    cell.textField.placeholder = model.placeHolder;
    cell.descriptionLabel.text = model.scriptDescription;
    [cell.textField addTarget:self action:@selector(textFieldValueChanged) forControlEvents:UIControlEventEditingChanged];
    
    return cell;
}

- (void)checboxButtonAction:(UIButton *)button {
    button.selected = !button.selected;
}

- (void)tapContentScrollAction {
    [self.tableView endEditing:YES];
}

#pragma mark - Event Response

- (void)textFieldValueChanged {
    for (NSUInteger i = 0, count = _itemList.count; i < count; i ++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
        UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
        UITextField *tf = ((XYRealNameTableViewCell *)cell).textField;
        _itemList[i].content = tf.text;
        
        NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
        if (i < count - 1) {
            if ([tf.text stringByTrimmingCharactersInSet:set].length > 0 && _acceptLicenseButton.selected) {
                _commitButton.enabled = YES;
            } else {
                _commitButton.enabled = NO;
                return;
            }
        }
    }
}

- (void)footerViewButtonAction:(UIButton *)button {
    [self.view endEditing:YES];
    
    __weak typeof(self) weakSelf = self;
    NSArray *keys = @[@"realName", @"cardId", @"phone"];
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithObject:XYCurrentUser.userID forKey:@"userId"];
    for (NSUInteger i = 0, count = keys.count; i < count; i ++) {
        XYRealNameModel *model = weakSelf.itemList[i];
        [params setObject:model.content forKey:keys[i]];
    }
    [self sendRequest:^(XMRequest * _Nonnull request) {
        request.api = Mine_RealName_URL;
        request.parameters = params;
    } onSuccess:^(id  _Nullable responseObject) {
        [XYCurrentUser updateUserRealNameWithData:responseObject[@"info"]];
        BindCardViewController *vc = [[BindCardViewController alloc] init];
        [weakSelf.navigationController pushViewController:vc animated:YES];
    } successHint:@"认证成功" onFailure:NULL];
}

@end
