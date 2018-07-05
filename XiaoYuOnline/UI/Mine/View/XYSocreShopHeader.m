//
//  XYSocreShopHeader.m
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/7.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "XYSocreShopHeader.h"

@implementation XYSocreShopHeader

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        _titleImageView = [[UIImageView alloc] init];
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont boldSystemFontOfSize:17.0];
        _titleLabel.textColor = RGB_COLOR(212, 148, 10);
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        
        UIView *superView = self.contentView;
        [superView addSubview:_titleLabel];
        [superView addSubview:_titleImageView];
        
        [_titleImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(superView).offset(30.0);
            make.centerX.equalTo(superView);
            make.size.mas_equalTo(CGSizeMake(42.0, 42.0));
        }];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(superView).offset(20.0);
            make.right.equalTo(superView).offset(-20.0);
            make.top.equalTo(self.titleImageView.mas_bottom).offset(10.0);
        }];
    }
    return self;
}

@end


@implementation XYCouponConvertHeader

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        UIView *contentView = [[UIView alloc] init];
        contentView.backgroundColor = XYGlobalUI.whiteColor;
        _descriptionLabel = [[UILabel alloc] init];
        _descriptionLabel.font = XYGlobalUI.smallFont_14;
        [contentView addSubview:_descriptionLabel];
        [self.contentView addSubview:contentView];
        
        UIView *superView = self.contentView;
        [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.bottom.trailing.equalTo(superView);
            make.height.equalTo(@30.0);
        }];
        [_descriptionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.equalTo(contentView);
            make.left.equalTo(contentView).offset(22.0);
            make.right.equalTo(contentView).offset(-22.0);
        }];
    }
    return self;
}

@end
