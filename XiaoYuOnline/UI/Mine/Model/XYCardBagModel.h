//
//  XYCardBagModel.h
//  XiaoYuOnline
//
//  Created by ChenWei on 2018/5/15.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XYCardBagModel : NSObject
@property (nonatomic, copy) NSString *ticketID;
@property (nonatomic, copy) NSString *value;
@property (nonatomic, copy) NSString *ticketName;
@property (nonatomic, copy) NSString *useableMoney;
@property (nonatomic, assign) NSTimeInterval validDate;
@property (nonatomic, assign, getter=isUsed) BOOL used;
@property (nonatomic, assign, getter=isValid) BOOL valid;

- (instancetype)initWithApiData:(NSDictionary *)data;
@end
