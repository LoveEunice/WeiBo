//
//  QYTabBarController.m
//  04-WeiBo
//
//  Created by qingyun on 16/4/6.
//  Copyright © 2016年 河南青云信息技术有限公司. All rights reserved.
//

#import "QYTabBarController.h"

@interface QYTabBarController ()

@end

@implementation QYTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    //自定义中间的tabBarItem
    [self setMiddleTabBarItem];
//    [[UIView appearance] setBackgroundColor:[UIColor lightGrayColor]];
    // Do any additional setup after loading the view.
}

-(void)setMiddleTabBarItem {
    //self.tabBar.tintColor = [UIColor orangeColor];
    //添加中间tabBarItem + 按钮（宽：50、高：40）
    CGFloat btnW = 50;
    CGFloat btnH = 40;
    CGFloat btnX = (CGRectGetWidth(self.tabBar.frame) - btnW) / 2.0;
    CGFloat btnY = (CGRectGetHeight(self.tabBar.frame) - btnH) / 2.0;
    //添加中间的+
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.tabBar addSubview:btn];
    
    //设置frame
    btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
    
    //设置图片
    [btn setImage:[UIImage imageNamed:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
    //设置背景颜色
    [btn setBackgroundColor:[UIColor orangeColor]];
    
    //添加事件监听
    [btn addTarget:self action:@selector(composeBtnClick) forControlEvents:UIControlEventTouchUpInside];
    //设置圆角
    btn.layer.cornerRadius = 4;
    btn.layer.masksToBounds = YES;
    
}

-(void)composeBtnClick {
    NSLog(@"%s",__func__);
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
