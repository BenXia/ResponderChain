//
//  ScrollViewSuperView.m
//  TestTemplateProject
//
//  Created by Ben on 2017/6/16.
//  Copyright © 2017年 iOSStudio. All rights reserved.
//

#import "ScrollViewSuperView.h"

@implementation ScrollViewSuperView

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    UIView *hitTestView = [super hitTest:point withEvent:event];
    if (hitTestView) {
        hitTestView = [self.subviews firstObject];
    }
    return hitTestView;
}

@end


