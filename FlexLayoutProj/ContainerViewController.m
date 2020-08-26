//
//  ContainerViewController.m
//  FlexLayoutProj
//
//  Created by liujiang on 2020/8/26.
//

#import "ContainerViewController.h"

@interface ContainerViewController ()
{
    UIView *_contentView;
    NSArray *childVCNames;
    NSInteger selectIndex;
}
@end

@implementation ContainerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    for (int i = 0; i < childVCNames.count; i++) {
        if (NSClassFromString(childVCNames[i])) {
            UIViewController *child = NSClassFromString(childVCNames[i]).new;
            [self addChildViewController:child];
            selectIndex = MIN(childVCNames.count-1, selectIndex);
            if (i == selectIndex) {
                child.view.frame = CGRectMake(0, 0, CGRectGetWidth([UIScreen mainScreen].bounds), CGRectGetHeight([UIScreen mainScreen].bounds)-([UIApplication sharedApplication].statusBarFrame.size.height > 20 ? 83 : 49));
                [_contentView addSubview:child.view];
                [child didMoveToParentViewController:self];
            }
        }
    }
}
FLEXSET(childNames)
{
    childVCNames = [sValue componentsSeparatedByString:@"/"];
   
}
FLEXSET(selectAtIndex) {
    selectIndex = MAX(0,[sValue integerValue]);
}
- (UIEdgeInsets)getSafeArea:(BOOL)portrait {
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

- (void)tabBar:(UIView *)tabBar didClickAt:(NSInteger)index {
    if (index < self.childViewControllers.count && index != selectIndex) {
        UIViewController *child = self.childViewControllers[index];
        child.view.frame = CGRectMake(0, 0, CGRectGetWidth([UIScreen mainScreen].bounds), CGRectGetHeight([UIScreen mainScreen].bounds)-([UIApplication sharedApplication].statusBarFrame.size.height > 20 ? 83 : 49));
        [UIView transitionFromView:self.childViewControllers[selectIndex].view toView:child.view duration:0.25 options:UIViewAnimationOptionTransitionCrossDissolve completion:^(BOOL finished) {
            [_contentView addSubview:child.view];
            [child didMoveToParentViewController:self];
            selectIndex = index;
        }];
    }
}
@end
