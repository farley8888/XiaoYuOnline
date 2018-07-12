//
//  ScoreShopTableViewCell.m
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/7.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "ScoreShopTableViewCell.h"

@implementation ScoreShopTableViewCell {
    UIView *_lineView;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UIView *superView = self.contentView;
        _titleImageView = [[UIImageView alloc] init];
        _titleImageView.contentMode = UIViewContentModeScaleAspectFit;
        _titleLable = [[UILabel alloc] init];
        _titleLable.font = XYGlobalUI.smallFont_14;
        
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.font = XYGlobalUI.smallFont_12;
        _contentLabel.textColor = XYGlobalUI.redColor;
        
        _rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _rightButton.titleLabel.font = XYGlobalUI.smallFont_12;
        [_rightButton setBackgroundImage:[XYGlobalUI stretchCorner5ImageWithName:@"button_corner5_yellow_bg" ] forState:UIControlStateNormal];
        [_rightButton setBackgroundImage:[XYGlobalUI stretchCorner5ImageWithName:@"button_corner5_gray_bg" ] forState:UIControlStateDisabled];
        [_rightButton setTitleColor:XYGlobalUI.yellowColor forState:UIControlStateNormal];
        [_rightButton setTitleColor:XYGlobalUI.grayColor forState:UIControlStateDisabled];
        [_rightButton setTitle:@"立即兑换" forState:UIControlStateNormal];
        [_rightButton setTitle:@"积分不足" forState:UIControlStateDisabled];
        
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = XYGlobalUI.lineColor;
        
        [superView addSubview:_titleImageView];
        [superView addSubview:_titleLable];
        [superView addSubview:_contentLabel];
        [superView addSubview:_rightButton];
        [superView addSubview:_lineView];
        
        [_titleImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(96.0, 60.0));
            make.leading.equalTo(superView).offset(26.0);
            make.centerY.equalTo(superView);
        }];
        [_titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(self.titleImageView.mas_trailing).offset(10.0);
            make.top.equalTo(superView).offset(30.0);
            make.trailing.equalTo(self.rightButton.mas_leading).offset(-10.0);
        }];
        [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.trailing.equalTo(self.titleLable);
            make.top.equalTo(self.titleLable.mas_bottom).offset(6.0);
        }];
        [_rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(66.0, 24.0));
            make.trailing.equalTo(superView).offset(-24.0);
            make.centerY.equalTo(superView);
        }];
        [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.trailing.bottom.equalTo(superView);
            make.height.equalTo(@(XYGlobalUI.singleLineWidth));
        }];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

@implementation XYCouponConvertViewCell

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentLabel.textColor = XYGlobalUI.grayColor;
        self.contentLabel.font = XYGlobalUI.smallFont_9;
        self.titleImageView.contentMode = UIViewContentModeScaleToFill;
        
        UIView *superView = self.contentView;
        _valueLabel = [[UILabel alloc] init];
        _valueLabel.textColor = XYGlobalUI.whiteColor;
        _valueLabel.font = [UIFont systemFontOfSize:28.0];
        _valueLabel.textAlignment = NSTextAlignmentCenter;
        
        _descriptionLabel = [[UILabel alloc] init];
        _descriptionLabel.font = XYGlobalUI.smallFont_12;
        _descriptionLabel.textColor = XYGlobalUI.redColor;
        [superView addSubview:_descriptionLabel];
        [superView addSubview:_valueLabel];
        
        [self.titleLable mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(superView).offset(14.0);
        }];
        [_descriptionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.trailing.equalTo(self.titleLable);
            make.top.equalTo(self.contentLabel.mas_bottom).offset(6.0);
        }];
        [_valueLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(96.0, 60.0));
            make.leading.equalTo(superView).offset(26.0);
            make.centerY.equalTo(superView);
        }];
    }
    return self;
}

@end
