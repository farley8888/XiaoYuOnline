//
//  XYBidThirdViewCell.m
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/10.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "XYBidThirdViewCell.h"
#import "NSString+Common.h"

@implementation XYBidThirdViewCell {
    UIView *_yellowLineView;
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
        _titleLabel.textColor = XYGlobalUI.whiteColor;
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.backgroundColor = XYGlobalUI.yellowColor;
        _titleLabel.text = NSLocalizedString(@"ManageMoney_ProjectIntro", nil);
        
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.font = XYGlobalUI.smallFont_12;
        _contentLabel.numberOfLines = 0;
        
        _yellowLineView = [[UIView alloc] init];
        _yellowLineView.backgroundColor = XYGlobalUI.yellowColor;
        
        UIView *superView = self.contentView;
        [superView addSubview:_titleLabel];
        [superView addSubview:_contentLabel];
        [superView addSubview:_yellowLineView];
        
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(82.0, 24.0));
            make.left.top.equalTo(superView);
        }];
        [_yellowLineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.titleLabel.mas_right);
            make.bottom.equalTo(self.titleLabel);
            make.right.equalTo(superView);
            make.height.equalTo(@2);
        }];
        [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self->_yellowLineView.mas_bottom).offset(14.0);
            make.left.equalTo(superView).offset(20.0);
            make.right.equalTo(superView).offset(-20.0);
        }];
    }
    return self;
}

+ (CGFloat)cellHeightWithContent:(NSString *)content {
    CGFloat h = [content stringHeightWithFont:XYGlobalUI.smallFont_12 restrictWidth:SCREEN_WIDTH - 40.0];
    
    return h + 80.0;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
