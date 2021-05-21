//
//  AppDelegate.m
//  KkChat
//
//  Created by 张安康 on 2021/5/21.
//

#import "AppDelegate.h"
#import "KKDefaultViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  
    [self setRootViewController];
    
    return YES;
}

#pragma mark - 设置根视图
-(void)setRootViewController{
    CGRect bounds = [UIScreen mainScreen].bounds;
    self.window = [[UIWindow alloc] initWithFrame:bounds];
    [self.window makeKeyAndVisible];
    KKDefaultViewController *rootVc = [[KKDefaultViewController alloc] init];
    self.window.rootViewController = rootVc;
}
@end
