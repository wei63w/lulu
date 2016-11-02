//
//  NavigationViewController.m
//  lulu
//
//  Created by genilex3 on 16/11/1.
//  Copyright © 2016年 wei63w. All rights reserved.
//

#import "NavigationViewController.h"


@interface NavigationViewController ()


@end

@implementation NavigationViewController

-(void)viewDidLoad{
    
    // 使导航条有效
    [self setNavigationBarHidden:NO];
    // 显示导航条，但由于导航条有效，系统的返回按钮页有效，所以可以使用系统的右滑返回手势。
    [self.navigationBar setHidden:NO];
    
    // 是否可右滑返回
    self.interactivePopGestureRecognizer.enabled = YES;
    
}

@end
