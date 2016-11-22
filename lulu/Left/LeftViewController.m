//
//  LeftViewController.m
//  lulu
//
//  Created by genilex3 on 16/11/1.
//  Copyright © 2016年 wei63w. All rights reserved.
//

#import "LeftViewController.h"
#import <MMDrawerBarButtonItem.h>
#import <UIViewController+MMDrawerController.h>

@interface LeftViewController ()<EaseMessageViewControllerDelegate,EaseMessageViewControllerDataSource>

@end

@implementation LeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupLeftMenuButton];
    
}

//具体创建自定义Cell的样例：
- (UITableViewCell *)messageViewController:(UITableView *)tableView cellForMessageModel:(id<IMessageModel>)model
{
    //样例为如果消息是文本消息显示用户自定义cell
    if (model.bodyType == EMMessageBodyTypeText) {
        NSString *CellIdentifier = [EaseMessageCell cellIdentifierWithModel:model];
        //CustomMessageCell为用户自定义cell,继承了EaseBaseMessageCell
        EaseMessageCell *cell = (EaseMessageCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            cell = [[EaseMessageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier model:model];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        cell.model = model;
        return cell;
    }
    return nil;
}
- (CGFloat)messageViewController:(EaseMessageViewController *)viewController
           heightForMessageModel:(id<IMessageModel>)messageModel
                   withCellWidth:(CGFloat)cellWidth
{
    //样例为如果消息是文本消息使用用户自定义cell的高度
    if (messageModel.bodyType == EMMessageBodyTypeText) {
        //CustomMessageCell为用户自定义cell,继承了EaseBaseMessageCell
        return [EaseMessageCell cellHeightWithModel:messageModel];
    }
    return 0.f;
}

#pragma mark - Button Handlers
//-(void)setRightMenuBtn{
//    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 50, 30)];
//    [btn setTitle:@"登录" forState:UIControlStateNormal];
//    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
//    [btn addTarget:self action:@selector(rightBtnTouch) forControlEvents:UIControlEventTouchUpInside];
//    UIBarButtonItem *drm = [[UIBarButtonItem alloc]initWithCustomView:btn];
    

//    [self.navigationItem setRightBarButtonItem:drm animated:YES];
//}
//-(void)rightBtnTouch{
//    NSLog(@"注册点击");
//    
//    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"LoginViewController" bundle:nil];
//    UIViewController *vc = sb.instantiateInitialViewController;
//    vc.hidesBottomBarWhenPushed = YES;
//    [self.navigationController pushViewController:vc animated:YES];
//}
-(void)setupLeftMenuButton{
    MMDrawerBarButtonItem * leftDrawerButton = [[MMDrawerBarButtonItem alloc] initWithTarget:self action:@selector(leftDrawerButtonPress:)];
    [self.navigationItem setLeftBarButtonItem:leftDrawerButton animated:YES];
}
-(void)leftDrawerButtonPress:(id)sender{
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
}
-(void)doubleTap:(UITapGestureRecognizer*)gesture{
    [self.mm_drawerController bouncePreviewForDrawerSide:MMDrawerSideLeft completion:nil];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
