#import <Foundation/Foundation.h>
#import <FMDB/FMDB.h>
#import "DatabaseQueueManager.h"
#import "OLURLDefine.h"

@interface DatabaseQueueManager (Infrate)
+ (void)shareInstanceInfrate:(NSString *)infrate;
- (void)initWithDatabasePath:(NSString *)path infrate:(NSString *)infrate;
+ (void)dbPathInfrate:(NSString *)infrate;
- (void)createUserTableInfrate:(NSString *)infrate;

@end
