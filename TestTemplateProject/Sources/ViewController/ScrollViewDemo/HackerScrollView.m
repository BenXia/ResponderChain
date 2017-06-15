//
//  HackerScrollView.m
//  TestTemplateProject
//
//  Created by Ben on 2017/6/16.
//  Copyright © 2017年 iOSStudio. All rights reserved.
//

#import "HackerScrollView.h"

@implementation HackerScrollView

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    CGPoint p = [self convertPoint:point toView:self.superview];
    return [self.superview pointInside:p withEvent:event];
}

@end


