//
//  AppDelegate.m
//  FlexLayoutProj
//
//  Created by liujiang on 2020/8/19.
//

#import "AppDelegate.h"
#import <FlexLib/FlexNode.h>
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    FlexRestorePreviewSetting();
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
//
    UINavigationController *rootVC = [[UINavigationController alloc] initWithRootViewController:NSClassFromString(@"ContainerViewController").new];
//    [rootVC addChildViewController:NSClassFromString(@"ViewController").new];
    self.window.rootViewController = rootVC;
    [self.window makeKeyAndVisible];
    [[UINavigationBar appearance] setHidden:YES];
    return YES;
}

@end
