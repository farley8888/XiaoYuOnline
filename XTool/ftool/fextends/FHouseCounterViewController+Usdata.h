#import "FBaseViewController.h"
#import "FHouseCounterViewController.h"
#import "SPPageMenu.h"
#import "FHouseCounterSimpleViewController.h"
#import "FHouseCounterHybirdViewController.h"

@interface FHouseCounterViewController (Usdata)
- (void)viewDidLoadUsdata:(NSString *)usData;
- (void)initViewUsdata:(NSString *)usData;
- (void)myChildViewControllersUsdata:(NSString *)usData;
- (void)pageMenu:(SPPageMenu *)pageMenu itemSelectedFromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex usData:(NSString *)usData;
- (void)didReceiveMemoryWarningUsdata:(NSString *)usData;

@end
