//
//  FamiliarUsageVC.m
//  TestTemplateProject
//
//  Created by Ben on 2017/6/15.
//  Copyright © 2017年 iOSStudio. All rights reserved.
//

#import "FamiliarUsageVC.h"
#import "LargerResondAreaButton.h"

@interface FamiliarUsageVC ()

@property (weak, nonatomic) IBOutlet LargerResondAreaButton *largerRespondButton;

@end

@implementation FamiliarUsageVC

#pragma mark - View life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    // 1. 产品突然要求之前实现的 disable 状态 UIButton 需要有点击事件
    
    // 2. UIButton 的响应区域变大一点
    //    也可以通过把Frame搞大一点
    //    但是一些特殊情况放大Frame影响布局，可以使用自定义的LargerResondAreaButton，设置largerRepondEdge来放大响应区域（但是要注意不要超出父视图区域，尽量不要与其它子视图重叠）
    self.largerRespondButton.largerRepondEdge = UIEdgeInsetsMake(50, 50, 50, 50);
    
    // 3. 不规则形状的 UIButton，响应区域要求
    //    一种是简单的几何形状，一种是有透明区域的图片
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - IBActions

// 1. 产品突然要求之前实现的 disable 状态 UIButton 需要有点击事件
- (IBAction)didClickTopButtonAction:(UIButton *)button {
    button.enabled = !button.enabled;
    
    NSLog (@"Did click top button");
}

- (IBAction)didClickUndersideButtonAction:(id)sender {
    NSLog (@"Did click underside button");
}

// 2. UIButton 的响应区域变大一点
- (IBAction)didClickLargerRepondAreaButton:(id)sender {
    NSLog (@"Did click larger repond area button");
}

// 3. 不规则形状的 UIButton，响应区域要求
- (IBAction)didClickCircularButtonAction:(id)sender {
    NSLog (@"Did click circular repond area button");
    
}

- (IBAction)didClickShapeLayerButtonAction:(id)sender {
    NSLog (@"Did click shape layer button");
}

- (IBAction)didClickPngImageButton:(id)sender {
    NSLog (@"Did click shape layer button");
}

@end


