//
//  CenterViewController.m
//  lulu
//
//  Created by genilex3 on 16/11/1.
//  Copyright © 2016年 wei63w. All rights reserved.
//

#import "CenterViewController.h"

@interface CenterViewController ()<EMUserListViewControllerDataSource,EMUserListViewControllerDelegate>

@end

@implementation CenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setRightMenuBtn];
}

/*!
 @method
 @brief 获取用户模型
 @discussion 根据buddy获取用户自定信息，联系人列表里展示昵称和头像
 @param userListViewController 当前联系人视图
 @param buddy 好友的信息描述类
 @result 返回用户模型
 */
//联系人列表扩展样例
- (id<IUserModel>)userListViewController:(EaseUsersListViewController *)userListViewController modelForBuddy:(NSString *)buddy
{
    //用户可以根据自己的用户体系，根据buddy设置用户昵称和头像
    id<IUserModel> model = nil;
    model = [[EaseUserModel alloc] initWithBuddy:buddy];
    model.avatarURLPath = @"";//头像网络地址
    model.nickname = @"昵称";//用户昵称
    return model;
}
-(void)setRightMenuBtn{
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 50, 30)];
    [btn setTitle:@"+" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(rightBtnTouch) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *drm = [[UIBarButtonItem alloc]initWithCustomView:btn];


    [self.navigationItem setRightBarButtonItem:drm animated:YES];
}
-(void)rightBtnTouch{
    NSLog(@"添加好友");

//    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"LoginViewController" bundle:nil];
//    UIViewController *vc = sb.instantiateInitialViewController;
//    vc.hidesBottomBarWhenPushed = YES;
//    [self.navigationController pushViewController:vc animated:YES];
}
@end
