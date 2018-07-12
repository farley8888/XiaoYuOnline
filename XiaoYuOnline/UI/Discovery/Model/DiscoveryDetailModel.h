//
//  DiscoveryDetailModel.h
//  XiaoYuOnline
//
//  Created by ChenWei on 2018/5/10.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, XYInfoType) {
    XYInfoTypeText,
    XYInfoTypeImage
};
@interface DiscoveryDetailModel : NSObject
@property (nonatomic, assign) XYInfoType infoType;
@property (nonatomic, copy) NSString *contentText;
@property (nonatomic, copy) NSAttributedString *attributeContent;
@property (nonatomic, strong) NSString *imageURL;
// 图片高 / 宽
@property (nonatomic, assign) float imageRatio;
// 文字或者图片高度
@property (nonatomic, readonly) CGFloat contentHeight;

- (instancetype)initWithData:(NSDictionary *)data restrictWidth:(CGFloat)width attribute:(NSDictionary *)attribute;

@end
