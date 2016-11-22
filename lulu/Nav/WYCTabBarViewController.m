//
//  WYCTabBarViewController.m
//  lulu
//
//  Created by genilex3 on 16/11/2.
//  Copyright © 2016年 wei63w. All rights reserved.
//

#import "WYCTabBarViewController.h"
#import "NavigationViewController.h"

@interface WYCTabBarViewController ()

@property (nonatomic, strong) NavigationViewController *leftNav;
@property (nonatomic, strong) NavigationViewController *centerNav;
@property (nonatomic, strong) NavigationViewController *rightNav;

@end

@implementation WYCTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //底部tabbar
    [self initializeTabBarController];
}
/**
 *  初始化TabBar
 */
-(void)initializeTabBarController{
    
    UIStoryboard *leftsb = [UIStoryboard storyboardWithName:@"LeftViewController" bundle:nil];
    UIViewController *leftvc = leftsb.instantiateInitialViewController;
    leftvc.title = @"left";
    leftvc.tabBarItem.image = [UIImage imageNamed:@"tab_icon1_normal.png"];
    leftvc.tabBarItem.selectedImage = [UIImage imageNamed:@"tab_icon1_selcet.png"];
    leftvc.tabBarItem.title = @"left";
    
    
    
    
    UIStoryboard *centersb = [UIStoryboard storyboardWithName:@"CenterViewController" bundle:nil];
    UIViewController *centervc = centersb.instantiateInitialViewController;
    centervc.title = @"通讯录";
    centervc.tabBarItem.image = [UIImage imageNamed:@"tab_icon2_normal.png"];
    centervc.tabBarItem.selectedImage = [UIImage imageNamed:@"tab_icon2_selcet.png"];
    leftvc.tabBarItem.title = @"通讯录";
    
    UIStoryboard *rightsb = [UIStoryboard storyboardWithName:@"RightViewController" bundle:nil];
    UIViewController *rightvc = rightsb.instantiateInitialViewController;
    rightvc.title = @"我的";
    rightvc.tabBarItem.image = [UIImage imageNamed:@"tab_icon5_normal.png"];
    rightvc.tabBarItem.selectedImage = [UIImage imageNamed:@"tab_icon5_selcet.png"];
    leftvc.tabBarItem.title = @"我的";
    
    self.leftNav = [[NavigationViewController alloc]initWithRootViewController:leftvc];
    self.centerNav = [[NavigationViewController alloc]initWithRootViewController:centervc];
    //第三个页面不需要NavgationController 不添加
//    self.rightNav = [[NavigationViewController alloc]initWithRootViewController:rightvc];
    
    self.viewControllers = [NSArray arrayWithObjects:self.leftNav,self.centerNav,rightvc,nil];
}


















@end
