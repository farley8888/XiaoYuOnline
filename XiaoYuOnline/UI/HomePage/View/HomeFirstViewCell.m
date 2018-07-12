//
//  XYHomeFirstViewCell.m
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/11.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "HomeFirstViewCell.h"
#import "TTVerticalAlignmentButton.h"
#import <SDCycleScrollView/SDCycleScrollView.h>

@implementation HomeFirstViewCell {
    UIView *_lineView;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        NSArray *images = @[[UIImage imageNamed:@"home_banner_newer"],
                            [UIImage imageNamed:@"home_banner_online"],
                            [UIImage imageNamed:@"home_banner_sure"]
                            ];
        _bannerView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectZero imageNamesGroup:images];
        _bannerView.autoScrollTimeInterval = 3.0;
        
        _daySignButton = [self subButtonWithTitle:NSLocalizedString(@"HomePage_DaySign", nil) image:[UIImage imageNamed:@"home_daySign_btn"]];
        _inviteButton = [self subButtonWithTitle:NSLocalizedString(@"HomePage_Invite", nil) image:[UIImage imageNamed:@"home_invite_btn"]];
        _appointmentButton = [self subButtonWithTitle:NSLocalizedString(@"HomePage_Borrow", nil) image:[UIImage imageNamed:@"home_borrow_btn"]];
        _bidButton = [self subButtonWithTitle:NSLocalizedString(@"HomePage_Bid", nil) image:[UIImage imageNamed:@"home_bid_btn"]];
        
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = XYGlobalUI.lineColor;
        
        _notifyButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _notifyButton.titleLabel.font = XYGlobalUI.smallFont_12;
        _notifyButton.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, -10);
        _notifyButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [_notifyButton setTitle:@"通知消息" forState:UIControlStateNormal];
        [_notifyButton setTitleColor:XYGlobalUI.blackColor forState:UIControlStateNormal];
        [_notifyButton setImage:[UIImage imageNamed:@"home_notify_btn"] forState:UIControlStateNormal];
        
        UIView *superView = self.contentView;
        [superView addSubview:_bannerView];
        [superView addSubview:_inviteButton];
        [superView addSubview:_daySignButton];
        [superView addSubview:_appointmentButton];
        [superView addSubview:_bidButton];
        [superView addSubview:_notifyButton];
        [superView addSubview:_lineView];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat w = CGRectGetWidth(self.contentView.frame);
    CGFloat h = ceilf(w * (313.0 / 750));
    _bannerView.frame = CGRectMake(0, 0, w, h);
    
    NSArray *btns = @[_daySignButton, _appointmentButton, _inviteButton, _bidButton];
    CGSize btnSize = CGSizeMake(60, 90);
    CGFloat top = 18.0;
    CGFloat y = CGRectGetMaxY(_bannerView.frame) + top;
    CGFloat gap = (w - (btnSize.width * btns.count)) / 5;
    for (NSUInteger i = 0, count = btns.count; i < count; i ++) {
        UIButton *btn = btns[i];
        btn.frame = CGRectMake(gap + (gap + btnSize.width) * i, y, btnSize.width, btnSize.height);
    }
    
    _lineView.frame = CGRectMake(0, CGRectGetMaxY(_inviteButton.frame) + 18.0, w, 0.5);
    _notifyButton.frame = CGRectMake(20, CGRectGetMaxY(_lineView.frame), w - 40.0, 20.0);
}

- (UIButton *)subButtonWithTitle:(NSString *)title image:(UIImage *)image {
    TTVerticalAlignmentButton *button = [TTVerticalAlignmentButton buttonWithType:UIButtonTypeCustom];
    button.contentVerticalAlignment = UIControlContentVerticalAlignmentTop;
    button.titleLabel.font = XYGlobalUI.smallFont_14;
    button.margin = 3.0;
    [button setTitle:title forState:UIControlStateNormal];
    [button setImage:image forState:UIControlStateNormal];
    [button setTitleColor:XYGlobalUI.blackColor forState:UIControlStateNormal];
    [button addTarget:self action:@selector(operateButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}

- (void)operateButtonAction:(UIButton *)button {
    XYHomeButtonType type;
    if (button == _daySignButton) {
        type = XYHomeButtonTypeSign;
    } else if (button == _inviteButton) {
        type = XYHomeButtonTypeInvite;
    } else if (button == _appointmentButton) {
        type = XYHomeButtonTypeAppointment;
    } else if (button == _bidButton) {
        type = XYHomeButtonTypeBid;
    } else {
        type = XYHomeButtonTypeNotify;
    }
    
    if ([self.delegate respondsToSelector:@selector(firstCell:didPressedButtonWithType:)]) {
        [self.delegate firstCell:self didPressedButtonWithType:type];
    }
}

+ (CGFloat)cellHeight {
    return ceilf(SCREEN_WIDTH * (313.0 / 750)) + 146.0;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
