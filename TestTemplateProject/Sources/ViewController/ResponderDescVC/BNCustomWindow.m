//
//  BNCustomWindow.m
//  TestTemplateProject
//
//  Created by Ben on 2017/6/15.
//  Copyright © 2017年 iOSStudio. All rights reserved.
//

#import "BNCustomWindow.h"

@implementation BNCustomWindow

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog (@"BNCustomWindow: ==BEGIN== touchesBegan");
    
    [super touchesBegan:touches withEvent:event];
    
    NSLog (@"BNCustomWindow: ===END=== touchesBegan");
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
    NSLog (@"BNCustomWindow: ==BEGIN== touchesMoved");
    
    [super touchesMoved:touches withEvent:event];
    
    NSLog (@"BNCustomWindow: ===END=== touchesMoved");
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
    NSLog (@"BNCustomWindow: ==BEGIN== touchesEnded");
    
    [super touchesEnded:touches withEvent:event];
    
    NSLog (@"BNCustomWindow: ===END=== touchesEnded");
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
    NSLog (@"BNCustomWindow: ==BEGIN== touchesCancelled");
    
    [super touchesCancelled:touches withEvent:event];
    
    NSLog (@"BNCustomWindow: ===END=== touchesCancelled");
}

- (void)touchesEstimatedPropertiesUpdated:(NSSet<UITouch *> *)touches {
    NSLog (@"BNCustomWindow: ==BEGIN== touchesEstimatedPropertiesUpdated");
    
    [super touchesEstimatedPropertiesUpdated:touches];
    
    NSLog (@"BNCustomWindow: ===END=== touchesEstimatedPropertiesUpdated");
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    NSLog (@"BNCustomWindow: ==BEGIN== hitTest");

    UIView *view = [super hitTest:point withEvent:event];
    
    NSLog (@"BNCustomWindow: ===END=== hitTest: %@", view);
    
    return view;
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    NSLog (@"BNCustomWindow: ==BEGIN== pointInside");
    
    BOOL isInside = [super pointInside:point withEvent:event];
    
    NSLog (@"BNCustomWindow: ===END=== pointInside: %d", isInside);
    
    return isInside;
}

@end


