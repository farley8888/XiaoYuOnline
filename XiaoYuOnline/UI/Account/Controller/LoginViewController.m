//
//  XYLoginViewController.m
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/13.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterController.h"
#import "WKSegementSliderView.h"
#import "PasswordLoginView.h"
#import "UIViewController+KeyboardHandler.h"
#import "UIViewController+ShowTextHUD.h"
#import "SendVerifyCodeView.h"
#import "UIView+Common.h"

@interface LoginViewController ()<WKSegementSliderViewDelegate, UIScrollViewDelegate, UITextFieldDelegate>
@property (nonatomic, strong) UIImageView *logoView;
@property (nonatomic, strong) UIScrollView  *contentScroll;
@property (nonatomic, strong) UIScrollView  *bottomScroll;
@property (nonatomic, strong) WKSegementSliderView *sliderView;
@property (nonatomic, strong) FastLoginView *fastLoginView;
@property (nonatomic, strong) PasswordLoginView *passwordLoginView;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = XYGlobalUI.backgroundColor;
    self.title = NSLocalizedString(@"Account_Login_Title", nil);
    
    _contentScroll = [[UIScrollView alloc] init];
    _contentScroll.backgroundColor = XYGlobalUI.backgroundColor;
    _contentScroll.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    _contentScroll.alwaysBounceVertical = YES;
    [self.view addSubview:_contentScroll];
    
    [self loadSubviewsWithContentView:_contentScroll];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapContentScrollAction)];
    [_contentScroll addGestureRecognizer:tap];
}

