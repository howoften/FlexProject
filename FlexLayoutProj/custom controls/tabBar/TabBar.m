//
//  TabBar.m
//  FlexLayoutProj
//
//  Created by liujiang on 2020/8/25.
//

#import "TabBar.h"

@interface TabBar()
{
    UIView *_contentView;
    UIView *firstItem;
    SEL _selectorForCallback;
    Class delegateCls;
}
@end
@implementation TabBar

FLEXSET(delegateName)
{
    delegateCls = NSClassFromString(sValue);
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
