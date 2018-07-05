//
//  XYRegisterViewCell.m
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/14.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "XYRegisterViewCell.h"

@implementation XYRegisterViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.descriptionLabel removeFromSuperview];
        self.descriptionLabel = nil;
        
        _rightImageView = [[UIImageView alloc] init];
        _rightImageView.backgroundColor = XYGlobalUI.backgroundColor;
        [self.contentView addSubview:_rightImageView];
        
        [_rightImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(70, 40));
            make.centerY.equalTo(self.contentView);
            make.right.equalTo(self.contentView).offset(-22.0);
        }];
        [self.textField mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.titleLabel.mas_right).offset(5.0);
            make.right.equalTo(self.rightImageView.mas_left).offset(-5.0);
            make.centerY.equalTo(self.contentView);
        }];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
