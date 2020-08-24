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
//    FlexSetPreviewBaseUrl(@"")
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
//    UITabBarController *rootController = [[UITabBarController alloc] init];
//    NSArray *viewTitles = @[@""];
//    [rootController ]
//
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:NSClassFromString(@"ViewController").new];
    [self.window makeKeyAndVisible];
    [[UINavigationBar appearance] setHidden:YES];
    return YES;
}

@end
