//
//  XYPlanBidViewController.m
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/5/13.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "XYPlanBidViewController.h"
#import "UIViewController+ShowTextHUD.h"
#import "CustomTextEdgeField.h"

/**
 此页面本来应该用 H5 做
 */
@interface XYPlanBidViewController ()
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) CustomTextEdgeField *nameTF;
@property (nonatomic, strong) CustomTextEdgeField *phoneTF;
@property (nonatomic, strong) UIButton *planButton;
@property (nonatomic, assign) CGFloat imageHeight;
@end

@implementation XYPlanBidViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = NSLocalizedString(@"HomePage_Bid", nil);
    
    UIScrollView *scrollContent = [[UIScrollView alloc] init];
    scrollContent.backgroundColor = XYGlobalUI.backgroundColor;
    scrollContent.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    [self.view addSubview:scrollContent];
    UIImage *img = [UIImage imageNamed:@"home_plan_bid_bg.jpg"];
    _imageHeight = SCREEN_WIDTH * (img.size.height / img.size.width);
    _imageView = [[UIImageView alloc] initWithImage:img];
    _imageView.userInteractionEnabled = YES;
    [scrollContent addSubview:_imageView];
    
    [scrollContent mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.right.equalTo(self.view);
    }];
    
    [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(scrollContent);
        make.left.right.bottom.equalTo(scrollContent);
        make.width.equalTo(scrollContent);
        make.height.equalTo(@(self.imageHeight));
    }];
    
    [self loadSubViews];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboardAction)];
    [_imageView addGestureRecognizer:tap];
}

- (void)loadSubViews {
    CGFloat tfNameY = (420.0 / 2012 )* _imageHeight;
    CGFloat tfNameW = (358.0 / 750) * SCREEN_WIDTH;
    CGFloat tfNameH = (64.0 / 2012) * _imageHeight;
    CGFloat gap1 = (15.0 / 2012) * _imageHeight;
    CGFloat gap2 = (76.0 / 2012) * _imageHeight;
    CGFloat btnH = (74.0 / 2012) * _imageHeight;

    UIEdgeInsets inset = UIEdgeInsetsMake(2, 5, 0, 5);
    _nameTF = [[CustomTextEdgeField alloc] init];
    _nameTF.textColor = XYGlobalUI.whiteColor;
    _nameTF.font = XYGlobalUI.smallFont_14;
    _nameTF.textEdge = inset;
    
    _phoneTF = [[CustomTextEdgeField alloc] init];
    _phoneTF.textColor = XYGlobalUI.whiteColor;
    _phoneTF.font = XYGlobalUI.smallFont_14;
    _phoneTF.textEdge = inset;
    
    _planButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_planButton addTarget:self action:@selector(planButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    UIView *superView = _imageView;
    [superView addSubview:_nameTF];
    [superView addSubview:_phoneTF];
    [superView addSubview:_planButton];
    
    [_nameTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(tfNameW, tfNameH));
        make.top.equalTo(superView).offset(tfNameY);
        make.centerX.equalTo(superView);
    }];
    [_phoneTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(tfNameW, tfNameH));
        make.top.equalTo(self.nameTF.mas_bottom).offset(gap1);
        make.centerX.equalTo(superView);
    }];
    [_planButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(superView);
        make.size.mas_equalTo(CGSizeMake(tfNameW, btnH));
        make.top.equalTo(self.phoneTF.mas_bottom).offset(gap2);
    }];
}

- (void)planButtonAction:(UIButton *)button {
    NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    if ([_nameTF.text stringByTrimmingCharactersInSet:set].length > 0 &&
        [_phoneTF.text stringByTrimmingCharactersInSet:set].length > 0) {
        // 立即预约
        __weak typeof(self) weakSelf = self;
        [self sendRequest:^(XMRequest * _Nonnull request) {
            request.api  = HomePage_PlanBid_URL;
            request.parameters = @{@"userName" : weakSelf.nameTF.text,
                                   @"userPhone" : weakSelf.phoneTF.text
                                   };
        } onSuccess:^(id  _Nullable responseObject) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [weakSelf.navigationController popViewControllerAnimated:YES];
            });
        } successHint:@"约标成功" onFailure:NULL];
    } else {
        [self showHUDText:@"请填写完成信息"];
    }
}

- (void)dismissKeyboardAction {
    [self.view endEditing:YES];
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

