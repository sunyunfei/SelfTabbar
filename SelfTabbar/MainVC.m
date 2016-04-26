//
//  MainVC.m
//  SelfTabbar
//
//  Created by 孙云 on 16/4/26.
//  Copyright © 2016年 haidai. All rights reserved.
//

#import "MainVC.h"
#import "OneVC.h"
#import "TwoVC.h"
#import "ThreeVC.h"
#import "FourVC.h"
#import "FiveVC.h"
#define KADDCOUNT 100
@interface MainVC ()
{

    NSArray *dataArray;
}
@end

@implementation MainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    dataArray = @[@"一",@"二",@"三",@"四",@"五"];
    //加载控制器
    [self setVC];
    //第一种方法
    [self addOneMethod];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/**
 *  控制器加载
 */
- (void)setVC{

    OneVC *one     = [[OneVC alloc]init];
    one.title = @"one";
    TwoVC *two     = [[TwoVC alloc]init];
    two.title = @"two";
    ThreeVC *three = [[ThreeVC alloc]init];
    three.title = @"three";
    FourVC *four   = [[FourVC alloc]init];
    four.title = @"four";
    FiveVC *five   = [[FiveVC alloc]init];
    five.title = @"five";
    
    NSArray *navArray = @[one,two,three,four,five];
    self.viewControllers = navArray;
    
}
/**
 *  第一种方法
 */
- (void)addOneMethod{

    UIView *bottomView = [[UIView alloc]initWithFrame:CGRectMake((self.view.frame.size.width - 70) / 2, self.view.frame.size.height - 70, 70, 70)];
    bottomView.backgroundColor = [UIColor lightGrayColor];
    bottomView.layer.cornerRadius = 70 / 2;
    bottomView.layer.masksToBounds = YES;
    bottomView.layer.shadowColor = [UIColor blackColor].CGColor;
    bottomView.layer.shadowOffset = CGSizeMake(-5, -5);
    bottomView.layer.shadowOpacity = 1.0;
    bottomView.layer.shadowRadius = 10;
    [self.view addSubview:bottomView];
    
    UIView *oneView = [[UIView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height - 50, self.view.frame.size.width, 50)];
    oneView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:oneView];
    //视图上的按钮
    
    for(int i = 0;i < 5;i ++){
    
        CGFloat K_W = oneView.frame.size.width / 5;
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.tag = KADDCOUNT + i;
        btn.frame = CGRectMake(i * K_W, 0, K_W,oneView.frame.size.height);
        [btn setTitle:dataArray[i] forState:UIControlStateNormal];
        btn.layer.borderColor = [UIColor redColor].CGColor;
        btn.layer.borderWidth = 1.0;
        [btn addTarget:self action:@selector(changgVC:) forControlEvents:UIControlEventTouchUpInside];
        [oneView addSubview:btn];
    }
    
}
/**
 *  按钮事件
 */
- (void)changgVC:(UIButton *)sender{

    NSInteger index = sender.tag - KADDCOUNT;
    self.selectedIndex = index;
}
@end
