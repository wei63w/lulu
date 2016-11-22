//
//  AppDelegate.m
//  lulu
//
//  Created by genilex3 on 16/11/1.
//  Copyright © 2016年 wei63w. All rights reserved.
//

#import "AppDelegate.h"
#import <CocoaLumberjack/CocoaLumberjack.h>
#import <MMDrawerController.h>
#import "WYCTabBarViewController.h"
#import "EMSDK.h"
#import "EaseUI.h"

#import "LoginViewController.h"

@interface AppDelegate ()

@property (nonatomic, strong) MMDrawerController *drawerController;
@property (nonatomic, strong) WYCTabBarViewController *tabBar;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];// [[UIApplication sharedApplication] keyWindow];
    
    UIStoryboard *loginsb = [UIStoryboard storyboardWithName:@"LoginViewController" bundle:nil];
    UIViewController *loginvc = loginsb.instantiateInitialViewController;
    [self.window setRootViewController:loginvc];
    [self.window makeKeyAndVisible];
    
    
    
    
    
    
    
//    self.tabBar = [[WYCTabBarViewController alloc]init];
//    
//
//    UIStoryboard *leftDrawersb = [UIStoryboard storyboardWithName:@"leftDrawerViewController" bundle:nil];
//    UIViewController *leftDrawer = leftDrawersb.instantiateInitialViewController;
//    
//
//    _drawerController = [[MMDrawerController alloc]initWithCenterViewController:self.tabBar leftDrawerViewController:leftDrawer];
//    [self.drawerController setShowsShadow:NO];
//    [self.drawerController setRestorationIdentifier:@"MMDrawer"];
//    [self.drawerController setMaximumRightDrawerWidth:200.0];
//    [self.drawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeAll];
//    [self.drawerController setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeAll];
//    
//
//    [_drawerController setDrawerVisualStateBlock:^(MMDrawerController *drawerController, MMDrawerSide drawerSide, CGFloat percentVisible) {
//         UIViewController * sideDrawerViewController;
//         if(drawerSide == MMDrawerSideLeft){
//             sideDrawerViewController = drawerController.leftDrawerViewController;
//         }
//         else if(drawerSide == MMDrawerSideRight){
//             sideDrawerViewController = drawerController.rightDrawerViewController;
//         }
//         [sideDrawerViewController.view setAlpha:percentVisible];
//     }];
//    
//    [self.window setRootViewController:self.drawerController];
//    
//    [self.window makeKeyAndVisible];
    
    
    //AppKey:注册的AppKey，详细见下面注释。
    //apnsCertName:推送证书名（不需要加后缀），详细见下面注释。
    NSString *appkey =@"782385854#lulu";
    NSString *cername = @"lulu";
    
    EMOptions *options = [EMOptions optionsWithAppkey:appkey];
    options.apnsCertName = cername;
    [[EMClient sharedClient] initializeSDKWithOptions:options];
    
    
    
    [[EaseSDKHelper shareHelper] hyphenateApplication:application
                        didFinishLaunchingWithOptions:launchOptions
                                               appkey:appkey
                                         apnsCertName:cername
                                          otherConfig:@{kSDKConfigEnableConsoleLogger:[NSNumber numberWithBool:YES]}];
    
    
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}

// APP进入后台
- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    
    
    [[EMClient sharedClient] applicationDidEnterBackground:application];

}

// APP将要从后台返回
- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    
    [[EMClient sharedClient] applicationWillEnterForeground:application];
    
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
