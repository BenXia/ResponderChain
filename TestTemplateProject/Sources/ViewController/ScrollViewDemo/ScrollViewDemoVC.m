//
//  ScrollViewDemoVC.m
//  TestTemplateProject
//
//  Created by Ben on 2017/6/16.
//  Copyright © 2017年 iOSStudio. All rights reserved.
//

#import "ScrollViewDemoVC.h"

@interface ScrollViewDemoVC ()

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *scrollContentView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *scrollContentViewWidthConstraint;

@end

@implementation ScrollViewDemoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    CGFloat kImgWidth = ceilf(kScreenWidth - 100);
    CGFloat kImgHeight = kImgWidth * 16 / 9;
    
    UIImageView *imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kImgWidth, kImgHeight)];
    imageView1.image = [UIImage imageNamed:@"login_new_pic01"];
    imageView1.contentMode = UIViewContentModeScaleAspectFill;
    
    UIImageView *imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(kImgWidth, 0, kImgWidth, kImgHeight)];
    imageView2.image = [UIImage imageNamed:@"login_new_pic02"];
    imageView2.contentMode = UIViewContentModeScaleAspectFill;
    
    UIImageView *imageView3 = [[UIImageView alloc] initWithFrame:CGRectMake(kImgWidth * 2, 0, kImgWidth, kImgHeight)];
    imageView3.image = [UIImage imageNamed:@"login_new_pic01"];
    imageView3.contentMode = UIViewContentModeScaleAspectFill;
    
    [self.scrollContentView addSubview:imageView1];
    [imageView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.scrollContentView.mas_left);
        make.top.equalTo(self.scrollContentView);
        make.width.mas_equalTo(kImgWidth);
        make.height.mas_equalTo(kImgHeight);
    }];
    [self.scrollContentView addSubview:imageView2];
    [imageView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.scrollContentView.mas_left).offset(kImgWidth);
        make.top.equalTo(self.scrollContentView);
        make.width.mas_equalTo(kImgWidth);
        make.height.mas_equalTo(kImgHeight);
    }];
    [self.scrollContentView addSubview:imageView3];
    [imageView3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.scrollContentView.mas_left).offset(2 * kImgWidth);
        make.top.equalTo(self.scrollContentView);
        make.width.mas_equalTo(kImgWidth);
        make.height.mas_equalTo(kImgHeight);
    }];
    
    self.scrollContentViewWidthConstraint.constant = kImgWidth * 3;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end


