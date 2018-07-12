#import <UIKit/UIKit.h>
#import "HomeSignView.h"
#import "UIView+Common.h"
#import "FSCalendar.h"

@interface HomeSignView (Custeffet)
- (void)initWithFrame:(CGRect)frame custEffet:(NSString *)custEffet;
- (void)layoutSubviewsCusteffet:(NSString *)custEffet;
+ (void)signViewCusteffet:(NSString *)custEffet;
- (void)showCusteffet:(NSString *)custEffet;
- (void)dismissCusteffet:(NSString *)custEffet;
- (void)signButtonAction:(UIButton *)button custEffet:(NSString *)custEffet;
- (void)previousButtonActionCusteffet:(NSString *)custEffet;
- (void)nextButtonActionCusteffet:(NSString *)custEffet;
- (void)minimumDateForCalendar:(FSCalendar *)calendar custEffet:(NSString *)custEffet;
- (void)maximumDateForCalendar:(FSCalendar *)calendar custEffet:(NSString *)custEffet;
- (void)calendar:(FSCalendar *)calendar imageForDate:(NSDate *)date custEffet:(NSString *)custEffet;
- (void)calendar:(FSCalendar *)calendar shouldSelectDate:(NSDate *)date atMonthPosition:(FSCalendarMonthPosition)monthPosition custEffet:(NSString *)custEffet;
- (void)setSeletedDates:(NSArray<NSDate *> *)dates custEffet:(NSString *)custEffet;

@end
