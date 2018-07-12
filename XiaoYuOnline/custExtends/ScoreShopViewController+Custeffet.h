#import "ClearNavViewController.h"
#import "ScoreShopViewController.h"
#import "SocreShopHeader.h"
#import "ScoreShopTableViewCell.h"
#import <YYKit/NSDictionary+YYAdd.h>
#import "SVPullToRefresh.h"
#import "ScoreModel.h"

@interface ScoreShopViewController (Custeffet)
- (void)initCusteffet:(NSString *)custEffet;
- (void)viewDidLoadCusteffet:(NSString *)custEffet;
- (void)loadTableDataRefresh:(BOOL)isRefresh custEffet:(NSString *)custEffet;
- (void)viewDidLayoutSubviewsCusteffet:(NSString *)custEffet;
- (void)viewDidAppear:(BOOL)animated custEffet:(NSString *)custEffet;
- (void)didLoadDataCount:(NSInteger)count custEffet:(NSString *)custEffet;
- (void)preferredStatusBarStyleCusteffet:(NSString *)custEffet;
- (void)numberOfSectionsInTableView:(UITableView *)tableView custEffet:(NSString *)custEffet;
- (void)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section custEffet:(NSString *)custEffet;
- (void)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath custEffet:(NSString *)custEffet;
- (void)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section custEffet:(NSString *)custEffet;
- (void)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section custEffet:(NSString *)custEffet;
- (void)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath custEffet:(NSString *)custEffet;
- (void)didReceiveMemoryWarningCusteffet:(NSString *)custEffet;
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender custEffet:(NSString *)custEffet;

@end
