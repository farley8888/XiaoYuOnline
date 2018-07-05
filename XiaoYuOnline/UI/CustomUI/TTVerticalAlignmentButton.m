//
//  TTVerticalAlignmentButton.m
//  TataProject
//
//  Created by WilliamChen on 16/10/26.
//  Copyright © 2016年 Lala. All rights reserved.
//

#import "TTVerticalAlignmentButton.h"

@implementation TTVerticalAlignmentButton

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGRect oRect = [super titleRectForContentRect:contentRect];
    oRect.origin.x = 0;
    
    CGFloat imgH = [super imageRectForContentRect:contentRect].size.height;
    CGFloat conH =  imgH + CGRectGetHeight(oRect) + _margin;
    oRect.origin.y = (CGRectGetHeight(contentRect) - conH) / 2.0 + imgH + _margin;
    oRect.size.width = CGRectGetWidth(contentRect);
    return oRect;
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGRect oRect = [super imageRectForContentRect:contentRect];
    oRect.origin.x = (CGRectGetWidth(contentRect) - CGRectGetWidth(oRect)) / 2.0;
    
    CGFloat conH = [super titleRectForContentRect:contentRect].size.height + CGRectGetHeight(oRect) + _margin;
    oRect.origin.y = (CGRectGetHeight(contentRect) - conH) / 2.0;
    return oRect;
}

@end
