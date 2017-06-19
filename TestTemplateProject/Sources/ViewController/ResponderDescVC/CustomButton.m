//
//  CustomButton.m
//  TestTemplateProject
//
//  Created by Ben on 2017/6/15.
//  Copyright © 2017年 iOSStudio. All rights reserved.
//

#import "CustomButton.h"

@implementation CustomButton

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    NSLog (@"%@: ==BEGIN== hitTest", self.class);
    
    UIView *view = [super hitTest:point withEvent:event];
    
    NSLog (@"%@: ===END=== hitTest: %@", self.class, view);
    
    return view;
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    NSLog (@"%@: ==BEGIN== pointInside", self.class);
    
    BOOL isInside = [super pointInside:point withEvent:event];
    
    NSLog (@"%@: ===END=== pointInside: %d", self.class, isInside);
    
    return isInside;
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
