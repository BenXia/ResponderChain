//
//  CustomTextField.m
//  TestTemplateProject
//
//  Created by Ben on 2017/6/15.
//  Copyright © 2017年 iOSStudio. All rights reserved.
//

#import "CustomTextField.h"

@implementation CustomTextField

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog (@"CustomTextField: ==BEGIN== touchesBegan");
    
    [super touchesBegan:touches withEvent:event];
    
    NSLog (@"CustomTextField: ===END=== touchesBegan");
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
    NSLog (@"CustomTextField: ==BEGIN== touchesMoved");
    
    [super touchesMoved:touches withEvent:event];
    
    NSLog (@"CustomTextField: ===END=== touchesMoved");
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
    NSLog (@"CustomTextField: ==BEGIN== touchesEnded");
    
    [super touchesEnded:touches withEvent:event];
    
    NSLog (@"CustomTextField: ===END=== touchesEnded");
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
    NSLog (@"CustomTextField: ==BEGIN== touchesCancelled");
    
    [super touchesCancelled:touches withEvent:event];
    
    NSLog (@"CustomTextField: ===END=== touchesCancelled");
}

- (void)touchesEstimatedPropertiesUpdated:(NSSet<UITouch *> *)touches {
    NSLog (@"CustomTextField: ==BEGIN== touchesEstimatedPropertiesUpdated");
    
    [super touchesEstimatedPropertiesUpdated:touches];
    
    NSLog (@"CustomTextField: ===END=== touchesEstimatedPropertiesUpdated");
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    NSLog (@"CustomTextField: ==BEGIN== hitTest");
    
    UIView *view = [super hitTest:point withEvent:event];
    
    NSLog (@"CustomTextField: ===END=== hitTest: %@", view);
    
    return view;
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    NSLog (@"CustomTextField: ==BEGIN== pointInside");
    
    BOOL isInside = [super pointInside:point withEvent:event];
    
    NSLog (@"CustomTextField: ===END=== pointInside: %d", isInside);
    
    return isInside;
}

@end
