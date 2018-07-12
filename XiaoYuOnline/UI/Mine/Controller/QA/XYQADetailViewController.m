//
//  QADetailViewController.m
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/4.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "QADetailViewController.h"
#import "XYQAModel.h"

@interface QADetailViewController ()

@property (nonatomic, strong) UILabel *detailQALabel;
@property (nonatomic, strong) XYQAModel *QAModel;
@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation QADetailViewController

- (instancetype)initWithQAModel:(XYQAModel *)model {
    self = [super init];
    if (self) {
        _QAModel = model;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = XYGlobalUI.backgroundColor;
    self.title = _QAModel.title;
    
    UIScrollView *scrollContent = [[UIScrollView alloc] init];
    scrollContent.backgroundColor = XYGlobalUI.backgroundColor;
    [self.view addSubview:scrollContent];
    UIView *contentView = [[UIView alloc] init];
    contentView.backgroundColor = [UIColor whiteColor];
    [scrollContent addSubview:contentView];
    
    _detailQALabel = [[UILabel alloc] init];
    _detailQALabel.numberOfLines = 0;
    _detailQALabel.font = [UIFont systemFontOfSize:11.0];
    _detailQALabel.text = _QAModel.content;
    [contentView addSubview:_detailQALabel];
    
    // Layout
    [scrollContent mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.right.equalTo(self.view);
    }];
    
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(scrollContent).offset(7.0);
        make.left.right.bottom.equalTo(scrollContent);
        make.width.equalTo(scrollContent);
    }];
    
    if (_QAModel.image) {
        _imageView = [[UIImageView alloc] init];
        _imageView.contentMode = _QAModel.imageContentModel;
        _imageView.image = _QAModel.image;
        [contentView addSubview:_imageView];
        
        [_detailQALabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(contentView).offset(14.0);
            make.left.equalTo(contentView).offset(30.0);
            make.right.equalTo(contentView).offset(-30.0);
        }];
        [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self->_detailQALabel.mas_bottom).offset(30.0);
            make.left.right.equalTo(self->_detailQALabel);
            make.bottom.equalTo(contentView).offset(-30.0);
        }];
        
    } else {
        [_detailQALabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(contentView).offset(14.0);
            make.left.equalTo(contentView).offset(30.0);
            make.right.bottom.equalTo(contentView).offset(-30.0);
        }];
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
