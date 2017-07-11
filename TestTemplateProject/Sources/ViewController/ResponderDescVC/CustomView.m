//
//  CustomView.m
//  TestTemplateProject
//
//  Created by Ben on 2017/6/15.
//  Copyright © 2017年 iOSStudio. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
#if BN_ENABLE_RESPONDCHAIN_LOGGING
    NSLog (@"%@: ==BEGIN== hitTest", self.class);
#endif
    
    UIView *view = [super hitTest:point withEvent:event];

#if BN_ENABLE_RESPONDCHAIN_LOGGING
    NSLog (@"%@: ===END=== hitTest: %@", self.class, view);
#endif
    
    return view;
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
#if BN_ENABLE_RESPONDCHAIN_LOGGING
    NSLog (@"%@: ==BEGIN== pointInside", self.class);
#endif
    
    BOOL isInside = [super pointInside:point withEvent:event];
    
#if BN_ENABLE_RESPONDCHAIN_LOGGING
    NSLog (@"%@: ===END=== pointInside: %d", self.class, isInside);
#endif
    
    return isInside;
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


