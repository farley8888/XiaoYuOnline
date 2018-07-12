//
//  XYAboutUsTableViewCell.m
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/5.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "AboutUsTableViewCell.h"

@implementation AboutUsTableViewCell {
    UIView *_bottomLineView;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:14.0];
        [self.contentView addSubview:_titleLabel];
        
        _descriptionLabel = [[UILabel alloc] init];
        _descriptionLabel.font = [UIFont systemFontOfSize:14.0];
        _descriptionLabel.numberOfLines = 0;
        _descriptionLabel.textAlignment = NSTextAlignmentRight;
        [self.contentView addSubview:_descriptionLabel];
        
        _bottomLineView = [[UIView alloc] init];
        _bottomLineView.backgroundColor = XYGlobalUI.lineColor;
        [self.contentView addSubview:_bottomLineView];
        
        // Layout
        UIView *superView = self.contentView;
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(superView).offset(21.0);
            make.centerY.equalTo(superView);
        }];
        [_descriptionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(superView).offset(-21.0);
            make.centerY.equalTo(superView);
        }];
        [_bottomLineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.bottom.right.equalTo(superView);
            make.height.mas_equalTo(XYGlobalUI.singleLineWidth);
        }];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
