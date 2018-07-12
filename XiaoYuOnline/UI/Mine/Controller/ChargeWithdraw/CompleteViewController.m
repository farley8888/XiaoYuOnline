//
//  CompleteViewController.m
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/7.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "CompleteViewController+Custeffet.h"

@interface CompleteViewController () {
    UIImage *_image;
    NSString *_title;
    UIImageView *_imageView;
    UILabel *_descriptLabel;
    UIButton *_operateButton;
}
@end

@implementation CompleteViewController

- (instancetype)initWithImage:(UIImage *)image title:(NSString *)title {
    self = [super init];
    if (self) {
        _image = image;
        _title = title;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title =_title;
    
    _imageView = [[UIImageView alloc] initWithImage:_image];
    _imageView.contentMode = UIViewContentModeScaleAspectFit;
    _descriptLabel = [[UILabel alloc] init];
    _descriptLabel.textColor = XYGlobalUI.grayColor;
    _descriptLabel.font = XYGlobalUI.smallFont_12;
    _descriptLabel.textAlignment = NSTextAlignmentCenter;
    _operateButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_operateButton  setBackgroundImage:XYGlobalUI.yellowButtonBackgroundImage forState:UIControlStateNormal];
    [_operateButton setTitleColor:XYGlobalUI.whiteColor forState:UIControlStateNormal];
    [_operateButton setTitle:_buttonTitle forState:UIControlStateNormal];
    [_operateButton addTarget:self action:@selector(competeButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    UIView *topSpace = [[UIView alloc] init];
    topSpace.backgroundColor = XYGlobalUI.backgroundColor;
    
    UIView *superView = self.view;
    [superView addSubview:_imageView];
    [superView addSubview:_descriptLabel];
    [superView addSubview:_operateButton];
    [superView addSubview:topSpace];
    
    // Layout
    [topSpace mas_makeConstraints:^(MASConstraintMaker *make) {
        if (@available(iOS 11, *)) {
            make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop);
        } else {
            make.top.equalTo(self.mas_topLayoutGuideBottom);
        }
        make.leading.trailing.equalTo(superView);
        make.height.equalTo(@8.0);
    }];
    [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(topSpace.mas_bottom).offset(35.0);
        make.centerX.equalTo(topSpace);
        make.size.mas_equalTo(CGSizeMake(200.0, 150.0));
    }];
    [_descriptLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_imageView.mas_bottom).offset(10.0);
        make.leading.equalTo(superView).offset(20.0);
        make.trailing.equalTo(superView).offset(-20.0);
    }];
    [_operateButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_descriptLabel.mas_bottom).offset(8.0);
        make.centerX.equalTo(superView);
        make.size.mas_equalTo(CGSizeMake(260.0, 65.0));
    }];
    
    _descriptLabel.text = _descriptText;
}

- (void)competeButtonAction:(UIButton *)button {
    if (_success) {
        [self.navigationController popToRootViewControllerAnimated:YES];
    } else {
        [self.navigationController popViewControllerAnimated:YES];
    }
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
