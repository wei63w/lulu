//
//  ChatViewController.m
//  lulu
//
//  Created by genilex3 on 16/11/3.
//  Copyright © 2016年 wei63w. All rights reserved.
//

#import "ChatViewController.h"

@interface ChatViewController ()<EaseMessageViewControllerDelegate,EaseMessageViewControllerDataSource>

@end

@implementation ChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
@end
