//
//  SuspendViewDemoVC.m
//  TestTemplateProject
//
//  Created by Ben on 2017/5/22.
//  Copyright (c) 2017年 Ben. All rights reserved.
//

#import "SuspendViewDemoVC.h"
#import "CCHSuspendWindow.h"

@interface SuspendViewDemoVC () {
    CCHSuspendWindow *win;
}

@end

@implementation SuspendViewDemoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat w_2 = self.view.frame.size.width/2;
    
    //内容视图
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(2, self.view.frame.size.height/2, w_2, 90)];
    view.backgroundColor = [UIColor lightGrayColor];
    view.layer.borderColor = [UIColor grayColor].CGColor;
    view.layer.borderWidth = 1;
    
    CGFloat wh = 30;
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn1.frame = CGRectMake(w_2 - wh, 0, wh, wh);
    [btn1 setImage:[UIImage imageNamed:@"删除"] forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(hide:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:btn1];
    

    UITextField *text1 = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, w_2 - wh, wh)];
    text1.tintColor = [UIColor whiteColor];
    text1.textColor = [UIColor grayColor];
    text1.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
    text1.placeholder = @"输入帐号";
    [view addSubview:text1];
//    text1.background = [UIImage imageNamed:@"边框"];
    
    UITextField *text = [[UITextField alloc]initWithFrame:CGRectMake(0, wh, w_2, wh)];
    text.tintColor = [UIColor whiteColor];
    text.textColor = [UIColor grayColor];
    text.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
    text.placeholder = @"输入密码";
    text.layer.borderWidth = 1;
    text.layer.borderColor = [UIColor whiteColor].CGColor;
//    text.background = [UIImage imageNamed:@"边框"];
    [view addSubview:text];
    
    
    UILabel *name = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(view.bounds) - wh*2, CGRectGetMaxY(view.bounds) - wh, wh*2, wh)];
    name.text = @" Can He ";
    name.textColor = [UIColor whiteColor];
    name.textAlignment = NSTextAlignmentCenter;
    name.adjustsFontSizeToFitWidth = YES;
    [view addSubview:name];
    
    
    //悬浮框
    win = [[CCHSuspendWindow alloc] initWithContentView:view];

    
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake((kScreenWidth - 120) / 2, 100, 120, 60);
    btn.titleLabel.textColor = [UIColor whiteColor];
    [self.view addSubview:btn];
    btn.backgroundColor = [UIColor grayColor];
    [btn setTitle:@"出来吧窗口" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(show:) forControlEvents:UIControlEventTouchUpInside];
    

}

- (void)show:(id)sender {
    [win show];
}

- (void)hide:(id)sender {
    [win hide];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [win.rootViewController.view endEditing:YES];
    
}



@end
