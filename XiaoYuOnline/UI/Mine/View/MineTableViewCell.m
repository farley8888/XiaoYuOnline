//
//  XYMineTableViewCell.m
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/8.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "MineTableViewCell+Custeffet.h"
#import "UIView+Common.h"

@implementation MineTableViewCell {
    UIImageView *_accessoryImageView;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    if (self) {
        self.textLabel.font = XYGlobalUI.smallFont_14;
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        
        _accessoryImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"accessory_right"]];
        _accessoryImageView.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:_accessoryImageView];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGSize size = self.contentView.frame.size;
    _accessoryImageView.frame = CGRectMake(0, 0, 8.0, 14.0);
    _accessoryImageView.center = CGPointMake(size.width - 20.0 - _accessoryImageView.width / 2.0, size.height / 2.0);
    self.imageView.frame = CGRectMake(20.0, (size.height - 30.0) / 2.0, 30.0, 30.0);
    CGFloat x = self.imageView.right + 10;
    self.textLabel.frame = CGRectMake(x + 10, self.imageView.y, _accessoryImageView.x - x - 10.0 , self.imageView.height);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
