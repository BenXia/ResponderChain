//
//  GestureDeepVC.m
//  TestTemplateProject
//
//  Created by Ben on 2017/7/11.
//  Copyright © 2017年 iOSStudio. All rights reserved.
//

#import "GestureDeepVC.h"

@interface GestureDeepVC () <UIGestureRecognizerDelegate>

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

/*
 *    cancelsTouchesInView (默认为YES)
 *    delaysTouchesBegan (默认为NO)
 *    delaysTouchesEnded (默认为YES)
 *    cancelsTouchesInView为YES,表示当Gesture Recognizers识别到手势后，会向hit-test view发送 touchesCancelled:withEvent:消息来取消hit-test view对此触摸序列的处理,这样只有Gesture Recognizers能响应此触摸序列，hit-test view不再响应。如果为NO,则不发送touchesCancelled:withEvent:消息给hit-test view,这样会使Gesture Recognizers和hit-test view同时响应触摸序列。
 *    delaysTouchesBegan为NO，表示触摸序列开始时，而手势识别器还未识别出此手势时，touch事件会同时发向hit-test view,这样在手势识别器还未识别出此手势，hit-test view同时也可以收到同样的触摸事件。如果为YES,则在手势识别器在识别手势的过程中，不会有任何触摸事件发送给hit-test view,如果手势识别器最终识别到了手势，则也不会发送任何消息(包括touchesCancelled:withEvent:)给hit-test view;若干手势识别最终没有识别到手势，则所有的触摸事件在发给hit-test view处理。关于这个特性，可参考UIScrollView的delaysContentTouches属性。这样属性也谨慎使用，使用不当会导致UI无响应。
 *    delaysTouchesEnded,在文档上的解释是，当手势识别器在识别手势时，对于UITouchPhaseEnded阶段的touch会延迟发送给hit-test view,在手势识别成功后,发送给hit-test view cancel消息，手势识别失败时，发送原来的end消息。
 */
    
    UITapGestureRecognizer *tapButtonGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapButtonGesture)];
    NSLog (@"tapGesture: cancelsTouchesInView = %d, delaysTouchesBegan = %d, delaysTouchesEnded = %d", tapButtonGesture.cancelsTouchesInView, tapButtonGesture.delaysTouchesBegan, tapButtonGesture.delaysTouchesEnded);
    tapButtonGesture.numberOfTapsRequired = 1;
//    tapButtonGesture.cancelsTouchesInView = NO; // 注意打开这一句后，点击 button 后 UIControlEventTouchUpInside 事件也会触发了
//    tapButtonGesture.delaysTouchesBegan = YES;  // 注意打开这一句后，点击 button 后 UIControlEventTouchDown 事件已经不会触发了
    tapButtonGesture.delegate = self;
    [self.button addGestureRecognizer:tapButtonGesture];
    
    UITapGestureRecognizer *dbTapViewGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didDBTapButtonGesture)];
//    dbTapViewGesture.delaysTouchesEnded = NO;     /* 注意打开这一句后，双击 button 识别成功的情况下，中间会有 touchEnd 事件
//                                                     注意打开这一句后，两次间隔较久的单击 button 的情况下，第一次单击的 touchEnd 事件会马上收到，而不用等识别失败才收到  */
    dbTapViewGesture.numberOfTapsRequired = 2;
    
    [self.button addGestureRecognizer:dbTapViewGesture];

//    [tapButtonGesture requireGestureRecognizerToFail:dbTapViewGesture];  // 注意打开这一句后，双击 Button 则不会触发两次单击手势了
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIGestureRecognizerDelegate

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    return YES;   // 改为 NO，识别器相当于 enabled 设置为 NO
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;   // 改为 NO，则双击后第二次单击事件不会触发
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRequireFailureOfGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return NO;    // 改为 YES，则双击后不会触发单击事件（等效于上面的[tapButtonGesture requireGestureRecognizerToFail:dbTapViewGesture];）
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldBeRequiredToFailByGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return NO;    // 改为 YES，则双击后不会触发双击事件，触发了两次单击事件（等效于上面的[dbTapViewGesture requireGestureRecognizerToFail:tapButtonGesture];）
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    return YES;   // 改为 NO，则不会识别单击手势
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceivePress:(UIPress *)press {
    return NO;    // 对于 UITapGestureRecognizer 没什么用，用于识别按压操作的手势，作用与 gestureRecognizer:shouldReceiveTouch: 方法相似
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


