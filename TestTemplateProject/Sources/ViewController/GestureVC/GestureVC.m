//
//  GestureVC.m
//  TestTemplateProject
//
//  Created by Ben on 2017/5/22.
//  Copyright (c) 2017年 Ben. All rights reserved.
//

#import "GestureVC.h"

@interface GestureVC ()

@property (weak, nonatomic) IBOutlet UIButton *button;

@end

@implementation GestureVC

#pragma mark - View life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITapGestureRecognizer *tapViewGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapViewGesture)];
    NSLog (@"tapGesture: cancelsTouchesInView = %d, delaysTouchesBegan = %d, delaysTouchesEnded = %d", tapViewGesture.cancelsTouchesInView, tapViewGesture.delaysTouchesBegan, tapViewGesture.delaysTouchesEnded);
    tapViewGesture.delaysTouchesBegan = YES;
    [self.view addGestureRecognizer:tapViewGesture];
    
    UITapGestureRecognizer *tapButtonGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapButtonGesture)];
    NSLog (@"tapGesture: cancelsTouchesInView = %d, delaysTouchesBegan = %d, delaysTouchesEnded = %d", tapButtonGesture.cancelsTouchesInView, tapButtonGesture.delaysTouchesBegan, tapButtonGesture.delaysTouchesEnded);
    //tapButtonGesture.delaysTouchesBegan = YES;
    
    [self.button addGestureRecognizer:tapButtonGesture];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    
    NSLog (@"ViewControllerC touchesBegan:withEvent:");
}

- (void)didTapViewGesture {
    NSLog (@"didTapViewGesture");
}

- (void)didTapButtonGesture {
    NSLog (@"didTapButtonGesture");
}

- (IBAction)didTouchDownButtonAction:(id)sender {
    NSLog (@"didTouchDownButtonAction");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end


