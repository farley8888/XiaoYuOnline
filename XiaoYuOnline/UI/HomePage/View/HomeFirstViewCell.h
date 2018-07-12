//
//  XYHomeFirstViewCell.h
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/11.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, XYHomeButtonType) {
    XYHomeButtonTypeSign,
    XYHomeButtonTypeInvite,
    XYHomeButtonTypeAppointment,
    XYHomeButtonTypeBid,
    XYHomeButtonTypeNotify
};

@class HomeFirstViewCell, SDCycleScrollView;

@protocol XYHomeFirstCellDelegate<NSObject>
- (void)firstCell:(HomeFirstViewCell *)cell didPressedButtonWithType:(XYHomeButtonType)type;
@end

@interface HomeFirstViewCell : UITableViewCell

@property (nonatomic, strong) SDCycleScrollView *bannerView;
@property (nonatomic, strong) UIButton *daySignButton;
@property (nonatomic, strong) UIButton *inviteButton;
@property (nonatomic, strong) UIButton *appointmentButton;
@property (nonatomic, strong) UIButton *bidButton;
@property (nonatomic, strong) UIButton *notifyButton;
@property (nonatomic, weak) id<XYHomeFirstCellDelegate> delegate;

+ (CGFloat)cellHeight;
@end
