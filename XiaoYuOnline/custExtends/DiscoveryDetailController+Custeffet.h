#import "BaseViewController.h"
#import "DiscoveryDetailController.h"
#import "TextInfoViewCell.h"
#import "ImageInfoViewCell.h"
#import "DiscoveryModel.h"
#import "DiscoveryDetailModel.h"
#import <UIImageView+WebCache.h>
#import "NSString+Common.h"

@interface DiscoveryDetailController (Custeffet)
- (void)initWithDiscoveryModel:(DiscoveryModel *)discoveryModel custEffet:(NSString *)custEffet;
- (void)viewDidLoadCusteffet:(NSString *)custEffet;
- (void)loadUIContentCusteffet:(NSString *)custEffet;
- (void)tableHeaderViewCusteffet:(NSString *)custEffet;
- (void)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section custEffet:(NSString *)custEffet;
- (void)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath custEffet:(NSString *)custEffet;
- (void)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath custEffet:(NSString *)custEffet;
- (void)didReceiveMemoryWarningCusteffet:(NSString *)custEffet;
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender custEffet:(NSString *)custEffet;

@end
