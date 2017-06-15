//
//  CustomView.m
//  TestTemplateProject
//
//  Created by Ben on 2017/6/15.
//  Copyright © 2017年 iOSStudio. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog (@"CustomView: ==BEGIN== touchesBegan");
    
    [super touchesBegan:touches withEvent:event];
    
    NSLog (@"CustomView: ===END=== touchesBegan");
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
    NSLog (@"CustomView: ==BEGIN== touchesMoved");
    
    [super touchesMoved:touches withEvent:event];
    
    NSLog (@"CustomView: ===END=== touchesMoved");
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
    NSLog (@"CustomView: ==BEGIN== touchesEnded");
    
    [super touchesEnded:touches withEvent:event];
    
    NSLog (@"CustomView: ===END=== touchesEnded");
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
    NSLog (@"CustomView: ==BEGIN== touchesCancelled");
    
    [super touchesCancelled:touches withEvent:event];
    
    NSLog (@"CustomView: ===END=== touchesCancelled");
}

- (void)touchesEstimatedPropertiesUpdated:(NSSet<UITouch *> *)touches {
    NSLog (@"CustomView: ==BEGIN== touchesEstimatedPropertiesUpdated");
    
    [super touchesEstimatedPropertiesUpdated:touches];
    
    NSLog (@"CustomView: ===END=== touchesEstimatedPropertiesUpdated");
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    NSLog (@"CustomView: ==BEGIN== hitTest");
    
    UIView *view = [super hitTest:point withEvent:event];
    
    NSLog (@"CustomView: ===END=== hitTest: %@", view);
    
    return view;
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    NSLog (@"CustomView: ==BEGIN== pointInside");
    
    BOOL isInside = [super pointInside:point withEvent:event];
    
    NSLog (@"CustomView: ===END=== pointInside: %d", isInside);
    
    return isInside;
}

@end


