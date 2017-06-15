//
//  CustomControl.m
//  TestTemplateProject
//
//  Created by Ben on 2017/6/15.
//  Copyright © 2017年 iOSStudio. All rights reserved.
//

#import "CustomControl.h"

@implementation CustomControl

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog (@"CustomControl: ==BEGIN== touchesBegan");
    
    [super touchesBegan:touches withEvent:event];
    
    NSLog (@"CustomControl: ===END=== touchesBegan");
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
    NSLog (@"CustomControl: ==BEGIN== touchesMoved");
    
    [super touchesMoved:touches withEvent:event];
    
    NSLog (@"CustomControl: ===END=== touchesMoved");
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
    NSLog (@"CustomControl: ==BEGIN== touchesEnded");
    
    [super touchesEnded:touches withEvent:event];
    
    NSLog (@"CustomControl: ===END=== touchesEnded");
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
    NSLog (@"CustomControl: ==BEGIN== touchesCancelled");
    
    [super touchesCancelled:touches withEvent:event];
    
    NSLog (@"CustomControl: ===END=== touchesCancelled");
}

- (void)touchesEstimatedPropertiesUpdated:(NSSet<UITouch *> *)touches {
    NSLog (@"CustomControl: ==BEGIN== touchesEstimatedPropertiesUpdated");
    
    [super touchesEstimatedPropertiesUpdated:touches];
    
    NSLog (@"CustomControl: ===END=== touchesEstimatedPropertiesUpdated");
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    NSLog (@"CustomControl: ==BEGIN== hitTest");
    
    UIView *view = [super hitTest:point withEvent:event];
    
    NSLog (@"CustomControl: ===END=== hitTest: %@", view);
    
    return view;
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    NSLog (@"CustomControl: ==BEGIN== pointInside");
    
    BOOL isInside = [super pointInside:point withEvent:event];
    
    NSLog (@"CustomControl: ===END=== pointInside: %d", isInside);
    
    return isInside;
}

@end
