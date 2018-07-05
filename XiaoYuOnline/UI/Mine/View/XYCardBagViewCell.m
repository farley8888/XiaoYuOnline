//
//  XYCardBagViewCell.m
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/6.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "XYCardBagViewCell.h"

@implementation XYCardBagViewCell {
    UIView *_backView;
    UIImageView *_dottedLine;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.contentView.backgroundColor = XYGlobalUI.whiteColor;
        _backView = [[UIView alloc] init];
        _backView.backgroundColor = XYGlobalUI.whiteColor;
        [self.contentView addSubview:_backView];
        UIView *superView = _backView;
        
        _canUseImageView = [[UIImageView alloc] init];
        
        _valueLabel = [[UILabel alloc] init];
        _valueLabel.font = [UIFont systemFontOfSize:20.0];
        _valueLabel.textColor = XYGlobalUI.whiteColor;
        
        _usageConditionLabel = [[UILabel alloc] init];
        _usageConditionLabel.font = XYGlobalUI.smallFont_14;
        _usageConditionLabel.textColor = XYGlobalUI.whiteColor;
        _usageConditionLabel.textAlignment = NSTextAlignmentRight;
        
        _validDateLabel = [[UILabel alloc] init];
        _validDateLabel.font = [UIFont systemFontOfSize:9.0];
        _validDateLabel.textColor = XYGlobalUI.whiteColor;
        _validDateLabel.textAlignment = NSTextAlignmentRight;
        
        _usageSateLabel = [[UILabel alloc] init];
        _usageSateLabel.font = XYGlobalUI.smallFont_14;
        _usageSateLabel.textAlignment = NSTextAlignmentCenter;
        
        _backgroundImageView = [[UIImageView alloc] init];
        _usableTagView = [[UIImageView alloc] init];
        _usableTagView.image = [[UIImage imageNamed:@"mine_wb_shop_right"] stretchableImageWithLeftCapWidth:5 topCapHeight:5];
        
        _dottedLine = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"mine_wb_dash_line"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 4, 0, 4)]];
        
        [superView addSubview:_backgroundImageView];
        [superView addSubview:_usableTagView];
        [superView addSubview:_canUseImageView];
        [superView addSubview:_valueLabel];
        [superView addSubview:_usageConditionLabel];
        [superView addSubview:_validDateLabel];
        [superView addSubview:_usageSateLabel];
        [superView addSubview:_dottedLine];
        
        [_backView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(14.0, 7.0, 0, 7.0));
        }];
        [_usageSateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.right.bottom.right.equalTo(superView);
            make.width.equalTo(@77.0);
        }];
        [_usableTagView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.right.bottom.right.equalTo(superView);
            make.width.equalTo(@77.0);
        }];
        [_canUseImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.equalTo(superView);
            make.size.mas_equalTo(CGSizeMake(40, 40));
        }];
        [_backgroundImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.bottom.equalTo(superView);
            make.right.equalTo(self.usageSateLabel.mas_left).offset(-1.0);
        }];
        [_dottedLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(superView).offset(24);
            make.right.equalTo(self.usageSateLabel.mas_left).offset(-18.0);
            make.height.equalTo(@1.0);
            make.centerY.equalTo(superView).offset(12.0);
        }];
        [_valueLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(superView).offset(24.0);
            make.top.equalTo(superView).offset(33.0);
        }];
        [_usageConditionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.baseline.equalTo(self.valueLabel);
            make.right.equalTo(self.usageSateLabel.mas_left).offset(-18.0);
        }];
        [_validDateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(superView).offset(-22.0);
            make.right.equalTo(self.usageConditionLabel);
        }];
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
