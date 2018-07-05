//
//  XYHomeSecondViewCell.m
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/11.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "XYHomeSecondViewCell.h"
#import "UIColor+Helper.h"

@implementation XYHomeSecondViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGSize selfW = self.contentView.frame.size;
    CGFloat leftRightMargin = 28.0;
    CGFloat topBottomMargin = 18.0;
    CGFloat ratio = 625.0 / 920;
    CGFloat w = selfW.width - leftRightMargin * 2;
    CGFloat h = ceilf(w * ratio);
    
    self.imageView.frame = CGRectMake(leftRightMargin, topBottomMargin, w, h);
}

+ (CGFloat )cellHeight {
    CGFloat leftRightMargin = 28.0;
    CGFloat topBottomMargin = 18.0;
    CGFloat ratio = 625.0 / 920;
    CGFloat w = SCREEN_WIDTH - leftRightMargin * 2;
    
    return topBottomMargin * 2 + ceilf(w * ratio);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
