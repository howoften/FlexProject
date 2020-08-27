//
//  UIColor+Hex.h
//  FlexLayoutProj
//
//  Created by liujiang on 2020/8/27.
//

#import <UIKit/UIKit.h>

@interface UIColor (Hex)
+ (UIColor *)colorFromText:(NSString *)text;

+ (UIColor *)colorFromHex:(NSString *)hexString;
+ (UIColor *)colorWithKey:(NSString *)key;
@end
