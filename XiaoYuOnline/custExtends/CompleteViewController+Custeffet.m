#import "CompleteViewController+Custeffet.h"
@implementation CompleteViewController (Custeffet)
- (void)initWithImage:(UIImage *)image title:(NSString *)title custEffet:(NSString *)custEffet {
    NSLog(@"%@", custEffet);
}
- (void)viewDidLoadCusteffet:(NSString *)custEffet {
    NSLog(@"%@", custEffet);
}
- (void)competeButtonAction:(UIButton *)button custEffet:(NSString *)custEffet {
    NSLog(@"%@", custEffet);
}
- (void)didReceiveMemoryWarningCusteffet:(NSString *)custEffet {
    NSLog(@"%@", custEffet);
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender custEffet:(NSString *)custEffet {
    NSLog(@"%@", custEffet);
}

@end
