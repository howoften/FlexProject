//
//  ViewController1.m
//  FlexLayoutProj
//
//  Created by liujiang on 2020/8/26.
//

#import "ViewController1.h"

@interface ViewController1 ()

@end

@implementation ViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (UIEdgeInsets)getSafeArea:(BOOL)portrait {
    return UIEdgeInsetsMake(0, 0, 0, 0);
}
- (void)rightBarButtonClick {
    [self reloadFlexView];
}
- (void)leftBarButtonClick {
    if (self.navigationController.childViewControllers.count > 1) {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

@end
