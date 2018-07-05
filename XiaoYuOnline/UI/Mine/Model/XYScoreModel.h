//
//  XYScoreModel.h
//  XiaoYuOnline
//
//  Created by WilliamChen on 2018/5/24.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <YYKit/NSDictionary+YYAdd.h>

@interface XYScoreModel : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *scoreID;
@property (nonatomic, copy) NSString *score;
@property (nonatomic, copy) NSString *cashValue;
@property (nonatomic, assign) NSInteger validDate;
@property (nonatomic, assign) BOOL isValid;

- (instancetype)initWithScoreShopListData:(NSDictionary *)data;

@end
