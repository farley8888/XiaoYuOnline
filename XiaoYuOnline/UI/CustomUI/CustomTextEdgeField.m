//
//  CustomTextEdgeField.m
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/13.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "CustomTextEdgeField.h"

@implementation CustomTextEdgeField

- (CGRect)textRectForBounds:(CGRect)bounds {
    CGRect superRect = [super textRectForBounds:bounds];
    return CGRectMake(superRect.origin.x + _textEdge.left, superRect.origin.y + _textEdge.top, superRect.size.width - _textEdge.left - _textEdge.right, superRect.size.height - _textEdge.top - _textEdge.bottom);
}

- (CGRect)placeholderRectForBounds:(CGRect)bounds {
    CGRect superRect = [super textRectForBounds:bounds];
    return CGRectMake(superRect.origin.x + _textEdge.left, superRect.origin.y + _textEdge.top, superRect.size.width - _textEdge.left - _textEdge.right, superRect.size.height - _textEdge.top - _textEdge.bottom);
}

- (CGRect)editingRectForBounds:(CGRect)bounds {
    CGRect superRect = [super textRectForBounds:bounds];
    return CGRectMake(superRect.origin.x + _textEdge.left, superRect.origin.y + _textEdge.top, superRect.size.width - _textEdge.left - _textEdge.right, superRect.size.height - _textEdge.top - _textEdge.bottom);
}

- (CGRect)leftViewRectForBounds:(CGRect)bounds {
    CGRect superRect = [super leftViewRectForBounds:bounds];
    return CGRectMake(superRect.origin.x + _leftViewEdge.left, superRect.origin.y -( _leftViewEdge.top + _leftViewEdge.bottom) / 2.0, superRect.size.width, superRect.size.height);
}

- (CGRect)rightViewRectForBounds:(CGRect)bounds {
    CGRect superRect = [super rightViewRectForBounds:bounds];
    return CGRectMake(superRect.origin.x - _rightViewEdge.left - _rightViewEdge.right, superRect.origin.y - (_rightViewEdge.top + _rightViewEdge.bottom) / 2.0, superRect.size.width, superRect.size.height);
}

@end
