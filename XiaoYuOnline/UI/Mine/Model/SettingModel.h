//
//  XYSettingModel.h
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/5.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "BaseInfoModel.h"

@interface SettingModel : BaseInfoModel

+ (NSArray <NSArray<SettingModel *> *> *)settingDatasourceList;

@end
