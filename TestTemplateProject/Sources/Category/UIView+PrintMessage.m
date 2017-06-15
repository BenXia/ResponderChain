//
//  UIView+PrintMessage.m
//  TestTemplateProject
//
//  Created by Ben on 2017/6/16.
//  Copyright © 2017年 iOSStudio. All rights reserved.
//

#import "UIView+PrintMessage.h"

@implementation UIView (PrintMessage)

//+ (void)load {
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        BN_swapMethodsFromClass([UIView class], @selector(hitTest:withEvent:), @selector(bn_hitTest:withEvent:));
//        BN_swapMethodsFromClass([UIView class], @selector(pointInside:withEvent:), @selector(bn_pointInside:withEvent:));
//    });
//}
//
//- (UIView *)bn_hitTest:(CGPoint)point withEvent:(UIEvent *)event {
//    NSLog (@"%@: ==BEGIN== hitTest", self.class);
//    
//    UIView *view = [self bn_hitTest:point withEvent:event];
//    
//    NSLog (@"%@: ===END=== hitTest: %@", self.class, view);
//    
//    return view;
//}
//
//- (BOOL)bn_pointInside:(CGPoint)point withEvent:(UIEvent *)event {
//    NSLog (@"%@: ==BEGIN== pointInside", self.class);
//    
//    BOOL isInside = [self bn_pointInside:point withEvent:event];
//    
//    NSLog (@"%@: ===END=== pointInside: %d", self.class, isInside);
//    
//    return isInside;
//}

@end
