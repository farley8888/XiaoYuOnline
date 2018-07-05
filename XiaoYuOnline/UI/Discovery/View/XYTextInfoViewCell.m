//
//  XYTextInfoViewCell.m
//  XiaoYuOnline
//
//  Created by ChenWei on 2018/5/10.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "XYTextInfoViewCell.h"

@implementation XYTextInfoViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.textLabel.numberOfLines = 0;
        
        _contentEdge = UIEdgeInsetsMake(0, 15, 0, 15);
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGSize size = self.bounds.size;
    self.textLabel.frame = CGRectMake(_contentEdge.left, _contentEdge.top, size.width - _contentEdge.left - _contentEdge.right, size.height - _contentEdge.top - _contentEdge.bottom);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