- (void)loadSubviewsWithContentView:(UIView *)contentView {
    _logoView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mine_aboutUs_logo"]];
    _sliderView = [[WKSegementSliderView alloc] initWithFrame:CGRectZero itemTitles:@[NSLocalizedString(@"Account_Login_FastLogin", nil), NSLocalizedString(@"Account_Login_PasswordLogin", nil)]];
    
    _sliderView.signBarSize = CGSizeMake(SCREEN_WIDTH / 2.0, 4.0);
    _sliderView.normalTextColor = XYGlobalUI.blackColor;
    _sliderView.selectedTextColor = XYGlobalUI.mainColor;
    _sliderView.backgroundColor = XYGlobalUI.whiteColor;
    _sliderView.delegate = self;
    
    _bottomScroll = [[UIScrollView alloc] init];
    _bottomScroll.backgroundColor = XYGlobalUI.backgroundColor;
    _bottomScroll.showsHorizontalScrollIndicator = NO;
    _bottomScroll.delegate = self;
    
    _fastLoginView = [[FastLoginView alloc] init];
    _fastLoginView.phoneTextField.delegate = self;
    _fastLoginView.bottomTextField.delegate = self;
    _fastLoginView.backgroundColor = XYGlobalUI.backgroundColor;
    [_fastLoginView.createAccountButton addTarget:self action:@selector(createAccountButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [_fastLoginView.loginButon addTarget:self action:@selector(loginButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [_fastLoginView.sendVerifyCodeView.sendButton addTarget:self action:@selector(sendVerifyCodeButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    _passwordLoginView = [[PasswordLoginView alloc] init];
    _passwordLoginView.phoneTextField.delegate = self;
    _passwordLoginView.bottomTextField.delegate = self;
    _passwordLoginView.backgroundColor = XYGlobalUI.backgroundColor;
    _passwordLoginView.rememberPassword.selected = YES;
    [_passwordLoginView.createAccountButton addTarget:self action:@selector(createAccountButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [_passwordLoginView.loginButon addTarget:self action:@selector(loginButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [contentView addSubview:_logoView];
    [contentView addSubview:_sliderView];
    [contentView addSubview:_bottomScroll];
    [_bottomScroll addSubview:_fastLoginView];
    [_bottomScroll addSubview:_passwordLoginView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self registerKeyboardNotification];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self removeKeyboardNotification];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    CGSize size = self.view.frame.size;
    CGFloat bottomScrollH = 280;
    
    _logoView.bounds = CGRectMake(0, 0, 98, 98);
    _logoView.center = CGPointMake(size.width / 2.0, 30 + _logoView.height / 2.0);
    
    _sliderView.frame = CGRectMake(0, _logoView.bottom + 36, size.width, 50);
    _bottomScroll.frame = CGRectMake(0, _sliderView.bottom, size.width, bottomScrollH);
    _bottomScroll.contentSize = CGSizeMake(size.width * 2, _bottomScroll.height);
    _bottomScroll.pagingEnabled = YES;
    
    _fastLoginView.frame = CGRectMake(0, 0, size.width, _bottomScroll.height);
    _passwordLoginView.frame = CGRectMake(size.width, 0, size.width, _bottomScroll.height);
    
    _contentScroll.frame = self.view.bounds;
    _contentScroll.contentSize = CGSizeMake(size.width, _sliderView.bottom + bottomScrollH);
    
    if (!self.originContentInset) {
        self.originContentInset = [NSValue valueWithUIEdgeInsets:_contentScroll.contentInset];
    }
}

#pragma mark -
#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (_sliderView.selectedIndex == 0) {
        if (_fastLoginView.loginButon.enabled) {
            [self loginButtonAction:_fastLoginView.loginButon];
        }
        return _fastLoginView.loginButon.enabled;
    } else {
        if (_passwordLoginView.loginButon.enabled) {
            [self loginButtonAction:_passwordLoginView.loginButon];
        }
        return _passwordLoginView.loginButon.enabled;
    }
}

#pragma mark -
#pragma mark - WKSegementSliderViewDelegate

- (void)sliderSegementBar:(WKSegementSliderView *)bar didSeletedItemAtIndex:(NSUInteger)index forward:(BOOL)isForward {
    CGPoint offset = CGPointMake(index * _bottomScroll.width, 0);
    [_bottomScroll setContentOffset:offset animated:YES];
}

#pragma mark -
#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (scrollView == _bottomScroll) {
        CGPoint offset = scrollView.contentOffset;
        NSInteger index = (NSInteger)(offset.x / scrollView.width);
        [_sliderView setSelectedIndex:index animate:YES];
    }
}

#pragma mark -
#pragma mark - Event Response

- (void)createAccountButtonAction {
    RegisterController *vc = [[RegisterController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)loginButtonAction:(UIButton *)button {
    [self tapContentScrollAction];
    
    __weak typeof(self) weakSelf = self;
    if (button == _passwordLoginView.loginButon) {
        NSString *phone = _passwordLoginView.phoneTextField.text;
        NSString *password = _passwordLoginView.bottomTextField.text;
        NSDictionary *param = @{@"password" : password, @"username" : phone};
        [self sendRequest:^(XMRequest * _Nonnull request) {
            request.api = Account_LoginURL;
            request.parameters = param;
        } onSuccess:^(id  _Nullable responseObject) {
            [[OLUser currentUser] updateUserWithLoginApiData:responseObject];
            [weakSelf.navigationController popViewControllerAnimated:YES];
        }  successHint:@"登录成功" onFailure:NULL];
    } else { 
        NSString *phone = _fastLoginView.phoneTextField.text;
        NSString *code = _fastLoginView.bottomTextField.text;
        NSDictionary *param = @{@"mobilecode" : code, @"username" : phone};
        [self sendRequest:^(XMRequest * _Nonnull request) {
            request.api = Account_LoginFastURL;
            request.parameters = param;
        } onSuccess:^(id  _Nullable responseObject) {
            [[OLUser currentUser] updateUserWithLoginApiData:responseObject];
            [weakSelf.navigationController popViewControllerAnimated:YES];
        }  successHint:@"登录成功" onFailure:NULL];
    }
}

- (void)tapContentScrollAction {
    [_contentScroll endEditing:YES];
}

- (void)sendVerifyCodeButtonAction:(UIButton *)button {
    if (!_fastLoginView.sendVerifyCodeView.sendButton.enabled) {
        return;
    }
    
    NSString *phone = _fastLoginView.phoneTextField.text;
    __weak typeof(self) weakSelf = self;
    [self sendRequest:^(XMRequest * _Nonnull request) {
        request.api = Account_SendVerifyCodeURL;
        request.parameters = @{@"mobile" : phone};
    } onSuccess:^(id  _Nullable responseObject) {
        [weakSelf.fastLoginView.sendVerifyCodeView start60SecondCountDown];
    } successHint:@"验证码已发送" onFailure:NULL];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
