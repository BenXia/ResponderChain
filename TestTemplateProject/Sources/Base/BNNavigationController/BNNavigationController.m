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

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
#if BN_ENABLE_RESPONDCHAIN_LOGGING
    NSLog (@"%@: ==BEGIN== touchesBegan", [self class]);
#endif
    
    [super touchesBegan:touches withEvent:event];
    
#if BN_ENABLE_RESPONDCHAIN_LOGGING
    NSLog (@"%@: ===END=== touchesBegan", [self class]);
#endif
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
#if BN_ENABLE_RESPONDCHAIN_LOGGING
    NSLog (@"%@: ==BEGIN== touchesMoved", [self class]);
#endif
    
    [super touchesMoved:touches withEvent:event];

#if BN_ENABLE_RESPONDCHAIN_LOGGING
    NSLog (@"%@: ===END=== touchesMoved", [self class]);
#endif
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
#if BN_ENABLE_RESPONDCHAIN_LOGGING
    NSLog (@"%@: ==BEGIN== touchesEnded", [self class]);
#endif
    
    [super touchesEnded:touches withEvent:event];

#if BN_ENABLE_RESPONDCHAIN_LOGGING
    NSLog (@"%@: ===END=== touchesEnded", [self class]);
#endif
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
#if BN_ENABLE_RESPONDCHAIN_LOGGING
    NSLog (@"%@: ==BEGIN== touchesCancelled", [self class]);
#endif
    
    [super touchesCancelled:touches withEvent:event];
    
#if BN_ENABLE_RESPONDCHAIN_LOGGING
    NSLog (@"%@: ===END=== touchesCancelled", [self class]);
#endif
}

- (void)touchesEstimatedPropertiesUpdated:(NSSet<UITouch *> *)touches {
#if BN_ENABLE_RESPONDCHAIN_LOGGING
    NSLog (@"%@: ==BEGIN== touchesEstimatedPropertiesUpdated", [self class]);
#endif
    
    [super touchesEstimatedPropertiesUpdated:touches];
    
#if BN_ENABLE_RESPONDCHAIN_LOGGING
    NSLog (@"%@: ===END=== touchesEstimatedPropertiesUpdated", [self class]);
#endif
}

@end

