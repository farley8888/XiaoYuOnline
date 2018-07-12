//
//  XYDiscoveryViewCell.m
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/7.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "DiscoveryViewCell.h"

@implementation DiscoveryViewCell {
    UIView *_backView;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = XYGlobalUI.backgroundColor;
        _backView = [[UIView alloc] init];
        _backView.backgroundColor = XYGlobalUI.whiteColor;
        _backView.layer.cornerRadius = 10.0;
        _indicatorImageView = [[UIImageView alloc] init];
        _indicatorImageView.layer.shadowColor = XYGlobalUI.grayColor.CGColor;
        _indicatorImageView.layer.shadowOpacity = 1.0;
        _indicatorImageView.layer.shadowOffset = CGSizeMake(1, 1);
        
        _titleLabel = [[UILabel alloc] init];
        CGAffineTransform matrix =CGAffineTransformMake(1, 0, tanf(10 * (CGFloat)M_PI / 180), 1, 0, 0);
        UIFontDescriptor *desc = [ UIFontDescriptor fontDescriptorWithName :[UIFont systemFontOfSize:14].fontName matrix :matrix];
        _titleLabel.font = [UIFont fontWithDescriptor:desc size:14];
        _titleLabel.textColor = XYGlobalUI.yellowColor;
        
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.font = XYGlobalUI.smallFont_12;
        
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.font = XYGlobalUI.smallFont_12;
        _timeLabel.textColor = XYGlobalUI.mainColor;
        
        [self.contentView addSubview:_backView];
        UIView *superView = _backView;
        [superView addSubview:_indicatorImageView];
        [superView addSubview:_titleLabel];
        [superView addSubview:_contentLabel];
        [superView addSubview:_timeLabel];
        
        [_backView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(4.0, 22.0, 4.0, 22.0));
        }];
        [_indicatorImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(superView);
        }];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.top.equalTo(superView).offset(20.0);
            make.trailing.equalTo(superView).offset(-20.0);
        }];
        [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.trailing.equalTo(self->_titleLabel);
            make.top.equalTo(self->_titleLabel.mas_bottom).offset(22.0);
        }];
        [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(superView);
            make.right.equalTo(superView).offset(-20.0);
        }];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
