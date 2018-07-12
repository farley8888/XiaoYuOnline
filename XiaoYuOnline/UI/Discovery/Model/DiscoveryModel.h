//
//  DiscoveryModel.h
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/7.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "BaseInfoModel.h"

@interface DiscoveryModel : BaseInfoModel

@property (nonatomic, strong) UIImage *indicatorImage;
@property (nonatomic, strong) NSString *dateString;
@property (nonatomic, strong) NSString *discoveryID;

- (instancetype)initWithDiscoveryApiData:(NSDictionary *)data;

+ (NSArray<DiscoveryModel *>*)discoveryMainDatasourceList;

@end
