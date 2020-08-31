//
//  NavigationBar.m
//  FlexLayoutProj
//
//  Created by liujiang on 2020/8/20.
//

#import "NavigationBar.h"
#import <FlexHttpVC.h>
#import <FlexUtils.h>
@interface NavigationBar()
{
    UILabel *_titleLabel;
    UIButton *_leftItem;
    UIButton *_rightItem;
    UIView *_bottomLine;
    UIView *_contentView;
    SEL _selectorForLeftButton;
    SEL _selectorForRightButton;
}
@end
@implementation NavigationBar

FLEXSET(title)
{
    _titleLabel.text = sValue;
}
FLEXSET(titleFont)
{
    if ([sValue isKindOfClass:[NSString class]]) {
        NSArray *splitArr = [sValue componentsSeparatedByString:@"|"];
        if (splitArr.count == 2 && [splitArr.lastObject floatValue] > 0) {
            UIFontWeight weight = 0;
            if ([splitArr.firstObject caseInsensitiveCompare:@"light"] == NSOrderedSame) {
                weight = UIFontWeightLight;
            }else if ([splitArr.firstObject caseInsensitiveCompare:@"thin"] == NSOrderedSame) {
                weight = UIFontWeightThin;
            }else if ([splitArr.firstObject caseInsensitiveCompare:@"regular"] == NSOrderedSame) {
                weight = UIFontWeightRegular;
            }else if ([splitArr.firstObject caseInsensitiveCompare:@"medium"] == NSOrderedSame) {
                weight = UIFontWeightMedium;
            }else if ([splitArr.firstObject caseInsensitiveCompare:@"bold"] == NSOrderedSame) {
                weight = UIFontWeightBold;
            }else if ([splitArr.firstObject caseInsensitiveCompare:@"heavy"] == NSOrderedSame) {
                weight = UIFontWeightHeavy;
            }else if ([splitArr.firstObject caseInsensitiveCompare:@"black"] == NSOrderedSame) {
                weight = UIFontWeightBlack;
            }
            _titleLabel.font = [UIFont systemFontOfSize:[splitArr.lastObject floatValue] weight:weight];
        }else if (splitArr.count == 1 && [splitArr.lastObject floatValue] > 0) {
            _titleLabel.font = [UIFont systemFontOfSize:[splitArr.lastObject floatValue] weight:UIFontWeightRegular];
        }
    }
}
FLEXSET(rightButtonTitle)
{
    if ([sValue hasPrefix:@"\""] || [sValue hasPrefix:@"'"]) {
        sValue = [sValue substringFromIndex:1];
    }
    if ([sValue hasSuffix:@"\""] || [sValue hasSuffix:@"'"]) {
        sValue = [sValue substringToIndex:sValue.length-1];
    }
    if ([sValue length] < 1) {
        [_rightItem setTitle:nil forState:UIControlStateNormal];
        _rightItem.userInteractionEnabled = NO;
        return;
    }
    [_rightItem setTitle:sValue forState:UIControlStateNormal];
    _rightItem.userInteractionEnabled = YES;
}
FLEXSET(rightButtonTitleFont)
{
    if ([sValue isKindOfClass:[NSString class]]) {
        NSArray *splitArr = [sValue componentsSeparatedByString:@"|"];
        if (splitArr.count == 2 && [splitArr.lastObject floatValue] > 0) {
            UIFontWeight weight = 0;
            if ([splitArr.firstObject caseInsensitiveCompare:@"light"] == NSOrderedSame) {
                weight = UIFontWeightLight;
            }else if ([splitArr.firstObject caseInsensitiveCompare:@"thin"] == NSOrderedSame) {
                weight = UIFontWeightThin;
            }else if ([splitArr.firstObject caseInsensitiveCompare:@"regular"] == NSOrderedSame) {
                weight = UIFontWeightRegular;
            }else if ([splitArr.firstObject caseInsensitiveCompare:@"medium"] == NSOrderedSame) {
                weight = UIFontWeightMedium;
            }else if ([splitArr.firstObject caseInsensitiveCompare:@"bold"] == NSOrderedSame) {
                weight = UIFontWeightBold;
            }else if ([splitArr.firstObject caseInsensitiveCompare:@"heavy"] == NSOrderedSame) {
                weight = UIFontWeightHeavy;
            }else if ([splitArr.firstObject caseInsensitiveCompare:@"black"] == NSOrderedSame) {
                weight = UIFontWeightBlack;
            }
            [_rightItem.titleLabel setFont: [UIFont systemFontOfSize:[splitArr.lastObject floatValue] weight:weight]];
        }else if (splitArr.count == 1 && [splitArr.lastObject floatValue] > 0) {
            [_rightItem.titleLabel setFont: [UIFont systemFontOfSize:[splitArr.lastObject floatValue] weight:UIFontWeightRegular]];
        }
    }
}
FLEXSET(rightButtonBGImage)
{
    [_rightItem setBackgroundImage:[UIImage imageNamed:sValue] forState:UIControlStateNormal];
}
FLEXSET(pressAtRightBarButton) {
    _selectorForRightButton = NSSelectorFromString(sValue);
    
}
FLEXSET(leftButtonBGImage)
{
    [_leftItem setBackgroundImage:[UIImage imageNamed:sValue] forState:UIControlStateNormal];
}
FLEXSET(leftButtonTitle)
{
    if ([sValue hasPrefix:@"\""] || [sValue hasPrefix:@"'"]) {
        sValue = [sValue substringFromIndex:1];
    }
    if ([sValue hasSuffix:@"\""] || [sValue hasSuffix:@"'"]) {
        sValue = [sValue substringToIndex:sValue.length-1];
    }
    if ([sValue length] < 1) {
        [_leftItem setTitle:nil forState:UIControlStateNormal];
        _leftItem.userInteractionEnabled = NO;
        return;
    }
    [_leftItem setTitle:sValue forState:UIControlStateNormal];
    _leftItem.userInteractionEnabled = YES;
}
FLEXSET(leftButtonTitleFont)
{
    if ([sValue isKindOfClass:[NSString class]]) {
        NSArray *splitArr = [sValue componentsSeparatedByString:@"|"];
        if (splitArr.count == 2 && [splitArr.lastObject floatValue] > 0) {
            UIFontWeight weight = 0;
            if ([splitArr.firstObject caseInsensitiveCompare:@"light"] == NSOrderedSame) {
                weight = UIFontWeightLight;
            }else if ([splitArr.firstObject caseInsensitiveCompare:@"thin"] == NSOrderedSame) {
                weight = UIFontWeightThin;
            }else if ([splitArr.firstObject caseInsensitiveCompare:@"regular"] == NSOrderedSame) {
                weight = UIFontWeightRegular;
            }else if ([splitArr.firstObject caseInsensitiveCompare:@"medium"] == NSOrderedSame) {
                weight = UIFontWeightMedium;
            }else if ([splitArr.firstObject caseInsensitiveCompare:@"bold"] == NSOrderedSame) {
                weight = UIFontWeightBold;
            }else if ([splitArr.firstObject caseInsensitiveCompare:@"heavy"] == NSOrderedSame) {
                weight = UIFontWeightHeavy;
            }else if ([splitArr.firstObject caseInsensitiveCompare:@"black"] == NSOrderedSame) {
                weight = UIFontWeightBlack;
            }
            [_leftItem.titleLabel setFont: [UIFont systemFontOfSize:[splitArr.lastObject floatValue] weight:weight]];
        }else if (splitArr.count == 1 && [splitArr.lastObject floatValue] > 0) {
            [_leftItem.titleLabel setFont: [UIFont systemFontOfSize:[splitArr.lastObject floatValue] weight:UIFontWeightRegular]];
        }
    }
}
FLEXSET(pressAtLeftBarButton) {
    _selectorForLeftButton = NSSelectorFromString(sValue);
  
}
FLEXSET(showShadowLine) {
    if ([sValue isEqualToString:@"false"]) {
        _bottomLine.backgroundColor = self.backgroundColor;
    }else {
        _bottomLine.backgroundColor = [UIColor blackColor];
    }
}
- (void)leftButtonClick {
    UIViewController *top = [self topMostViewController];
    if (_selectorForLeftButton != NULL && [top respondsToSelector:_selectorForLeftButton]) {
        NSInvocation *invoc = [NSInvocation invocationWithMethodSignature:[NSMethodSignature signatureWithObjCTypes:"v@:"]];
        invoc.target = top;
        invoc.selector = _selectorForLeftButton;
        [invoc invoke];
    }

}
- (void)rightButtonClick {
    UIViewController *top = [self topMostViewController];
    if (_selectorForRightButton != NULL && [top respondsToSelector:_selectorForRightButton]) {
        NSInvocation *invoc = [NSInvocation invocationWithMethodSignature:[NSMethodSignature signatureWithObjCTypes:"v@:"]];
        invoc.target = top;
        invoc.selector = _selectorForRightButton;
        [invoc invoke];
    }
}
- (void)setBackgroundColor:(UIColor *)backgroundColor {
    _contentView.backgroundColor = backgroundColor;
}

- (UIViewController *)topVC {
    UIViewController *presentedVC = [UIApplication sharedApplication].delegate.window.rootViewController;
    while (presentedVC.presentedViewController != nil) {
        presentedVC = presentedVC.presentedViewController;
    }
    return presentedVC;
}

- (UIViewController *)topMostViewController {
    UIViewController *presentedVC = [UIApplication sharedApplication].delegate.window.rootViewController;
    return [self _topMostViewController:presentedVC];
}
- (UIViewController *)_topMostViewController:(UIViewController *)vc {
    int viewLevel = -1;
    UIViewController *topVC = nil;
    if ([vc childViewControllers].count > 0) {
        for (UIViewController *child in vc.childViewControllers) {
            if ([child.view isDescendantOfView:vc.view]) {
                int level = [child.view.superview.subviews indexOfObject:child.view];
                if (level > viewLevel) {
                    viewLevel = level;
                    topVC = child;
                }
            }
        }
        if (topVC != nil) {
            return [self _topMostViewController:topVC];
        }
    }else if ([vc isKindOfClass:[UIViewController class]]) {
        return vc;
    }
    
        return nil;
}
@end
