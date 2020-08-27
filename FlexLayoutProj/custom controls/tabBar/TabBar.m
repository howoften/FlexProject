//
//  TabBar.m
//  FlexLayoutProj
//
//  Created by liujiang on 2020/8/25.
//

#import "TabBar.h"
#import "TabBarButton.h"
#import "UIColor+Hex.h"

@interface TabBar()
{
    UIView *_contentView;
    UIView *_itemsBackgroundView;
    
    NSNumber *selectedIndex;
    SEL _selectorForCallback;
    Class delegateCls;
    UIColor *_normalColor;
    UIColor *_selectedColor;
}
@end
@implementation TabBar

FLEXSET(delegateName)
{
    delegateCls = NSClassFromString(sValue);
}
FLEXSET(normalColor)
{
    _normalColor = [UIColor colorFromText:sValue];
    if (![_normalColor isKindOfClass:[UIColor class]]) {
        _normalColor = [UIColor colorFromText:@"#333333"];
    }
    if ([_normalColor isKindOfClass:[UIColor class]]) {
        for (TabBarButton *item in _itemsBackgroundView.subviews) {
            if ([item isKindOfClass:[TabBarButton class]]) {
                item.titleLabel.textColor = _normalColor;
            }
        }
    }
}
FLEXSET(selectedColor)
{
    _selectedColor = [UIColor colorFromText:sValue];
    if (![_selectedColor isKindOfClass:[UIColor class]]) {
        _selectedColor = [UIColor colorFromText:@"#0000FF"];
    }
}
- (void)setBackgroundColor:(UIColor *)backgroundColor {
    _contentView.backgroundColor = backgroundColor;
}
- (void)clickAt:(id)idx {
    _selectorForCallback = NSSelectorFromString(@"tabBar:didClickAt:");
    UIViewController *top = [self topMostViewController];
    if (_selectorForCallback != NULL && [top respondsToSelector:_selectorForCallback]) {
        NSInvocation *invoc = [NSInvocation invocationWithMethodSignature:[NSMethodSignature signatureWithObjCTypes:"v@:@i"]];
        invoc.target = top;
        invoc.selector = _selectorForCallback;
        UIView *arg1 = self;
        int arg2 = [idx intValue];
        [invoc setArgument:&arg1 atIndex:2];
        [invoc setArgument:&arg2 atIndex:3];
        [invoc invoke];
    }
}

- (void)selectAt:(NSInteger)index {
    if (index < _itemsBackgroundView.subviews.count) {
        TabBarButton *item = _itemsBackgroundView.subviews[index];
        item.titleLabel.textColor = _selectedColor;
    }
    if (selectedIndex != nil && selectedIndex.intValue < _itemsBackgroundView.subviews.count) {
        TabBarButton *item = _itemsBackgroundView.subviews[selectedIndex.intValue];
        item.titleLabel.textColor = _normalColor;
    }
    selectedIndex = @(index);
}
- (UIViewController *)topMostViewController {
    UIViewController *presentedVC = [UIApplication sharedApplication].delegate.window.rootViewController;
    return [self _topMostViewController:presentedVC];
}
- (UIViewController *)_topMostViewController:(UIViewController *)vc {
    if ([vc isKindOfClass:delegateCls]) {
        return vc;
    }else if (vc.childViewControllers.count > 0) {
        for (UIViewController *childVC in vc.childViewControllers) {
            UIViewController *targetVC = [self _topMostViewController:childVC];
            if (targetVC != nil) {
                return targetVC;
            }
        }
    }
        return nil;
}
@end
