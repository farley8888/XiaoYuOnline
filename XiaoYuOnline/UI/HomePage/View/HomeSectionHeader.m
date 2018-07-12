//
//  XYHomeSectionHeader.m
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/11.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "HomeSectionHeader.h"

@implementation HomeSectionHeader {
    UIImageView *_accessoryImageView;
}

- (instancetype) initWithReuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        _titleImageView = [[UIImageView alloc] init];
        
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont boldSystemFontOfSize:17.0];
        
        _accessoryImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"accessory_right"]];
        _accessoryImageView.contentMode = UIViewContentModeScaleAspectFit;
        _accessoryImageView.hidden = YES;
        
        UIView *superView = self.contentView;
        [superView addSubview:_titleImageView];
        [superView addSubview:_titleLabel];
        [superView addSubview:_accessoryImageView];

        
        [_titleImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(18, 18));
            make.left.equalTo(superView).offset(18);
            make.centerY.equalTo(superView);
        }];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(superView);
            make.left.equalTo(self->_titleImageView.mas_right).offset(8.0);
            make.right.equalTo(superView).offset(-18.0);
        }];
        [_accessoryImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(9, 18));
            make.right.equalTo(superView).offset(-28);
            make.centerY.equalTo(superView);
        }];
    }
    return self;
}

@end
