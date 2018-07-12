//
//  XYRegisterController.m
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/14.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "RegisterController.h"
#import "RealNameTableViewCell.h"
#import "RegisterViewCell.h"
#import "RegisterFooterView.h"
#import "RegisterModel.h"

static NSString *registerCustomReuseID = @"registerCustomCellReuseIdentifier";
static NSString *registerImageCellReuseID = @"registerImageCellReuseIdentifier";

@interface RegisterController ()<UITextFieldDelegate>
@property (nonatomic, strong) NSArray<RegisterModel *> *itemList;
@property (nonatomic, strong) UIButton *registerButton;
@property (nonatomic, strong) UIButton *acceptLicenseButton;
@end

@implementation RegisterController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = NSLocalizedString(@"Account_Register_Title", nil);
    _itemList = [RegisterModel registerDatasourceList];
    
    self.tableView.rowHeight = 48.0;
    self.tableView.sectionHeaderHeight = 8;
    self.tableView.tableFooterView = [[RegisterFooterView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 160)];
    self.tableView.backgroundColor = XYGlobalUI.backgroundColor;
    self.tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    [self.tableView registerClass:[RealNameTableViewCell class] forCellReuseIdentifier:registerCustomReuseID];
    [self.tableView registerClass:[RegisterViewCell class] forCellReuseIdentifier:registerImageCellReuseID];
    
    [self addButtonAction];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapContentScrollAction)];
    [self.view addGestureRecognizer:tap];
}

- (void)addButtonAction {
    RegisterFooterView *view = (RegisterFooterView *)self.tableView.tableFooterView;
    [view.loginButton addTarget:self action:@selector(loginButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [view.registerButton addTarget:self action:@selector(registerButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [view.checkboxButton addTarget:self action:@selector(textFieldValueChanged) forControlEvents:UIControlEventTouchUpInside];
    
    _registerButton = view.registerButton;
    _registerButton.enabled = NO;
    _acceptLicenseButton = view.checkboxButton;
    _acceptLicenseButton.selected = YES;
}

#pragma mark - Table view data source

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [UIView new];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _itemList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = nil;
    RegisterModel *model = _itemList[indexPath.row];
    /*
    if (indexPath.row == 1) {
        XYRegisterViewCell *cell0 = [tableView dequeueReusableCellWithIdentifier:registerImageCellReuseID forIndexPath:indexPath];
        cell0.titleLabel.text = model.title;
        cell0.textField.placeholder = model.placeHolder;
        [cell0.textField addTarget:self action:@selector(textFieldValueChanged) forControlEvents:UIControlEventEditingChanged];
        
        cell = cell0;
    } else {
        RealNameTableViewCell *cell1 = [tableView dequeueReusableCellWithIdentifier:registerCustomReuseID forIndexPath:indexPath];
        cell1.titleLabel.text = model.title;
        cell1.textField.placeholder = model.placeHolder;
        if (model.scriptDescription) {
            cell1.rightView.hidden = NO;
            [cell1.rightView.sendButton setTitle:model.scriptDescription forState:UIControlStateNormal];
            [cell1.rightView.sendButton addTarget:self action:@selector(sendVerifyCodeButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        } else {
            cell1.rightView.hidden = YES;
        }
        [cell1.textField addTarget:self action:@selector(textFieldValueChanged) forControlEvents:UIControlEventEditingChanged];
        
        cell = cell1;
    }*/
    RealNameTableViewCell *cell1 = [tableView dequeueReusableCellWithIdentifier:registerCustomReuseID forIndexPath:indexPath];
    cell1.titleLabel.text = model.title;
    cell1.textField.delegate = self;
    cell1.textField.placeholder = model.placeHolder;
    if (model.scriptDescription) {
        cell1.rightView.hidden = NO;
        [cell1.rightView.sendButton setTitle:model.scriptDescription forState:UIControlStateNormal];
        [cell1.rightView.sendButton addTarget:self action:@selector(sendVerifyCodeButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    } else {
        cell1.rightView.hidden = YES;
    }
    [cell1.textField addTarget:self action:@selector(textFieldValueChanged) forControlEvents:UIControlEventEditingChanged];
    
    cell = cell1;
    
    return cell;
}

- (void)textFieldValueChanged {
    for (NSUInteger i = 0, count = _itemList.count; i < count; i ++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
        UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
        UITextField *tf = ((RealNameTableViewCell *)cell).textField;
        tf.delegate = self;
        _itemList[i].content = tf.text;
        
        NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
        if (i < count - 1) {
            if ([tf.text stringByTrimmingCharactersInSet:set].length > 0 && _acceptLicenseButton.selected) {
                _registerButton.enabled = YES;
            } else {
                _registerButton.enabled = NO;
            }
        }
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (_registerButton.enabled) {
        [self loginButtonAction:_registerButton];
    }
    return _registerButton.enabled;
}

- (void)loginButtonAction:(UIButton *)button {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)registerButtonAction:(UIButton *)button {
    [self.view endEditing:YES];
    
    NSArray *paramKeys = @[@"mobilePhone", @"valiCode", @"pwd", @"recommendPhone"];
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithObject:@YES forKey:@"agree"];
    NSArray *cells = self.tableView.visibleCells;
    for (NSUInteger i = 0, count = cells.count; i < count; i ++) {
        [params setObject:_itemList[i].content forKey:paramKeys[i]];
    }
    
    __weak typeof(self) weakSelf = self;
    [self sendRequest:^(XMRequest * _Nonnull request) {
        request.parameters = params;
        request.api = Account_Register;
    } onSuccess:^(id  _Nullable responseObject) {
        [weakSelf.navigationController popViewControllerAnimated:YES];
    } successHint:@"注册成功" onFailure:NULL];
}

- (void)sendVerifyCodeButtonAction:(UIButton *)button {
    NSString *phone = _itemList[0].content;
    [self sendRequest:^(XMRequest * _Nonnull request) {
        request.api = Account_SendVerifyCodeURL;
        request.parameters = @{@"mobile" : phone};
    } onSuccess:^(id  _Nullable responseObject) {
        UIView *view = button.superview;
        if ([view isKindOfClass:[SendVerifyCodeView class]]) {
            [(SendVerifyCodeView *)view start60SecondCountDown];
        }
    } successHint:@"验证码已发送" onFailure:NULL];
}

- (void)tapContentScrollAction {
    [self.tableView endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
