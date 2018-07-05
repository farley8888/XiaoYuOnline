//
//  XYWellBeingModel.h
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/6.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XYWellBeingModel : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *imageURL;

- (instancetype)initWithTitle:(NSString *)title imageURL:(NSString *)imageURL;

+ (NSArray<XYWellBeingModel *> *)placeholderDatasourceList;

@end
