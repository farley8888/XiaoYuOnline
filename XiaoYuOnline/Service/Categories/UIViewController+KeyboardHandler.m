//
//  UIViewController+KeyboardHandler.m
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/14.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "UIViewController+KeyboardHandler.h"
#import <objc/objc.h>
#import <objc/runtime.h>

static const char *kOriginContentInsetKey = "OriginContentInsetKey";

@interface UIView (FirstResponder)
- (id)findFirstResponder;
@end

@implementation UIViewController (KeyboardHandler)

- (void)registerKeyboardNotification{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillAppearHandle:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHiddenHandle:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
}

- (void)removeKeyboardNotification{
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillShowNotification
                                                  object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillHideNotification
                                                  object:nil];
}

- (void)setOriginContentInset:(NSValue *)originContentInset {
    objc_setAssociatedObject(self, kOriginContentInsetKey, originContentInset, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSValue *)originContentInset {
    return objc_getAssociatedObject(self, kOriginContentInsetKey);
}

- (UIViewAnimationOptions)animationOptionsWithKeyboardNotification:(NSNotification *)noti{
    UIViewAnimationCurve animationCurve = [noti.userInfo[UIKeyboardAnimationCurveUserInfoKey] unsignedIntegerValue];
    UIViewAnimationOptions animationOptions = UIViewAnimationOptionBeginFromCurrentState;
    if (animationCurve == UIViewAnimationCurveEaseIn) {
        animationOptions |= UIViewAnimationOptionCurveEaseIn;
    }
    else if (animationCurve == UIViewAnimationCurveEaseInOut) {
        animationOptions |= UIViewAnimationOptionCurveEaseInOut;
    }
    else if (animationCurve == UIViewAnimationCurveEaseOut) {
        animationOptions |= UIViewAnimationOptionCurveEaseOut;
    }
    else if (animationCurve == UIViewAnimationCurveLinear) {
        animationOptions |= UIViewAnimationOptionCurveLinear;
    }
    return animationOptions;
}

- (void)keyboardWillAppearHandle:(NSNotification *)noti{
    UIScrollView *scrollerView = nil;
    for (UIView *view in self.view.subviews) {
        if ([view isKindOfClass:[UIScrollView class]]) {
            scrollerView = (UIScrollView *)view;
        }
    }
    if (!scrollerView) {
        return;
    }
    
    NSTimeInterval  aniTime = [noti.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    CGRect endRect = [noti.userInfo[UIKeyboardFrameEndUserInfoKey ] CGRectValue];
    
    UIView *firstResponseder = [self.view findFirstResponder];
    if (!firstResponseder || ![firstResponseder isKindOfClass:[UITextField class]]) {
        return;
    }
    
    UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
    CGRect wR = [firstResponseder.superview convertRect:firstResponseder.frame toView:window];
    
    if (CGRectIntersectsRect(wR, endRect)) {
        CGRect intersectsR = CGRectIntersection(wR, endRect);
        UIEdgeInsets inset = self.originContentInset.UIEdgeInsetsValue;
        inset.bottom += (CGRectGetMaxY(intersectsR) - CGRectGetMinY(endRect));
        if (aniTime > 0) {
            [scrollerView setContentInset:inset];
            [scrollerView setContentOffset:CGPointMake(scrollerView.contentOffset.x, scrollerView.contentOffset.y + CGRectGetMaxY(intersectsR) - CGRectGetMinY(endRect)) animated:YES];
        } else {
            [scrollerView setContentInset:inset];
            [scrollerView setContentOffset:CGPointMake(scrollerView.contentOffset.x, scrollerView.contentOffset.y + CGRectGetMaxY(intersectsR) - CGRectGetMinY(endRect)) animated:NO];
        }
    }
}

- (void)keyboardWillHiddenHandle:(NSNotification *)noti
{
    UIScrollView *scrollerView = nil;
    for (UIView *view in self.view.subviews) {
        if ([view isKindOfClass:[UIScrollView class]]) {
            scrollerView = (UIScrollView *)view;
        }
    }
    if (!scrollerView) {
        return;
    }
    NSTimeInterval  aniTime = [noti.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    UIEdgeInsets inset = self.originContentInset.UIEdgeInsetsValue;
    if (aniTime > 0) {
        [scrollerView setContentInset:inset];
        [scrollerView setScrollsToTop:YES];
    } else {
        [scrollerView setContentInset:inset];
        [scrollerView setScrollsToTop:NO];
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

@end

@implementation UIView (FirstResponder)

- (id)findFirstResponder
{
    if (self.isFirstResponder) {
        return self;
    }
    for (UIView *subView in self.subviews) {
        id responder = [subView findFirstResponder];
        if (responder) return responder;
    }
    return nil;
}

@end
