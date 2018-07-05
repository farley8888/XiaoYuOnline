//
//  XYRealNameTableViewCell.m
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/5.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "XYRealNameTableViewCell.h"

@implementation XYRealNameTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.descriptionLabel.hidden = YES;
        
        UIView *superView = self.contentView;
        _textField = [[UITextField alloc] init];
        _textField.font = XYGlobalUI.smallFont_14;
        [superView addSubview:_textField];
        
        _rightView = [[XYSendVerifyCodeView alloc] init];
        [_rightView.sendButton setTitleColor:XYGlobalUI.mainColor forState:UIControlStateNormal];
        _rightView.hidden = YES;
        [superView addSubview:_rightView];
        
        // Layout
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@75.0);
        }];
        [_rightView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(superView).offset(-21.0);
            make.centerY.equalTo(superView);
        }];
        [_textField setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
        [self.descriptionLabel setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
        [_rightView.sendButton setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
        [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.titleLabel.mas_right).offset(5.0);
            make.right.equalTo(self.descriptionLabel.mas_left).offset(-5.0);
            make.top.equalTo(superView).offset(2.0);
            make.bottom.equalTo(superView).offset(-2.0);
        }];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
