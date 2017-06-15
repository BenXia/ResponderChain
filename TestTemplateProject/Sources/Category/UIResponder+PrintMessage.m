//
//  UIResponder+PrintMessage.m
//  TestTemplateProject
//
//  Created by Ben on 2017/6/16.
//  Copyright © 2017年 iOSStudio. All rights reserved.
//

#import "UIResponder+PrintMessage.h"
#import <objc/runtime.h>

@implementation UIResponder (PrintMessage)

//+ (void)load {
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        BN_swapMethodsFromClass([UIResponder class], @selector(touchesBegan:withEvent:), @selector(bn_touchesBegan:withEvent:));
//        BN_swapMethodsFromClass([UIResponder class], @selector(touchesMoved:withEvent:), @selector(bn_touchesMoved:withEvent:));
//        BN_swapMethodsFromClass([UIResponder class], @selector(touchesEnded:withEvent:), @selector(bn_touchesEnded:withEvent:));
//        BN_swapMethodsFromClass([UIResponder class], @selector(touchesCancelled:withEvent:), @selector(bn_touchesCancelled:withEvent:));
//        BN_swapMethodsFromClass([UIResponder class], @selector(touchesEstimatedPropertiesUpdated:), @selector(bn_touchesEstimatedPropertiesUpdated:));
//    });
//}
//
//- (void)bn_touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    NSLog (@"%@: ==BEGIN== touchesBegan", [self class]);
//    
//    [self bn_touchesBegan:touches withEvent:event];
//    
//    NSLog (@"%@: ===END=== touchesBegan", [self class]);
//}
//
//- (void)bn_touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    NSLog (@"%@: ==BEGIN== touchesMoved", [self class]);
//    
//    [self bn_touchesMoved:touches withEvent:event];
//    
//    NSLog (@"%@: ===END=== touchesMoved", [self class]);
//}
//
//- (void)bn_touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    NSLog (@"%@: ==BEGIN== touchesEnded", [self class]);
//    
//    [self bn_touchesEnded:touches withEvent:event];
//    
//    NSLog (@"%@: ===END=== touchesEnded", [self class]);
//}
//
//- (void)bn_touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    NSLog (@"%@: ==BEGIN== touchesCancelled", [self class]);
//    
//    [self bn_touchesCancelled:touches withEvent:event];
//    
//    NSLog (@"%@: ===END=== touchesCancelled", [self class]);
//}
//
//- (void)bn_touchesEstimatedPropertiesUpdated:(NSSet<UITouch *> *)touches {
//    NSLog (@"%@: ==BEGIN== touchesEstimatedPropertiesUpdated", [self class]);
//    
//    [self bn_touchesEstimatedPropertiesUpdated:touches];
//    
//    NSLog (@"%@: ===END=== touchesEstimatedPropertiesUpdated", [self class]);
//}

@end
