//
//  CustomButton.m
//  TestTemplateProject
//
//  Created by Ben on 2017/6/15.
//  Copyright © 2017年 iOSStudio. All rights reserved.
//

#import "CustomButton.h"

@implementation CustomButton

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog (@"CustomButton: ==BEGIN== touchesBegan");
    
    [super touchesBegan:touches withEvent:event];
    
    NSLog (@"CustomButton: ===END=== touchesBegan");
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
    NSLog (@"CustomButton: ==BEGIN== touchesMoved");
    
    [super touchesMoved:touches withEvent:event];
    
    NSLog (@"CustomButton: ===END=== touchesMoved");
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
    NSLog (@"CustomButton: ==BEGIN== touchesEnded");
    
    [super touchesEnded:touches withEvent:event];
    
    NSLog (@"CustomButton: ===END=== touchesEnded");
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
    NSLog (@"CustomButton: ==BEGIN== touchesCancelled");
    
    [super touchesCancelled:touches withEvent:event];
    
    NSLog (@"CustomButton: ===END=== touchesCancelled");
}

- (void)touchesEstimatedPropertiesUpdated:(NSSet<UITouch *> *)touches {
    NSLog (@"CustomButton: ==BEGIN== touchesEstimatedPropertiesUpdated");
    
    [super touchesEstimatedPropertiesUpdated:touches];
    
    NSLog (@"CustomButton: ===END=== touchesEstimatedPropertiesUpdated");
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    NSLog (@"CustomButton: ==BEGIN== hitTest");
    
    UIView *view = [super hitTest:point withEvent:event];
    
    NSLog (@"CustomButton: ===END=== hitTest: %@", view);
    
    return view;
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    NSLog (@"CustomButton: ==BEGIN== pointInside");
    
    BOOL isInside = [super pointInside:point withEvent:event];
    
    NSLog (@"CustomButton: ===END=== pointInside: %d", isInside);
    
    return isInside;
}

@end
