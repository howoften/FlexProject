//
//  ViewController.m
//  FlexLayoutProj
//
//  Created by liujiang on 2020/8/19.
//

#import "ViewController.h"
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (UIEdgeInsets)getSafeArea:(BOOL)portrait {
    return UIEdgeInsetsMake(0, 0, 0, 0);
}
- (void)leftBarButtonClick {

}
- (void)rightBarButtonClick {
    [self reloadFlexView];
}
- (void)next {
    [self.navigationController pushViewController:NSClassFromString(@"ViewController1").new animated:YES];
}
@end

