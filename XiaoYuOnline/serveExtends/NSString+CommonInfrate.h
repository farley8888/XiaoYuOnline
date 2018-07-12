#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIKit.h>
#import "NSString+Common.h"
#import <CommonCrypto/CommonDigest.h>

@interface NSString (CommonInfrate)
- (void)ignoreHTMLSpecialStringInfrate:(NSString *)infrate;
- (void)md5Infrate:(NSString *)infrate;
- (void)sha1Infrate:(NSString *)infrate;
- (void)isEmailInfrate:(NSString *)infrate;
- (void)isMobileInfrate:(NSString *)infrate;
- (void)isWhitespaceAndNewlinesInfrate:(NSString *)infrate;
- (void)ageInfrate:(NSString *)infrate;
- (void)phoneModelInfrate:(NSString *)infrate;
- (void)stringSizeWithFont:(UIFont *)font restrictWidth:(CGFloat)width restrictHeight:(CGFloat)height infrate:(NSString *)infrate;
- (void)stringHeightWithFont:(UIFont *)font restrictWidth:(CGFloat)width infrate:(NSString *)infrate;
- (void)stringWidthWithFont:(UIFont *)font restrictHeight:(CGFloat)height infrate:(NSString *)infrate;
- (void)stringWidthWithAttribute:(NSDictionary *)attribute restrictHeight:(CGFloat)height infrate:(NSString *)infrate;
- (void)stringHeightWithAttribute:(NSDictionary *)attribute restrictWidth:(CGFloat)width infrate:(NSString *)infrate;
- (void)attributeWithFont:(UIFont *)font color:(UIColor *)color lineSpace:(CGFloat)lineSpace infrate:(NSString *)infrate;

@end
