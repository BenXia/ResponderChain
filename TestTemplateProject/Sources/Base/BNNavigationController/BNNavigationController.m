//
//  BNNavigationController.m
//  TestTemplateProject
//
//  Created by Ben on 2017/5/22.
//  Copyright (c) 2017年 Ben. All rights reserved.
//

#import "BNNavigationController.h"

@interface BNNavigationController ()

@end

@implementation BNNavigationController

#pragma mark - 屏幕旋转相关

- (BOOL)shouldAutorotate {
    return [self.topViewController shouldAutorotate];
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return [self.topViewController supportedInterfaceOrientations];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog (@"%@: ==BEGIN== touchesBegan", [self class]);
    
    [super touchesBegan:touches withEvent:event];
    
    NSLog (@"%@: ===END=== touchesBegan", [self class]);
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog (@"%@: ==BEGIN== touchesMoved", [self class]);
    
    [super touchesMoved:touches withEvent:event];
    
    NSLog (@"%@: ===END=== touchesMoved", [self class]);
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog (@"%@: ==BEGIN== touchesEnded", [self class]);
    
    [super touchesEnded:touches withEvent:event];
    
    NSLog (@"%@: ===END=== touchesEnded", [self class]);
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog (@"%@: ==BEGIN== touchesCancelled", [self class]);
    
    [super touchesCancelled:touches withEvent:event];
    
    NSLog (@"%@: ===END=== touchesCancelled", [self class]);
}

- (void)touchesEstimatedPropertiesUpdated:(NSSet<UITouch *> *)touches {
    NSLog (@"%@: ==BEGIN== touchesEstimatedPropertiesUpdated", [self class]);
    
    [super touchesEstimatedPropertiesUpdated:touches];
    
    NSLog (@"%@: ===END=== touchesEstimatedPropertiesUpdated", [self class]);
}

@end

