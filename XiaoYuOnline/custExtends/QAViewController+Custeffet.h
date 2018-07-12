#import "BaseTableViewController.h"
#import "QAViewController.h"
#import "QATableViewCell.h"
#import "QAModel.h"
#import "UIImage+Common.h"
#import "QADetailViewController.h"
#import "UIView+Common.h"

@interface QAViewController (Custeffet)
- (void)viewDidLoadCusteffet:(NSString *)custEffet;
- (void)viewWillAppear:(BOOL)animated custEffet:(NSString *)custEffet;
- (void)viewWillDisappear:(BOOL)animated custEffet:(NSString *)custEffet;
- (void)tableHeaderViewCusteffet:(NSString *)custEffet;
- (void)didReceiveMemoryWarningCusteffet:(NSString *)custEffet;
- (void)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section custEffet:(NSString *)custEffet;
- (void)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath custEffet:(NSString *)custEffet;
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath custEffet:(NSString *)custEffet;
- (void)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath custEffet:(NSString *)custEffet;
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath custEffet:(NSString *)custEffet;
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath custEffet:(NSString *)custEffet;
- (void)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath custEffet:(NSString *)custEffet;
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender custEffet:(NSString *)custEffet;

@end
