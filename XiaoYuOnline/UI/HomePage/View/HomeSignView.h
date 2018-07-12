//
//  XYHomeSignView.h
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/12.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HomeSignView;
@protocol XYHomeSignViewDelegate<NSObject>
- (void)homeSignView:(HomeSignView *)view didPressSignButton:(UIButton *)signButton;
@end

@interface HomeSignView : UIView
@property (nonatomic, weak) id<XYHomeSignViewDelegate> delegate;
@property (nonatomic, readonly) NSDateFormatter *dateFormatter;

+ (HomeSignView *)signView;

- (void)show;
- (void)dismiss;
- (void)setSeletedDates:(NSArray<NSDate *> *)dates;

@end
