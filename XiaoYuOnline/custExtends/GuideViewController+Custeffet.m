#import "GuideViewController+Custeffet.h"
@implementation GuideViewController (Custeffet)
- (void)viewDidLoadCusteffet:(NSString *)custEffet {
    NSLog(@"%@", custEffet);
}
- (void)buttonActionCusteffet:(NSString *)custEffet {
    NSLog(@"%@", custEffet);
}
- (void)didReceiveMemoryWarningCusteffet:(NSString *)custEffet {
    NSLog(@"%@", custEffet);
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender custEffet:(NSString *)custEffet {
    NSLog(@"%@", custEffet);
}

@end
