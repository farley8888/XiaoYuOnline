//
//  LoanDescriptionCell.m
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/12.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "LoanDescriptionCell.h"

@implementation LoanDescriptionCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.textField removeFromSuperview];
        self.textField = nil;
        
        _accessoryButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _accessoryButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        [_accessoryButton setImage:[UIImage imageNamed:@"home_loan_accressory_down"] forState:UIControlStateNormal];
        
        UIImage *img = [[UIImage imageNamed:@"home_loan_des_bg"] resizableImageWithCapInsets:UIEdgeInsetsMake(10, 20, 5, 5) resizingMode:UIImageResizingModeStretch];
        _bakcgroundImageView = [[UIImageView alloc] init];
        _bakcgroundImageView.userInteractionEnabled = YES;
        _bakcgroundImageView.image = img;
        _descriptLabel = [[UILabel alloc] init];
        _descriptLabel.font = XYGlobalUI.smallFont_9;
        
        _textView = [[UITextView alloc] init];
        _textView.backgroundColor = XYGlobalUI.backgroundColor;
        _textView.delegate = self;
        
        UIView *superView = self.contentView;
        [superView addSubview:_accessoryButton];
        [superView addSubview:_bakcgroundImageView];
        [superView addSubview:_descriptLabel];
        [superView addSubview:_textView];
        
        [self.titleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(superView).offset(35);
            make.top.equalTo(superView).offset(18);
            make.height.equalTo(@16.0);
            make.right.equalTo(self->_accessoryButton.mas_left).offset(- 10);
        }];
        [self.necessaryImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(superView).offset(20);
            make.size.mas_equalTo(CGSizeMake(10, 10));
            make.centerY.equalTo(self.titleLabel);
        }];
        
        [_bakcgroundImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.titleLabel.mas_bottom).offset(10.0);
            make.left.equalTo(superView).offset(20.0);
            make.right.equalTo(superView).offset(-20.0);
            make.bottom.equalTo(superView).offset(-30.0);
        }];
        [_textView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.titleLabel.mas_bottom).offset(18.0);
            make.left.equalTo(superView).offset(30.0);
            make.right.equalTo(superView).offset(-30.0);
            make.bottom.equalTo(superView).offset(-38.0);
        }];
        [_descriptLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(superView).offset(20.0);
            make.right.equalTo(superView).offset(-20.0);
            make.top.equalTo(self->_bakcgroundImageView.mas_bottom).offset(10.0);
        }];
        [_accessoryButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(40, 40));
            make.top.equalTo(superView).offset(5);
            make.right.equalTo(superView).offset(-20);
        }];
    }
    return self;
}

- (void)textViewDidEndEditing:(UITextView *)textView {
    if ([self.delegate respondsToSelector:@selector(loanViewCell:textViewDidEndEditing:)]) {
        [self.delegate loanViewCell:self textViewDidEndEditing:textView];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
