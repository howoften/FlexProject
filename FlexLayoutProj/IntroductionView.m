//
//  IntroductionView.m
//  FlexLayoutProj
//
//  Created by liujiang on 2020/8/27.
//

#import "IntroductionView.h"
@class LoginViewController;
@implementation IntroductionView

- (UIEdgeInsets)safeAreaInsets {
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

- (void)signin {
    UIResponder *next = self;
    while (![next isKindOfClass:[UIViewController class]] && next != nil) {
        next = next.nextResponder;
    }
    if ([next isKindOfClass:[UIViewController class]]) {
        UIViewController *signin = [NSClassFromString(@"LoginViewController") new];
        signin.modalPresentationStyle = UIModalPresentationFullScreen;
        if ([(UIViewController *)next navigationController] != nil) {
            [[(UIViewController *)next navigationController] presentViewController:signin animated:YES completion:nil];
        }else {
            [(UIViewController *)next presentViewController:signin animated:YES completion:nil];
        }
        
    }
}

- (void)signup {
    
}
@end
