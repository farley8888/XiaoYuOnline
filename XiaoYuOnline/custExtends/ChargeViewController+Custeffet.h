#import "SettingRealNameController.h"
#import "RealNameModel.h"
#import "ChargeViewController.h"
#import "RealNameTableViewCell.h"
#import "ChargeWithdrawViewCell.h"
#import "CompleteViewController.h"
#import "SettingRealNameController.h"
#import "BindCardViewController.h"
#import "UIViewController+ShowTextHUD.h"
#import "NSString+Common.h"
#import <FUMobilePay/FUMobilePay.h>

@interface ChargeViewController (Custeffet)
- (void)viewDidLoadCusteffet:(NSString *)custEffet;
- (void)tableFooterViewCusteffet:(NSString *)custEffet;
- (void)viewDidAppear:(BOOL)animated custEffet:(NSString *)custEffet;
- (void)didReceiveMemoryWarningCusteffet:(NSString *)custEffet;
- (void)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath custEffet:(NSString *)custEffet;
- (void)textFieldValueChangedCusteffet:(NSString *)custEffet;
- (void)operateButtonAction:(UIButton *)button custEffet:(NSString *)custEffet;
- (void)chargeWithBankNum:(NSString *)bankNum value:(NSString *)value tradePassword:(NSString *)tradePassword orderID:(NSString *)orderId custEffet:(NSString *)custEffet;
- (void)payCallBack:(BOOL)success responseParams:(NSDictionary *)responseParams custEffet:(NSString *)custEffet;
- (void)fuWeiXinPayCallBackWithResponseParams:(NSDictionary*) responseParams custEffet:(NSString *)custEffet;

@end
