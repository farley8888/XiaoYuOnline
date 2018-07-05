//
//  XYBidSecondViewCell.m
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/10.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "XYBidSecondViewCell.h"
#import "UIView+Common.h"

@implementation XYBidSecondViewCell {
    UIView *_lineView;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = XYGlobalUI.lightGrayColor;
        [self.contentView addSubview:_lineView];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.textLabel.frame = CGRectMake(20, 5, self.contentView.width - 40.0, self.contentView.height - 10.0);
    _lineView.frame = CGRectMake(0, self.contentView.height - XYGlobalUI.singleLineWidth, self.contentView.width, XYGlobalUI.singleLineWidth);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
