//
//  LoginViewController.m
//  lulu
//
//  Created by genilex3 on 16/11/3.
//  Copyright © 2016年 wei63w. All rights reserved.
//

#import "LoginViewController.h"
#import "EMSDK.h"
#import "ChatViewController.h"
#import "WYCTabBarViewController.h"
#import <MMDrawerController.h>

@interface LoginViewController ()

@property (weak, nonatomic) IBOutlet UITextField *username;

@property (weak, nonatomic) IBOutlet UITextField *password;

@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@property (weak, nonatomic) IBOutlet UIButton *regist;


@property (nonatomic, strong) WYCTabBarViewController *tabBar;

@property (nonatomic, strong) MMDrawerController *drawerController;

@property (strong, nonatomic) UIWindow *window;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setBackBtn];
    [self setRightBar];
    self.title = @"登录";
    self.loginBtn.layer.borderWidth = 1;
    self.loginBtn.layer.borderColor = [UIColor whiteColor].CGColor;
    self.loginBtn.layer.cornerRadius = 5;
    self.regist.layer.borderWidth = 1;
    self.regist.layer.borderColor = [UIColor whiteColor].CGColor;
    self.regist.layer.cornerRadius = 5;
}
- (IBAction)loginTouch:(id)sender {
    if (self.username.text.length > 0 && self.password.text.length > 0) {
        EMError *error = [[EMClient sharedClient] loginWithUsername:self.username.text password:self.password.text];
        if (!error) {
            NSLog(@"登录成功");
            // 获取用户偏好设置对象
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            // 保存用户偏好设置
            [defaults setObject:self.username.text forKey:@"username"];
            
            [self toMainView];
        }
    }else{
        [self shouAlertWithTitle:@"提示" andMsg:@"用户名密码不能为空"];
    }
}
- (IBAction)registTouch:(id)sender {
    if (self.username.text.length >0 && self.password.text.length >0) {
        EMError *error = [[EMClient sharedClient] registerWithUsername:self.username.text password:self.password.text];
        if (error==nil) {
            NSLog(@"注册成功!~");
        }
    }else{
        
        [self shouAlertWithTitle:@"提示" andMsg:@"用户名密码不能为空"];
    }
}

-(void)shouAlertWithTitle:(NSString *)title andMsg:(NSString *)message{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alertController addAction:action];
    [self presentViewController:alertController animated:YES completion:^{
        
    }];
}
-(void)setRightBar{
    UIButton *righbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [righbtn setTitleColor:[UIColor colorWithRed:200/255.0 green:203/255.0 blue:206/255.0 alpha:1] forState:UIControlStateNormal];
    [righbtn addTarget:self action:@selector(logout) forControlEvents:UIControlEventTouchUpInside];
    [righbtn setFrame:CGRectMake(0, 0, 44, 44)];
    [righbtn setTitle:@"注销" forState:UIControlStateNormal];
    UIBarButtonItem *rightitem = [[UIBarButtonItem alloc]initWithCustomView:righbtn];
    self.navigationItem.rightBarButtonItem = rightitem;
}
-(void)logout{
    EMError *error = [[EMClient sharedClient] logout:YES];
    if (!error) {
        NSLog(@"退出成功");
    }
}
-(void)setBackBtn{
    UIButton *backbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    //    [backbtn setTitleColor:[UIColor colorWithRed:200/255.0 green:203/255.0 blue:206/255.0 alpha:1] forState:UIControlStateNormal];
    [backbtn setTitleColor:[UIColor colorWithRed:200/255.0 green:203/255.0 blue:206/255.0 alpha:1] forState:UIControlStateNormal];
    [backbtn addTarget:self action:@selector(popup) forControlEvents:UIControlEventTouchUpInside];
    [backbtn setFrame:CGRectMake(0, 0, 44, 44)];
    [backbtn setTitle:@"返回" forState:UIControlStateNormal];
    UIBarButtonItem *backitem = [[UIBarButtonItem alloc]initWithCustomView:backbtn];
    self.navigationItem.leftBarButtonItem = backitem;
}
-(void)popup{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)toMainView{
    self.tabBar = [[WYCTabBarViewController alloc]init];
    
    
    UIStoryboard *leftDrawersb = [UIStoryboard storyboardWithName:@"leftDrawerViewController" bundle:nil];
    UIViewController *leftDrawer = leftDrawersb.instantiateInitialViewController;
    
    
    _drawerController = [[MMDrawerController alloc]initWithCenterViewController:self.tabBar leftDrawerViewController:leftDrawer];
    [self.drawerController setShowsShadow:NO];
    [self.drawerController setRestorationIdentifier:@"MMDrawer"];
    [self.drawerController setMaximumRightDrawerWidth:200.0];
    [self.drawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeAll];
    [self.drawerController setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeAll];
    
    
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
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];// [[UIApplication sharedApplication] keyWindow];
    
    [self.window setRootViewController:self.drawerController];
    
    [self.window makeKeyAndVisible];
}


@end
