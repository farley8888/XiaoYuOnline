//
//  SheetPresentStyleView.h
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/16.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SheetPresentStyleView : UIView

@property (nonatomic, strong, nonnull) UIView *contentView;

/**
 为了适配 iPhone X 这种异形屏幕添加的属性，在本 App 里主要使用 .bottom 的值，防止视图底部被遮盖。当然
 此属性在 iOS 11 以下没有意义，值为 UIEdgeInsetZero
 */
@property (nonatomic, assign, readonly) UIEdgeInsets safeAreaInsetsEdge;
@property (nonatomic, assign) BOOL enableOutsideTapDismiss;

- (void)show;
- (void)dismissWithCompletionBlock:(nullable void(^)(BOOL finished))completion;

@end
