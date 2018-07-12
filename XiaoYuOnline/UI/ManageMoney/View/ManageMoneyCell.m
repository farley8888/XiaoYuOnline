//
//  ManageMoneyCell.m
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/10.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "ManageMoneyCell.h"
#import "UIView+Common.h"

@implementation ManageMoneyCell {
    UIView *_bottomLineView;
    UIView *_vLine1;
    UIView *_vLine2;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = XYGlobalUI.smallFont_14;
        _titleLabel.textColor = XYGlobalUI.lightBlcakColor;
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        
        _freshImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"manage_money_newHander"]];
        _freshImageView.contentMode = UIViewContentModeScaleAspectFit;
        
        _deadlineLabel = [[UILabel alloc] init];
        _deadlineLabel.font = XYGlobalUI.smallFont_12;
        _deadlineLabel.textColor = XYGlobalUI.blackColor;
        _deadlineLabel.textAlignment = NSTextAlignmentCenter;
        _deadlineLabel.numberOfLines = 2;
        
        _profitLabel = [[UILabel alloc] init];
        _profitLabel.font = XYGlobalUI.smallFont_12;
        _profitLabel.textColor = XYGlobalUI.blackColor;
        _profitLabel.textAlignment = NSTextAlignmentCenter;
        _profitLabel.numberOfLines = 2;
        
        _surplusLabel = [[UILabel alloc] init];
        _surplusLabel.font = XYGlobalUI.smallFont_12;
        _surplusLabel.textColor = XYGlobalUI.blackColor;
        _surplusLabel.textAlignment = NSTextAlignmentCenter;
        _surplusLabel.numberOfLines = 2;
        
        _progressLabel = [[UILabel alloc] init];
        _progressLabel.font = XYGlobalUI.smallFont_12;
        _progressLabel.textColor = XYGlobalUI.blackColor;
        
        _progressView = [[CustomProgressView alloc] init];
        _progressView.transform = CGAffineTransformMakeScale(1.0, 4.0);
        [_progressView setTrackImage:[[UIImage imageNamed:@"discovery_progress_gray_bg"] stretchableImageWithLeftCapWidth:2 topCapHeight:2]];
        [_progressView setProgressImage:[[UIImage imageNamed:@"discovery_progress_bg"] stretchableImageWithLeftCapWidth:2 topCapHeight:2]];
        
        _actionButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _actionButton.titleLabel.font = XYGlobalUI.smallFont_14;
        UIImage *img = [[UIImage imageNamed:@"main_btn_32diameter_bg"] stretchableImageWithLeftCapWidth:16 topCapHeight:16];
        [_actionButton setBackgroundImage:img forState:UIControlStateNormal];
        [_actionButton setTitle:NSLocalizedString(@"ManageMoney_BuyNow", nil) forState:UIControlStateNormal];
        [_actionButton setTitleColor:XYGlobalUI.whiteColor forState:UIControlStateNormal];
        [_actionButton addTarget:self action:@selector(buyButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        
        _bottomLineView = [[UIView alloc] init];
        _bottomLineView.backgroundColor = XYGlobalUI.backgroundColor;
        
        _vLine1 = [[UIView alloc] init];
        _vLine2 = [[UIView alloc] init];
        _vLine1.backgroundColor = XYGlobalUI.lightGrayColor;
        _vLine2.backgroundColor = XYGlobalUI.lightGrayColor;
        
        UIView *superView = self.contentView;
        [superView addSubview:_titleLabel];
        [superView addSubview:_freshImageView];
        [superView addSubview:_deadlineLabel];
        [superView addSubview:_profitLabel];
        [superView addSubview:_surplusLabel];
        [superView addSubview:_progressLabel];
        [superView addSubview:_progressView];
        [superView addSubview:_actionButton];
        [superView addSubview:_bottomLineView];
        [superView addSubview:_vLine1];
        [superView addSubview:_vLine2];
        
        [self addConstrainsToSubviews];
    }
    return self;
}

- (void)addConstrainsToSubviews {
    UIView *superView = self.contentView;
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(superView).offset(14.0);
        make.centerX.equalTo(superView);
//        make.left.equalTo(superView).offset(20.0);
//        make.right.equalTo(superView).offset(-20.0);
    }];
    [_freshImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLabel.mas_right).offset(5);
        make.top.equalTo(superView);
        make.size.mas_equalTo(CGSizeMake(25, 35));
    }];
    [_progressView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(200, 1));
        make.top.equalTo(self->_titleLabel.mas_bottom).offset(20.0);
        make.centerX.equalTo(superView);
    }];
    [_progressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self->_progressView);
        make.left.equalTo(self->_progressView.mas_right).offset(10.0);
        make.right.equalTo(superView).offset(-12.0);
    }];
    [@[_deadlineLabel, _profitLabel, _surplusLabel] mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_titleLabel.mas_bottom).offset(38.0);
    }];
    [_deadlineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(superView);
    }];
    [_vLine1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_deadlineLabel.mas_right);
        make.height.equalTo(self->_deadlineLabel).offset(-4.0);
        make.width.equalTo(@1);
        make.centerY.equalTo(self->_deadlineLabel);
    }];
    [_profitLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_deadlineLabel.mas_right).offset(1.0);
        make.width.equalTo(self->_deadlineLabel);
    }];
    [_vLine2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_profitLabel.mas_right);
        make.height.equalTo(self->_profitLabel).offset(-4.0);
        make.width.equalTo(@1);
        make.centerY.equalTo(self->_profitLabel);
    }];
    [_surplusLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_profitLabel.mas_right).offset(1.0);
        make.width.equalTo(self->_profitLabel);
        make.right.equalTo(superView);
    }];
    [_actionButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_profitLabel.mas_bottom).offset(8.0);
        make.size.mas_equalTo(CGSizeMake(126.0, 32.0));
        make.centerX.equalTo(superView);
    }];
    [_bottomLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(superView);
        make.height.equalTo(@8.0);
    }];
}

- (void)removeBottomLineView {
    [_bottomLineView removeFromSuperview];
}

- (void)buyButtonAction:(UIButton *)button {
    if ([self.delegate respondsToSelector:@selector(manageMoneyCell:didPressedBuyButton:)]) {
        [self.delegate manageMoneyCell:self didPressedBuyButton:button];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

@implementation CustomProgressView

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    if (XYSYSTEM_VERSION_LESS_THAN(@"9.0")) {
        if (self.subviews.count == 2) {
            UIImageView *imgV1 = self.subviews[0];
            if ([imgV1 isKindOfClass:[UIImageView class]]) {
                imgV1.image = self.trackImage;
            }
            UIImageView *imgV2 = self.subviews[1];
            if ([imgV2 isKindOfClass:[UIImageView class]]) {
                imgV2.image = self.progressImage;
            }
        }
    }
}
@end
