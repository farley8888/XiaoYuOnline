//
//  XYBidFirstViewCell.m
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/10.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "XYBidFirstViewCell.h"

@implementation XYBidFirstViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.titleLabel.textAlignment = NSTextAlignmentLeft;
        self.titleLabel.font = [UIFont systemFontOfSize:17.0];
        self.titleLabel.textColor = XYGlobalUI.blackColor;
        self.progressLabel.textAlignment = NSTextAlignmentRight;
        self.actionButton.titleLabel.font = XYGlobalUI.mainFont;
        [self.actionButton setTitle:NSLocalizedString(@"ManageMoney_Invest", nil) forState:UIControlStateNormal];
        [self removeBottomLineView];
        
        _addInterestLabel = [[UILabel alloc] init];
        _addInterestLabel.font = XYGlobalUI.smallFont_12;
        _addInterestLabel.textColor = XYGlobalUI.whiteColor;
        _addInterestLabel.textAlignment = NSTextAlignmentCenter;
        _addInterestLabel.backgroundColor = XYGlobalUI.redColor;
        _addInterestLabel.layer.cornerRadius = 5;
        _addInterestLabel.clipsToBounds = YES;
        
        _cashVoucherLabel = [[UILabel alloc] init];
        _cashVoucherLabel.font = XYGlobalUI.smallFont_12;
        _cashVoucherLabel.textColor = XYGlobalUI.whiteColor;
        _cashVoucherLabel.textAlignment = NSTextAlignmentCenter;
        _cashVoucherLabel.backgroundColor = _addInterestLabel.backgroundColor;
        _cashVoucherLabel.layer.cornerRadius = 5;
        _cashVoucherLabel.clipsToBounds = YES;
        
        _surplusRaiseLabel = [[UILabel alloc] init];
        _surplusRaiseLabel.font = XYGlobalUI.smallFont_9;
        _surplusRaiseLabel.textColor = XYGlobalUI.grayColor;
        
        [self.contentView addSubview:_addInterestLabel];
        [self.contentView addSubview:_cashVoucherLabel];
        [self.contentView addSubview:_surplusRaiseLabel];
        
        [_addInterestLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(50, 18));
            make.top.equalTo(self.titleLabel.mas_bottom).offset(13.0);
            make.left.equalTo(self.contentView).offset(20.0);
        }];
        [_cashVoucherLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(50, 18));
            make.left.equalTo(self.addInterestLabel.mas_right).offset(12.0);
            make.centerY.equalTo(self.addInterestLabel);
        }];
        [_surplusRaiseLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(20.0);
            make.right.equalTo(self.contentView).offset(-20.0);
            make.top.equalTo(self.progressView.mas_bottom).offset(8.0);
        }];
        
        // 更新
        [self.progressLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.progressView);
            make.right.equalTo(self.contentView).offset(-26.0);
        }];
        [self.progressView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.surplusLabel.mas_bottom).offset(16.0);
            make.height.equalTo(@1);
            make.left.equalTo(self.contentView).offset(20.0);
            make.right.equalTo(self.progressLabel.mas_left).offset(-6.0);
        }];
        [@[self.deadlineLabel, self.profitLabel, self.surplusLabel] mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.titleLabel.mas_bottom).offset(52.0);
        }];
        [self.actionButton mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView).offset(-30.0);
            make.size.mas_equalTo(CGSizeMake(126.0, 32.0));
            make.centerY.equalTo(self.addInterestLabel);
        }];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
