//
//  XYBillTableViewCell.m
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/4.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "XYBillTableViewCell.h"
@interface XYBillTableViewCell()
@property (weak, nonatomic) IBOutlet UIView *bottomLineView;

@end

@implementation XYBillTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    _bottomLineView.backgroundColor = XYGlobalUI.lineColor;
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
