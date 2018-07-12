//
//  NSString+Common.m
//  LesTa
//
//  Created by Well on 15/3/3.
//  Copyright (c) 2015年 William. All rights reserved.
//

#import "NSString+Common.h"
#import <CommonCrypto/CommonDigest.h>
#import "NSString+CommonInfrate.h"
#include <sys/types.h>
#include <sys/sysctl.h>

@implementation NSString (Common)

- (NSString *)ignoreHTMLSpecialString
{
    NSString *returnStr = [self stringByReplacingOccurrencesOfString:@"\r" withString:@""];
    returnStr = [returnStr stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    returnStr = [returnStr stringByReplacingOccurrencesOfString:@"\t" withString:@""];
    returnStr = [returnStr stringByReplacingOccurrencesOfString:@"&lt;" withString:@""];
    returnStr = [returnStr stringByReplacingOccurrencesOfString:@"&gt;" withString:@">"];
    returnStr = [returnStr stringByReplacingOccurrencesOfString:@"&lt;" withString:@"<"];
    returnStr = [returnStr stringByReplacingOccurrencesOfString:@"&amp;" withString:@"&"];
    returnStr = [returnStr stringByReplacingOccurrencesOfString:@"&nbsp;" withString:@" "];
    returnStr = [returnStr stringByReplacingOccurrencesOfString:@" " withString:@""];
    // 如果还有别的特殊字符，请添加在这里
    // ...
    /*
     returnStr = [returnStr stringByReplacingOccurrencesOfString:@"&ge;" withString:@"—"];
     returnStr = [returnStr stringByReplacingOccurrencesOfString:@"&mdash;" withString:@"®"];
     returnStr = [returnStr stringByReplacingOccurrencesOfString:@"&ldquo;" withString:@"“"];
     returnStr = [returnStr stringByReplacingOccurrencesOfString:@"&rdquo;" withString:@"”"];
     returnStr = [returnStr stringByReplacingOccurrencesOfString:@"&quot;" withString:@"\""];
     */
    
    return returnStr;
}

- (NSString *)md5
{
    const char *cStr = [self UTF8String];
    unsigned char result[16];
    CC_MD5(cStr, strlen(cStr), result); // This is the md5 call
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

- (NSString*) sha1
{
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    
    CC_SHA1(data.bytes, (unsigned int)data.length, digest);
    
    NSMutableString* output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    
    return output;
}

- (BOOL)isEmail
{
    NSString *mailString = @"^([0-9a-zA-Z]+[-._+&])*[0-9a-zA-Z]+@([0-9a-zA-Z-]+[.])+[a-zA-Z]{2,6}$";
    NSPredicate *emailPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", mailString];
    BOOL isFlag = [emailPredicate evaluateWithObject:self];
    return isFlag;
}

- (BOOL)isMobile
{
    NSRange r;
    NSString *regEx = @"^0{0,1}(13[0-9]|15[0-9]|18[0-9])[0-9]{8}$";
    r = [self rangeOfString:regEx options:NSRegularExpressionSearch];
    BOOL isMacthed = NO;
    if (r.location != NSNotFound)
    {
        isMacthed = YES;
    }
    
    return isMacthed;
}

- (BOOL)isWhitespaceAndNewlines
{
    NSCharacterSet* whitespace = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    for (NSInteger i = 0; i < self.length; ++i)
    {
        unichar c = [self characterAtIndex:i];
        if (![whitespace characterIsMember:c])
        {
            return NO;
        }
    }
    return YES;
}

- (NSString *)age
{
    if (self && ![self isEqualToString:@""]) {
        NSDate *date = [NSDate date];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd"];
        NSString *nowDate = [dateFormatter stringFromDate:date];
        
        if ([self compare:nowDate] == NSOrderedDescending) {
            return @"0岁";
        }
        
        NSArray *dateNow = [nowDate componentsSeparatedByString:@"-"];
        int yearNow = [[dateNow objectAtIndex:0] intValue];
        int monthNow = [[dateNow objectAtIndex:1] intValue];
        int dayNow = [[dateNow objectAtIndex:2] intValue];
        
        NSArray *birthday = [self componentsSeparatedByString:@"-"];
        int yearBirth = [[birthday objectAtIndex:0] intValue];
        int monthBirth = [[birthday objectAtIndex:1] intValue];
        int dayBirth = [[birthday objectAtIndex:2] intValue];
        
        int age = yearNow - yearBirth;
        
        if (monthNow <= monthBirth) {
            if (monthNow == monthBirth) {
                //monthNow==monthBirth
                if (dayNow < dayBirth) {
                    age--;
                } else {
                    //do nothing
                }
            } else {
                //monthNow>monthBirth
                age--;
            }
        } else {
            //monthNow<monthBirth
            //donothing
        }
        return [NSString stringWithFormat:@"%d岁",age];
    }
    
    return @"0岁";
}

- (void)phoneModel
{
    //手机型号。
    size_t size;
    sysctlbyname("hw.machine", NULL, &size, NULL, 0);
    char *machine = (char*)malloc(size);
    sysctlbyname("hw.machine", machine, &size, NULL, 0);
}

#pragma mark -StringSizeCalculate

- (CGSize)stringSizeWithFont:(UIFont *)font restrictWidth:(CGFloat)width restrictHeight:(CGFloat)height
{
    if (!self) {
        return CGSizeZero;
    }
    
    CGSize strSize = [self boundingRectWithSize:CGSizeMake(width, height)
                                        options:NSStringDrawingUsesLineFragmentOrigin
                                     attributes:@{NSFontAttributeName:font}
                                        context:nil].size;
    return strSize;
}

- (CGFloat)stringHeightWithFont:(UIFont *)font restrictWidth:(CGFloat)width
{
    if (!self) {
        return CGFLOAT_MIN;
    }
    
    CGSize size = [self stringSizeWithFont:font restrictWidth:width restrictHeight:MAXFLOAT];
    
    // Sometime here a error value
    return size.height+1;
}

- (CGFloat)stringWidthWithFont:(UIFont *)font restrictHeight:(CGFloat)height
{
    if (!self) {
        return CGFLOAT_MIN;
    }
    
    CGSize size = [self stringSizeWithFont:font restrictWidth:MAXFLOAT restrictHeight:height];
    return size.width + 1;
}

- (CGFloat)stringWidthWithAttribute:(NSDictionary *)attribute restrictHeight:(CGFloat)height
{
    if (!self) {
        return CGFLOAT_MIN;
    }
    
    NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSString *realString = [self stringByTrimmingCharactersInSet:set];
    if (!realString.length) {
        return CGFLOAT_MIN;
    }
    
    CGSize strSize = [self boundingRectWithSize:CGSizeMake(MAXFLOAT, height)
                                        options:NSStringDrawingUsesLineFragmentOrigin
                                     attributes:attribute
                                        context:nil].size;
    return strSize.width + 1;
}

- (CGFloat)stringHeightWithAttribute:(NSDictionary *)attribute restrictWidth:(CGFloat)width
{
    if (!self) {
        return CGFLOAT_MIN;
    }
    
    NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSString *realString = [self stringByTrimmingCharactersInSet:set];
    if (!realString.length) {
        return CGFLOAT_MIN;
    }
    
    CGSize strSize = [self boundingRectWithSize:CGSizeMake(width, MAXFLOAT)
                                        options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading
                                     attributes:attribute
                                        context:nil].size;
    // Sometime here a error value
    return strSize.height+1;
}

- (NSDictionary *)attributeWithFont:(UIFont *)font color:(UIColor *)color lineSpace:(CGFloat)lineSpace
{
    if (!self) {
        return nil;
    }
    
    NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSString *realString = [self stringByTrimmingCharactersInSet:set];
    if (!realString.length) {
        return nil;
    }
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    [paragraphStyle setLineSpacing:lineSpace];
    
    NSDictionary *att =  @{NSFontAttributeName:font,
                           NSForegroundColorAttributeName:color,
                           NSParagraphStyleAttributeName:paragraphStyle};
    return att;
}

@end

@implementation NSString (NetworkEncryption)

+ (NSString *)appVersion
{
    NSDictionary *appInfo = [[NSBundle mainBundle] infoDictionary];
    NSString *version = [appInfo objectForKey:@"CFBundleShortVersionString"];
    return version;
}

@end

