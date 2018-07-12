//
//  SettingTableViewCell.m
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/5.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "SettingTableViewCell+Custeffet.h"

@implementation SettingTableViewCell {
    UIImageView *_accessoryImageView;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
        self.descriptionLabel.textColor = XYGlobalUI.grayColor;
        
        UIView *superView = self.contentView;
        _accessoryImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"accessory_right"]];
        [superView addSubview:_accessoryImageView];
        
        // Layout
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(superView).offset(21.0);
            make.centerY.equalTo(superView);
        }];
        [_accessoryImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(superView).offset(-21.0);
            make.centerY.equalTo(superView);
        }];
        [self.descriptionLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(superView);
            make.right.equalTo(self->_accessoryImageView.mas_left).offset(-10.0);
        }];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
