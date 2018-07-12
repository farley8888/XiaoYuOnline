//
//  QATableViewCell.m
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/4.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "QATableViewCell.h"

@implementation QATableViewCell {
    UIView *_backView;
    UIImageView *_accessoryView;
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
        _backView.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:_backView];
        
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:14.0];
        [_backView addSubview:_titleLabel];
        
        _accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"accessory_right"]];
        [_backView addSubview:_accessoryView];
        
        // Layout
        UIView *superView = _backView;
        [_backView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(7.0, 0, 0, 0));
        }];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(superView).offset(21.0);
            make.centerY.equalTo(superView);
        }];
        [_accessoryView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(superView).offset(-13.0);
            make.centerY.equalTo(superView);
        }];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
