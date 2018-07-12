//
//  LoanViewCell.m
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/12.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "LoanViewCell.h"

@implementation LoanViewCell {
    UIView *_lineView;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        _necessaryImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"home_loan_Star_bg"]];
        
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = XYGlobalUI.smallFont_14;
        
        _textField = [[UITextField alloc] init];
        _textField.font = XYGlobalUI.smallFont_14;
        _textField.delegate = self;
        [_textField addTarget:self action:@selector(textFieldValueChanged:) forControlEvents:UIControlEventEditingChanged];
        
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = XYGlobalUI.lineColor;
        
        UIView *superView = self.contentView;
        [superView addSubview:_necessaryImageView];
        [superView addSubview:_titleLabel];
        [superView addSubview:_textField];
        [superView addSubview:_lineView];
        
        [_necessaryImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(10, 10));
            make.left.equalTo(superView).offset(20.0);
            make.centerY.equalTo(superView);
        }];
        
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self->_necessaryImageView.mas_right).offset(5.0);
            make.top.equalTo(superView).offset(5.0);
            make.bottom.equalTo(superView).offset(-5.0);
            make.width.equalTo(@65);
        }];
        [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self->_titleLabel.mas_right).offset(5);
            make.top.equalTo(superView).offset(2.0);
            make.bottom.equalTo(superView).offset(-2.0);
            make.right.equalTo(superView).offset(-20.0);
        }];
        [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.bottom.right.equalTo(superView);
            make.height.equalTo(@(XYGlobalUI.singleLineWidth));
        }];
        
    }
    return self;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    if ([self.delegate respondsToSelector:@selector(loanViewCell:textFieldShouldBeginEditing:)]) {
        return [self.delegate loanViewCell:self textFieldShouldBeginEditing:textField];
    }
    
    return NO;
}

- (void)textFieldValueChanged:(UITextField *)textField {
    if ([self.delegate respondsToSelector:@selector(loanViewCell:textFieldEditingChanged:)]) {
        [self.delegate loanViewCell:self textFieldEditingChanged:textField];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
