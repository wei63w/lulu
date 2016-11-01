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
#import "CenterViewController.h"
#import "LeftViewController.h"
#import "NavViewController.h"
#import "RightViewController.h"

@interface AppDelegate ()

@property (nonatomic, strong) MMDrawerController *drawerController;
@property (nonatomic, strong) UITabBarController *tabBarController;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.tabBarController = [[UITabBarController alloc]init];
    
    
    
    UIStoryboard *leftsb = [UIStoryboard storyboardWithName:@"LeftViewController" bundle:nil];
    UIViewController *leftvc = leftsb.instantiateInitialViewController;
    leftvc.title = @"left";
    leftvc.tabBarItem.image = [UIImage imageNamed:@"tab_icon1_normal.png"];
    leftvc.tabBarItem.selectedImage = [UIImage imageNamed:@"tab_icon1_selcet.png"];
    
    
    
    UIStoryboard *centersb = [UIStoryboard storyboardWithName:@"CenterViewController" bundle:nil];
    UIViewController *centervc = centersb.instantiateInitialViewController;
    centervc.title = @"center";
    centervc.tabBarItem.image = [UIImage imageNamed:@"tab_icon2_normal.png"];
    centervc.tabBarItem.selectedImage = [UIImage imageNamed:@"tab_icon2_selcet.png"];
    
    
    UIStoryboard *rightsb = [UIStoryboard storyboardWithName:@"RightViewController" bundle:nil];
    UIViewController *rightvc = rightsb.instantiateInitialViewController;
    rightvc.title = @"right";
    rightvc.tabBarItem.image = [UIImage imageNamed:@"tab_icon5_normal.png"];
    rightvc.tabBarItem.selectedImage = [UIImage imageNamed:@"tab_icon5_selcet.png"];
    
    
    
    [self.tabBarController addChildViewController:leftvc];
    [self.tabBarController addChildViewController:centervc];
    [self.tabBarController addChildViewController:rightvc];
    
    UIStoryboard *navsb = [UIStoryboard storyboardWithName:@"NavViewController" bundle:nil];
    UIViewController *navvc = navsb.instantiateInitialViewController;
    
    
    _drawerController = [[MMDrawerController alloc]initWithCenterViewController:self.tabBarController leftDrawerViewController:navvc];
    [self.drawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeAll];
    [self.drawerController setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeAll];
    
    
    
//    
//    [_drawerController setGestureShouldRecognizeTouchBlock:^BOOL(MMDrawerController *drawerController, UIGestureRecognizer *gesture, UITouch *touch) {
//         BOOL shouldRecognizeTouch = NO;
//         if(drawerController.openSide == MMDrawerSideNone &&
//            [gesture isKindOfClass:[UIPanGestureRecognizer class]]){
////             UIView * customView = [drawerController.centerViewController myCustomSubview];
////             CGPoint location = [touch locationInView:customView];
////             shouldRecognizeTouch = (CGRectContainsPoint(customView.bounds, location));
//             //判断哪个控制器可以滑到抽屉
//             UINavigationController *nav = (UINavigationController *)drawerController.centerViewController;
//             if ([nav.topViewController isKindOfClass:[LeftViewController class]]) {
//                 shouldRecognizeTouch = YES;//yes 标示可以滑到左右抽屉
//             }else{
//                 shouldRecognizeTouch = NO;
//             }
//         }
//         return shouldRecognizeTouch;
//     }];
    [_drawerController setDrawerVisualStateBlock:^(MMDrawerController *drawerController, MMDrawerSide drawerSide, CGFloat percentVisible) {
         UIViewController * sideDrawerViewController;
         if(drawerSide == MMDrawerSideLeft){
             sideDrawerViewController = drawerController.leftDrawerViewController;
         }
         else if(drawerSide == MMDrawerSideRight){
             sideDrawerViewController = drawerController.rightDrawerViewController;
         }
         [sideDrawerViewController.view setAlpha:percentVisible];
     }];
    
    [self.window setRootViewController:self.drawerController];
    
    [self.window makeKeyAndVisible];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
