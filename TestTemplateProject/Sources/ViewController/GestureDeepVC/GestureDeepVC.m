//
//  GestureDeepVC.m
//  TestTemplateProject
//
//  Created by Ben on 2017/7/11.
//  Copyright © 2017年 iOSStudio. All rights reserved.
//

#import "GestureDeepVC.h"

@interface GestureDeepVC ()

@property (weak, nonatomic) IBOutlet UIButton *button;

@end

@implementation GestureDeepVC

#pragma mark - View life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    UITapGestureRecognizer *tapViewGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapViewGesture)];
//    NSLog (@"tapGesture: cancelsTouchesInView = %d, delaysTouchesBegan = %d, delaysTouchesEnded = %d", tapViewGesture.cancelsTouchesInView, tapViewGesture.delaysTouchesBegan, tapViewGesture.delaysTouchesEnded);
////    tapViewGesture.delaysTouchesBegan = YES;  // 注意打开这一句后，点击 button 后 UIControlEventTouchDown 事件已经不会触发了
//    [self.view addGestureRecognizer:tapViewGesture];
    
    UITapGestureRecognizer *tapButtonGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapButtonGesture)];
    NSLog (@"tapGesture: cancelsTouchesInView = %d, delaysTouchesBegan = %d, delaysTouchesEnded = %d", tapButtonGesture.cancelsTouchesInView, tapButtonGesture.delaysTouchesBegan, tapButtonGesture.delaysTouchesEnded);
    tapButtonGesture.numberOfTapsRequired = 1;
    //    tapButtonGesture.delaysTouchesBegan = YES;  // 注意打开这一句后，点击 button 后 UIControlEventTouchDown 事件已经不会触发了
    //    tapButtonGesture.cancelsTouchesInView = NO; // 注意打开这一句后，点击 button 后 UIControlEventTouchUpInside 事件也会触发了
    tapButtonGesture.delaysTouchesEnded = YES;
    [self.button addGestureRecognizer:tapButtonGesture];
    
    UITapGestureRecognizer *dbTapViewGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didDBTapButtonGesture)];
    dbTapViewGesture.numberOfTapsRequired = 2;
    
    [self.button addGestureRecognizer:dbTapViewGesture];

//    [tapButtonGesture requireGestureRecognizerToFail:dbTapViewGesture];  // 注意打开这一句后，双击 Button 则不会触发两次单机手势了
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - IBActions

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    
    NSLog (@"GestureVC touchesBegan:withEvent:");
}

- (void)didTapViewGesture {
    NSLog (@"didTapViewGesture");
}

- (void)didTapButtonGesture {
    NSLog (@"didTapButtonGesture");
}

- (void)didDBTapButtonGesture {
    NSLog (@"didDBTapButtonGesture");
}

- (IBAction)didTouchDownButtonAction:(id)sender {
    NSLog (@"didTouchDownButtonAction");
}

- (IBAction)didTouchUpInsideButtonAction:(id)sender {
    NSLog (@"didTouchUpInsideButtonAction");
}

@end


