//
//  XYWellBeingViewCell.m
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/6.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "XYWellBeingViewCell.h"

@implementation XYWellBeingViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = XYGlobalUI.backgroundColor;
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:14.0];
        [self.contentView addSubview:_titleLabel];
        
        _contentImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:_contentImageView];
        
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@21.0);
            make.right.equalTo(@(-21.0));
            make.top.equalTo(self.contentView);
            make.height.equalTo(@27.0);
        }];
        [_contentImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.contentView);
            make.top.equalTo(self.titleLabel.mas_bottom);
            make.height.equalTo(self.contentImageView.mas_width).multipliedBy(41.0/90);
        }];
    }
    return self;
}

+ (CGFloat)rowHeight {
    return 27.0 + SCREEN_WIDTH * (41.0/90);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
