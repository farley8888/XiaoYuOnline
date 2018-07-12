//
//  LoanModel.m
//  XiaoYuOnline
//
//  Created by wei.chen on 2018/4/12.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "LoanModel.h"

@implementation LoanModel

- (instancetype)initWithTitle:(NSString *)title content:(NSString *)content description:(NSString *)description placeHolder:(NSString *)placeHolder {
    self = [super initWithTitle:title content:content description:description];
    if (self) {
        self.editable = YES;
        _placeHolder = placeHolder;
    }
    return self;
}

+ (NSArray<NSArray<LoanModel *> *> *)loanDatasourceList {
    LoanModel *timeLimite = [[LoanModel alloc] initWithTitle:NSLocalizedString(@"HomePage_Loan_TimeLimite", nil) content:nil description:nil placeHolder:NSLocalizedString(@"Public_Select", nil)];
    LoanModel *bussinessType = [[LoanModel alloc] initWithTitle:NSLocalizedString(@"HomePage_Loan_BusinessType", nil) content:nil description:nil placeHolder:NSLocalizedString(@"Public_Select", nil)];
    LoanModel *raiseTime = [[LoanModel alloc] initWithTitle:NSLocalizedString(@"HomePage_Loan_RaiseTime", nil) content:nil description:nil placeHolder:NSLocalizedString(@"Public_Select", nil)];

    NSArray *arr1 = @[@"1 个月", @"2 个月", @"3 个月", @"4 个月", @"5 个月", @"6 个月"];
    NSArray *arr2 = @[@"车辆抵押借款", @"房屋抵押借款", @"小微企业周转借款", @"供应链金融借款", @"文化产业项目借款", @"小额个人信用借款",];
    NSArray *arr3 = @[@"1 天", @"2 天", @"3 天", @"4 天", @"5 天", @"6 天"];
    
    timeLimite.editable = NO;
    bussinessType.editable = NO;
    raiseTime.editable = NO;
    timeLimite.sheetTitles = arr1;
    bussinessType.sheetTitles = arr2;
    raiseTime.sheetTitles = arr3;
    
    return @[@[[[LoanModel alloc] initWithTitle:NSLocalizedString(@"HomePage_Loan_Volume", nil) content:nil description:nil placeHolder:NSLocalizedString(@"HomePage_Loan_Volume_PH", nil)],
               [[LoanModel alloc] initWithTitle:NSLocalizedString(@"HomePage_Loan_YearRatio", nil) content:nil description:nil placeHolder:NSLocalizedString(@"HomePage_Loan_YearRatio_PH", nil)],
               timeLimite,
               bussinessType,
               raiseTime,
               [[LoanModel alloc] initWithTitle:NSLocalizedString(@"HomePage_Loan_Name", nil) content:nil description:nil placeHolder:NSLocalizedString(@"HomePage_Loan_Name_PH", nil)],
               [[LoanModel alloc] initWithTitle:NSLocalizedString(@"HomePage_Loan_Phone", nil) content:nil description:nil placeHolder:NSLocalizedString(@"HomePage_Loan_Phone_PH", nil)]
               ],
             @[[[LoanModel alloc] initWithTitle:NSLocalizedString(@"HomePage_Loan_Description", nil) content:nil description:NSLocalizedString(@"HomePage_Loan_Description_Des", nil) placeHolder:NSLocalizedString(@"HomePage_Loan_Description_PH", nil)],
               [[LoanModel alloc] initWithTitle:NSLocalizedString(@"HomePage_Loan_MortgageDes", nil) content:nil description:nil placeHolder:NSLocalizedString(@"HomePage_Loan_MortgageDes_PH", nil)]
                 ]
             ];
}

@end
