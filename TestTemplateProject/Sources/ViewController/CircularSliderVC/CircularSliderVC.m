//
//  CircularSliderVC.m
//  TestTemplateProject
//
//  Created by Ben on 2017/5/22.
//  Copyright (c) 2017年 Ben. All rights reserved.
//

#import "CircularSliderVC.h"
#import "TBCircularSlider.h"

@interface CircularSliderVC ()

@end

@implementation CircularSliderVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:0.1 green:0.1 blue:0.1 alpha:1];
    
    //Create the Circular Slider
    TBCircularSlider *slider = [[TBCircularSlider alloc]initWithFrame:CGRectMake((kScreenWidth - TB_SLIDER_SIZE) / 2, 60, TB_SLIDER_SIZE, TB_SLIDER_SIZE)];
    
    //Define Target-Action behaviour
    [slider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:slider];
}

/** This function is called when Circular slider value changes **/
- (void)sliderValueChanged:(TBCircularSlider *)slider {
    //TBCircularSlider *slider = (TBCircularSlider*)sender;
    NSLog(@"Slider new value %d", slider.angle);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
