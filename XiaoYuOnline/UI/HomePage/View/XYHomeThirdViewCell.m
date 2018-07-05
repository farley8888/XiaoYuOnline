//
//  XYHomeThirdViewCell.m
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/11.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "XYHomeThirdViewCell.h"
#import "XYManageMoneyCell.h"

@implementation XYHomeThirdViewCell {
    UIView *_bottomLineViwe;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _addProfitImageView = [[UIImageView alloc] init];
        
        _profitImageView = [[UIImageView alloc] init];
        
        _voucherImageView = [[UIImageView alloc] init];
        
        _previousYearProfit = [[UILabel alloc] init];
        _previousYearProfit.font = XYGlobalUI.smallFont_12;
        _previousYearProfit.textAlignment = NSTextAlignmentCenter;
        _previousYearProfit.numberOfLines = 2;
        
        _planTimeLabel = [[UILabel alloc] init];
        _planTimeLabel.font = XYGlobalUI.smallFont_12;
        _planTimeLabel.textAlignment = NSTextAlignmentCenter;
        _planTimeLabel.numberOfLines = 2;
        
        _planTotalLabel = [[UILabel alloc] init];
        _planTotalLabel.font = XYGlobalUI.smallFont_12;
        _planTotalLabel.textAlignment = NSTextAlignmentCenter;
        _planTotalLabel.numberOfLines = 2;
        
        _investableLabel = [[UILabel alloc] init];
        _investableLabel.font = XYGlobalUI.smallFont_12;
        _investableLabel.textAlignment = NSTextAlignmentCenter;
        _investableLabel.numberOfLines = 2;
        
        _progressView = [[XYCustomProgressView alloc] init];
        _progressView.transform = CGAffineTransformMakeScale(1.0, 4.0);
        [_progressView setTrackImage:[[UIImage imageNamed:@"discovery_progress_gray_bg"] stretchableImageWithLeftCapWidth:2 topCapHeight:2]];
        [_progressView setProgressImage:[[UIImage imageNamed:@"discovery_progress_bg"] stretchableImageWithLeftCapWidth:2 topCapHeight:2]];
        
        _progressLabel = [[UILabel alloc] init];
        _progressLabel.font = XYGlobalUI.smallFont_12;
        _progressLabel.textColor = RGB_COLOR(102, 102, 102);
        
        _buyButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _buyButton.titleLabel.font = XYGlobalUI.smallFont_14;
        UIImage *img = [[UIImage imageNamed:@"main_btn_40diameter_bg"] stretchableImageWithLeftCapWidth:20 topCapHeight:20];
        [_buyButton setBackgroundImage:img forState:UIControlStateNormal];
        [_buyButton setTitle:NSLocalizedString(@"ManageMoney_BuyNow", nil) forState:UIControlStateNormal];
        [_buyButton setTitleColor:XYGlobalUI.whiteColor forState:UIControlStateNormal];
        [_buyButton addTarget:self action:@selector(buyButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        
        _leftVerticalView = [[UIView alloc] init];
        _leftVerticalView.backgroundColor = XYGlobalUI.yellowColor;
        _bottomLineViwe = [[UIView alloc] init];
        _bottomLineViwe.backgroundColor = XYGlobalUI.backgroundColor;
        _bottomLineViwe.layer.shadowOffset = CGSizeMake(0, -1);
        _bottomLineViwe.layer.shadowOpacity = 1.0;
        _bottomLineViwe.layer.shadowRadius = 0;
        _bottomLineViwe.layer.shadowColor = XYGlobalUI.lineColor.CGColor;
        
        UIView *superView = self.contentView;
        [superView addSubview:_addProfitImageView];
        [superView addSubview:_profitImageView];
        [superView addSubview:_voucherImageView];
        [superView addSubview:_previousYearProfit];
        [superView addSubview:_planTimeLabel];
        [superView addSubview:_planTotalLabel];
        [superView addSubview:_investableLabel];
        [superView addSubview:_progressView];
        [superView addSubview:_progressLabel];
        [superView addSubview:_buyButton];
        [superView addSubview:_leftVerticalView];
        [superView addSubview:_bottomLineViwe];
        
        [self addContrainToSubviews];
    }
    return self;
}

- (void)addContrainToSubviews {
    UIView *superView = self.contentView;
    
    [_leftVerticalView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(superView);
        make.width.equalTo(@4);
        make.bottom.equalTo(self->_bottomLineViwe.mas_top).offset(-1.0);
    }];
    [_addProfitImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(superView);
        make.left.equalTo(self->_leftVerticalView.mas_right).offset(15.0);
        make.size.mas_equalTo(CGSizeMake(62, 20));
    }];
    [_profitImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(superView);
        make.left.equalTo(self->_addProfitImageView.mas_right).offset(5.0);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
    [_voucherImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(superView);
        make.left.equalTo(self->_profitImageView.mas_right).offset(2.0);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
    
    [_previousYearProfit mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_leftVerticalView.mas_right);
        make.top.equalTo(self->_addProfitImageView.mas_bottom).offset(15.0);
    }];
    [_planTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_previousYearProfit.mas_right);
        make.top.equalTo(self->_addProfitImageView.mas_bottom).offset(15.0);
        make.width.equalTo(self->_previousYearProfit).offset(-15);
    }];
    [_planTotalLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_planTimeLabel.mas_right);
        make.top.equalTo(self->_addProfitImageView.mas_bottom).offset(15.0);
        make.width.equalTo(self->_planTimeLabel);
    }];
    [_investableLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_planTotalLabel.mas_right);
        make.top.equalTo(self->_addProfitImageView.mas_bottom).offset(15.0);
        make.width.equalTo(self->_planTotalLabel);
        make.right.equalTo(superView);
    }];
    [_progressView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_previousYearProfit.mas_bottom).offset(15.0);
        make.width.equalTo(@240);
        make.height.equalTo(@1);
        make.centerX.equalTo(superView);
    }];
    [_progressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self->_progressView.mas_right).offset(10);
        make.centerY.equalTo(self->_progressView);
    }];
    [_buyButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(205, 38));
        make.top.equalTo(self->_progressView.mas_bottom).offset(15.0);
        make.centerX.equalTo(superView);
    }];
    [_bottomLineViwe mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(superView);
        make.height.equalTo(@8);
    }];
}

- (void)buyButtonAction:(UIButton *)button {
    if ([self.delegate respondsToSelector:@selector(thirdCell:didPressedBuyButton:)]) {
        [self.delegate thirdCell:self didPressedBuyButton:button];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
