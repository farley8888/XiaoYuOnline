//
//  DataUtil.m
//  XiaoYuOnline
//
//  Created by apple on 2018/7/11.
//  Copyright © 2018年 XiaoYuOnline. All rights reserved.
//

#import "DataUtil.h"

static BOOL IS_PASSED ; //是否通过审核

@implementation DataUtil

+(void) setResult:(BOOL) pass{
    IS_PASSED = pass;
}

+(BOOL) isPass{
    return IS_PASSED;
}

- (void)generatePlist{
    NSLog(@"%s", __FUNCTION__);
    
    NSMutableArray *arrtemp = [NSMutableArray array];
    FSubType *sub1, *sub2, *sub3, *sub4, *sub5, *sub6;
    sub1 = [FSubType subTypeWithName:@"早午晚餐"];
    sub1.amountRange = @"5-700";
    [arrtemp addObject:sub1];
    sub2 = [FSubType subTypeWithName:@"烟茶水"];
    sub2.amountRange = @"5-700";
    [arrtemp addObject:sub2];
    sub3 = [FSubType subTypeWithName:@"水果零食"];
    sub3.amountRange = @"5-100";
    [arrtemp addObject:sub3];
    FFirstType *firstType1 = [FFirstType firstTypeWithName:@"食品酒水" budget:0 subTypeArr:arrtemp.copy];
    firstType1.initBudget = 2000;
    
    [arrtemp removeAllObjects];
    sub1 = [FSubType subTypeWithName:@"日常用品"];
    sub1.amountRange = @"100-500";
    [arrtemp addObject:sub1];
    sub2 = [FSubType subTypeWithName:@"水电煤气"];
    sub2.amountRange = @"100-500";
    [arrtemp addObject:sub2];
    sub3 = [FSubType subTypeWithName:@"房租"];
    sub3.amountRange = @"1000-1500";
    [arrtemp addObject:sub3];
    sub4 = [FSubType subTypeWithName:@"物业管理"];
    sub4.amountRange = @"150-200";
    [arrtemp addObject:sub4];
    sub5 = [FSubType subTypeWithName:@"维修保养"];
    sub5.amountRange = @"200-1000";
    [arrtemp addObject:sub5];
    FFirstType *firstType2 = [FFirstType firstTypeWithName:@"居家物业" budget:0 subTypeArr:arrtemp.copy];
    firstType2.initBudget = 4000;
    
    [arrtemp removeAllObjects];
    sub1 = [FSubType subTypeWithName:@"公共交通"];
    sub1.amountRange = @"5-10";
    [arrtemp addObject:sub1];
    sub2 = [FSubType subTypeWithName:@"打车"];
    sub2.amountRange = @"30-100";
    [arrtemp addObject:sub2];
    sub3 = [FSubType subTypeWithName:@"租车"];
    sub3.amountRange = @"200-500";
    [arrtemp addObject:sub3];
    sub4 = [FSubType subTypeWithName:@"私家车"];
    sub4.amountRange = @"200-300";
    [arrtemp addObject:sub4];
    sub5 = [FSubType subTypeWithName:@"包车"];
    sub5.amountRange = @"500-800";
    [arrtemp addObject:sub5];
    FFirstType *firstType3 = [FFirstType firstTypeWithName:@"行车交通" budget:0 subTypeArr:arrtemp.copy];
    firstType3.initBudget = 500;
    
    [arrtemp removeAllObjects];
    sub1 = [FSubType subTypeWithName:@"运动健身"];
    sub1.amountRange = @"10-100";
    [arrtemp addObject:sub1];
    sub2 = [FSubType subTypeWithName:@"腐败聚会"];
    sub2.amountRange = @"150-300";
    [arrtemp addObject:sub2];
    sub3 = [FSubType subTypeWithName:@"休闲玩乐"];
    sub3.amountRange = @"200-400";
    [arrtemp addObject:sub3];
    sub4 = [FSubType subTypeWithName:@"宠物宝贝"];
    sub4.amountRange = @"200-400";
    [arrtemp addObject:sub4];
    sub5 = [FSubType subTypeWithName:@"旅游度假"];
    sub5.amountRange = @"1000-3000";
    [arrtemp addObject:sub5];
    sub6 = [FSubType subTypeWithName:@"酒店费"];
    sub6.amountRange = @"300-1000";
    [arrtemp addObject:sub6];
    FFirstType *firstType4 = [FFirstType firstTypeWithName:@"休闲娱乐" budget:0 subTypeArr:arrtemp.copy];
    firstType4.initBudget = 1000;
    
    
    [arrtemp removeAllObjects];
    sub1 = [FSubType subTypeWithName:@"书报杂志"];
    sub1.amountRange = @"50-200";
    [arrtemp addObject:sub1];
    sub2 = [FSubType subTypeWithName:@"培训"];
    sub2.amountRange = @"2000-4000";
    [arrtemp addObject:sub2];
    sub3 = [FSubType subTypeWithName:@"数码装备"];
    sub3.amountRange = @"2000-4000";
    [arrtemp addObject:sub3];
    sub4 = [FSubType subTypeWithName:@"教材"];
    sub4.amountRange = @"50-100";
    [arrtemp addObject:sub4];
    FFirstType *firstType5 = [FFirstType firstTypeWithName:@"学习进修" budget:0 subTypeArr:arrtemp.copy];
    firstType5.initBudget = 500;
    
    [arrtemp removeAllObjects];
    sub1 = [FSubType subTypeWithName:@"送礼"];
    sub1.amountRange = @"200-1000";
    [arrtemp addObject:sub1];
    sub2 = [FSubType subTypeWithName:@"请客"];
    sub2.amountRange = @"200-1000";
    [arrtemp addObject:sub2];
    sub3 = [FSubType subTypeWithName:@"孝敬长辈"];
    sub3.amountRange = @"200-1000";
    [arrtemp addObject:sub3];
    sub4 = [FSubType subTypeWithName:@"还钱"];
    sub4.amountRange = @"200-1000";
    [arrtemp addObject:sub4];
    sub5 = [FSubType subTypeWithName:@"慈善捐助"];
    sub5.amountRange = @"200-1000";
    [arrtemp addObject:sub5];
    sub6 = [FSubType subTypeWithName:@"酒席红包"];
    sub6.amountRange = @"200-1000";
    [arrtemp addObject:sub6];
    FFirstType *firstType6 = [FFirstType firstTypeWithName:@"人情来往" budget:0 subTypeArr:arrtemp.copy];
    firstType6.initBudget = 1000;
    
    [arrtemp removeAllObjects];
    sub1 = [FSubType subTypeWithName:@"药品费"];
    sub1.amountRange = @"20-100";
    [arrtemp addObject:sub1];
    sub2 = [FSubType subTypeWithName:@"保健费"];
    sub2.amountRange = @"200-1000";
    [arrtemp addObject:sub2];
    sub3 = [FSubType subTypeWithName:@"美容费"];
    sub3.amountRange = @"200-1000";
    [arrtemp addObject:sub3];
    sub4 = [FSubType subTypeWithName:@"治疗费"];
    sub4.amountRange = @"100-200";
    [arrtemp addObject:sub4];
    FFirstType *firstType7 = [FFirstType firstTypeWithName:@"医疗保健" budget:0 subTypeArr:arrtemp.copy];
    firstType7.initBudget = 500;
    
    [arrtemp removeAllObjects];
    sub1 = [FSubType subTypeWithName:@"银行手续"];
    sub1.amountRange = @"10-50";
    [arrtemp addObject:sub1];
    sub2 = [FSubType subTypeWithName:@"投资亏损"];
    sub2.amountRange = @"10-500";
    [arrtemp addObject:sub2];
    sub3 = [FSubType subTypeWithName:@"按揭还款"];
    sub3.amountRange = @"2000-5000";
    [arrtemp addObject:sub3];
    sub4 = [FSubType subTypeWithName:@"消费税收"];
    sub4.amountRange = @"500-1000";
    [arrtemp addObject:sub4];
    sub5 = [FSubType subTypeWithName:@"利息支出"];
    sub5.amountRange = @"50-100";
    [arrtemp addObject:sub5];
    sub6 = [FSubType subTypeWithName:@"赔偿罚款"];
    sub6.amountRange = @"50-300";
    [arrtemp addObject:sub6];
    FFirstType *firstType8 = [FFirstType firstTypeWithName:@"金融保险" budget:0 subTypeArr:arrtemp.copy];
    firstType8.initBudget = 2000;
    
    [arrtemp removeAllObjects];
    sub1 = [FSubType subTypeWithName:@"其它支出"];
    sub1.amountRange = @"50-300";
    [arrtemp addObject:sub1];
    sub2 = [FSubType subTypeWithName:@"意外丢失"];
    sub2.amountRange = @"50-300";
    [arrtemp addObject:sub2];
    sub3 = [FSubType subTypeWithName:@"烂账损失"];
    sub3.amountRange = @"50-300";
    [arrtemp addObject:sub3];
    FFirstType *firstType9 = [FFirstType firstTypeWithName:@"其它杂项" budget:0 subTypeArr:arrtemp.copy];
    firstType9.initBudget = 500;
    
    NSMutableArray *expandesArr = [NSMutableArray arrayWithObjects:firstType1, firstType2, firstType3, firstType4, firstType5, firstType6, firstType7, firstType8, firstType9, nil];
    
    // 收入
    [arrtemp removeAllObjects];
    sub1 = [FSubType subTypeWithName:@"工资收入"];
    [arrtemp addObject:sub1];
    sub2 = [FSubType subTypeWithName:@"利息收入"];
    [arrtemp addObject:sub2];
    sub3 = [FSubType subTypeWithName:@"加班收入"];
    [arrtemp addObject:sub3];
    sub4 = [FSubType subTypeWithName:@"奖金收入"];
    [arrtemp addObject:sub4];
    sub5 = [FSubType subTypeWithName:@"投资收入"];
    [arrtemp addObject:sub5];
    sub6 = [FSubType subTypeWithName:@"兼职收入"];
    [arrtemp addObject:sub6];
    FSubType *sub7 = [FSubType subTypeWithName:@"出差收入"];
    [arrtemp addObject:sub7];
    FFirstType *firstType10 = [FFirstType firstTypeWithName:@"职业收入" budget:0 subTypeArr:arrtemp.copy];
    
    [arrtemp removeAllObjects];
    sub1 = [FSubType subTypeWithName:@"礼金收入"];
    [arrtemp addObject:sub1];
    sub2 = [FSubType subTypeWithName:@"中奖收入"];
    [arrtemp addObject:sub2];
    sub3 = [FSubType subTypeWithName:@"意外来钱"];
    [arrtemp addObject:sub3];
    sub4 = [FSubType subTypeWithName:@"经营所得"];
    [arrtemp addObject:sub4];
    sub5 = [FSubType subTypeWithName:@"信用卡还款"];
    [arrtemp addObject:sub5];
    FFirstType *firstType11 = [FFirstType firstTypeWithName:@"其它收入" budget:0 subTypeArr:arrtemp.copy];
    
    NSMutableArray *incomeArr = [NSMutableArray arrayWithObjects:firstType10, firstType11, nil];
    
    
    NSMutableArray *accountArr = [NSMutableArray arrayWithObjects:@"现金（RMB)", @"银行卡", @"支付宝", @"微信", @"其他", nil];
    
    FAccountCategaries *category = [[FAccountCategaries alloc] init];
    category.expensesTypeArr = expandesArr;
    category.incomeTypeArr = incomeArr;
    category.accountTypeArr = accountArr;
    
    self.aFAccountCategaries = category;
    NSArray *plistWriteArr = [category mj_JSONObject];
    
    NSString *cachepath =  NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject;
    //在这里,我们指定搜索的是Cache目录,所以结果只有一个,取出Cache目录
    NSString *filePathName = [cachepath stringByAppendingPathComponent:@"AccoutCategeries.plist"];
    
    [plistWriteArr writeToFile:filePathName atomically:YES];
    
    //    NSURL *pathURL = [[NSBundle mainBundle] URLForResource:@"AccoutCategeries" withExtension:@"plist"];
    plistWriteArr = [NSArray arrayWithContentsOfFile:filePathName];
    DLOG(@"path = %@, result = %@", filePathName, plistWriteArr);
}


