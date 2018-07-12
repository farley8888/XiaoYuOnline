#import "BaseInfoModel.h"
#import "TradeDetailModel.h"
#import "TradeRecoderModel.h"

@interface TradeDetailModel (Custeffet)
+ (void)tradeDatasourceListWithTradeModel:(TradeRecoderModel *)model custEffet:(NSString *)custEffet;

@end
