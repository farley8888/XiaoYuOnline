//
//  XYQAModel.h
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/4.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XYQAModel : NSObject

@property (nonatomic, readonly) NSString *title;
@property (nonatomic, readonly) NSString *content;
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, assign) UIViewContentMode imageContentModel;

- (instancetype)initWithTitle:(nonnull NSString *)title content:(nonnull NSString *)content;

+ (NSArray<XYQAModel *>*)QADatasourceList;

@end
