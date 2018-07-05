//
//  XYDiscoveryDetailModel.m
//  XiaoYuOnline
//
//  Created by ChenWei on 2018/5/10.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "XYDiscoveryDetailModel.h"
#import <YYKit/NSDictionary+YYAdd.h>
#import "NSString+Common.h"

@implementation XYDiscoveryDetailModel

- (instancetype)initWithData:(NSDictionary *)data restrictWidth:(CGFloat)width attribute:(NSDictionary *)attribute {
    self = [super init];
    if (self) {
        NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
        _contentText = [[data stringValueForKey:@"content" default:nil] stringByTrimmingCharactersInSet:set];
        _imageURL = [data stringValueForKey:@"url" default:nil];
        NSString *type = [data stringValueForKey:@"type" default:nil];
        if ([type isEqualToString:@"text"]) {
            _infoType = XYInfoTypeText;
            _contentHeight = [_contentText stringHeightWithAttribute:attribute restrictWidth:width];
            _attributeContent = [[NSAttributedString alloc] initWithString:_contentText attributes:attribute];
        } else if ([type isEqualToString:@"image"]) {
            _infoType = XYInfoTypeImage;
            
            float w = [data floatValueForKey:@"width" default:0];
            float h = [data floatValueForKey:@"height" default:0];
            if (w > 0.1) {
                _imageRatio = h / w;
                _contentHeight = _imageRatio * width;
            } else {
                _contentHeight = 0;
            }
        }
    }
    return self;
}

@end
