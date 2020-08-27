//
//  UIColor+Hex.m
//  FlexLayoutProj
//
//  Created by liujiang on 2020/8/27.
//

#import "UIColor+Hex.h"

@implementation UIColor (Hex)
+ (UIColor *)colorFromText:(NSString *)text {
    UIColor *color = [self colorFromHex:text];
    if (![color isKindOfClass:[UIColor class]]) {
        color = [self colorWithKey:text];
    }
    return color;
}
+ (UIColor *)colorFromHex:(NSString *)hexString {
    if (![hexString isKindOfClass:[NSString class]]) {
        return nil;
    }
    NSString *regex = @"^((0x)|(0X)|(#)|[0-9a-fA-F])[0-9a-fA-F]{5,6}$";
    if ([hexString rangeOfString:regex options:NSRegularExpressionSearch].location != NSNotFound) {
        if ([hexString hasPrefix:@"0x"]) {
            hexString = [hexString substringFromIndex:2];
        }else if ([hexString hasPrefix:@"0X"]) {
            hexString = [hexString substringFromIndex:2];
        }else if ([hexString hasPrefix:@"#"]) {
            hexString = [hexString substringFromIndex:1];
        }
    }
    if (hexString.length != 6) {
        return nil;
    }
    unsigned long r = strtoul([hexString substringWithRange:NSMakeRange(0, 2)].UTF8String, NULL, 16);
    unsigned long g = strtoul([hexString substringWithRange:NSMakeRange(2, 2)].UTF8String, NULL, 16);
    unsigned long b = strtoul([hexString substringWithRange:NSMakeRange(4, 2)].UTF8String, NULL, 16);
    return [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1];
}
+ (UIColor *)colorWithKey:(NSString *)key {
    if ([key caseInsensitiveCompare:@"red"] == NSOrderedSame) {
        return [UIColor redColor];
    }else if ([key caseInsensitiveCompare:@"black"] == NSOrderedSame) {
        return [UIColor blackColor];
    }else if ([key caseInsensitiveCompare:@"darkGray"] == NSOrderedSame) {
        return [UIColor darkGrayColor];
    }else if ([key caseInsensitiveCompare:@"lightGray"] == NSOrderedSame) {
        return [UIColor lightGrayColor];
    }else if ([key caseInsensitiveCompare:@"white"] == NSOrderedSame) {
        return [UIColor whiteColor];
    }else if ([key caseInsensitiveCompare:@"gray"] == NSOrderedSame) {
        return [UIColor grayColor];
    }else if ([key caseInsensitiveCompare:@"green"] == NSOrderedSame) {
        return [UIColor greenColor];
    }else if ([key caseInsensitiveCompare:@"blue"] == NSOrderedSame) {
        return [UIColor blueColor];
    }else if ([key caseInsensitiveCompare:@"cyan"] == NSOrderedSame) {
        return [UIColor cyanColor];
    }else if ([key caseInsensitiveCompare:@"yellow"] == NSOrderedSame) {
        return [UIColor yellowColor];
    }else if ([key caseInsensitiveCompare:@"magenta"] == NSOrderedSame) {
        return [UIColor magentaColor];
    }else if ([key caseInsensitiveCompare:@"orange"] == NSOrderedSame) {
        return [UIColor orangeColor];
    }else if ([key caseInsensitiveCompare:@"purple"] == NSOrderedSame) {
        return [UIColor purpleColor];
    }else if ([key caseInsensitiveCompare:@"brown"] == NSOrderedSame) {
        return [UIColor brownColor];
    }else if ([key caseInsensitiveCompare:@"clear"] == NSOrderedSame) {
        return [UIColor clearColor];
    }
    return nil;
}
@end