- (void)generateMonthBlance{
    // 6月份 //MM月dd日HH时mm分 yyyy年MM月
    NSMutableArray *monthExpandse = [NSMutableArray array];
    NSMutableArray *monthincome = [NSMutableArray array];
    //    NSInteger day = [NSDate date].day;
    //    int month = [NSDate date].month;
    for (int i = 1; i<= 30; i++) {// 支出一天1-2个，收入有6份收入
        
        NSString *time_minut = [NSString stringWithFormat:@"04月%02d日%02d时%02d分", i, 9+i%12, 10+i%20];
        NSString *time_month = [NSString stringWithFormat:@"2018年04月"];
        FAccountRecord *expandse = [FAccountRecord recordRandomExpandseWithtime_minute:time_minut time_month:time_month];
        [monthExpandse addObject:expandse];
        if (i%5 == 0) {
            
            FAccountRecord *expandse = [FAccountRecord recordRandomExpandseWithtime_minute:time_minut time_month:time_month];
            [monthExpandse addObject:expandse];
            
            FAccountRecord *income = [FAccountRecord recordRandomIncomeWithtime_minute:time_minut time_month:time_month];
            [monthincome addObject:income];
        }
    }
    FCurrentMonthRecord *moth4 = [FCurrentMonthRecord new];
    moth4.expandseArr = monthExpandse.mutableCopy;
    moth4.incomeArr = monthincome.mutableCopy;
    
    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    NSString *filePathName = [path stringByAppendingPathComponent:@"F_default_201804.txt"];
    
    NSDictionary *month4Account = [moth4 mj_JSONObject];
    NSString *jsonString = [month4Account mj_JSONString];
    
    [jsonString writeToFile:filePathName atomically:YES encoding:NSUTF8StringEncoding error:nil];
}


@end
