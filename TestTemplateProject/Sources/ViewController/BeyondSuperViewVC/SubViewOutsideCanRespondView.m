//
//  SubViewOutsideCanRespondView.m
//  TestTemplateProject
//
//  Created by Ben on 2017/6/16.
//  Copyright © 2017年 iOSStudio. All rights reserved.
//

#import "SubViewOutsideCanRespondView.h"

@implementation SubViewOutsideCanRespondView

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    if (!self.isUserInteractionEnabled || self.isHidden || self.alpha <= 0.01) {
        return nil;
    }
    /**
     *  此注释掉的方法用来判断点击是否在父View Bounds内，
     *  如果不在父view内，就会直接不会去其子View中寻找HitTestView，return 返回
     */
    //    if ([self pointInside:point withEvent:event]) {
    for (UIView *subview in [self.subviews reverseObjectEnumerator]) {
        CGPoint convertedPoint = [subview convertPoint:point fromView:self];
        UIView *hitTestView = [subview hitTest:convertedPoint withEvent:event];
        if (hitTestView) {
            return hitTestView;
        }
    }
    return self;
    //    }
    return nil;
}

//- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
//    if (!self.isUserInteractionEnabled || self.isHidden || self.alpha <= 0.01) {
//        return nil;
//    }
//    if ([self pointInside:point withEvent:event]) {
//        for (UIView *subview in [self.subviews reverseObjectEnumerator]) {
//            CGPoint convertedPoint = [subview convertPoint:point fromView:self];
//            UIView *hitTestView = [subview hitTest:convertedPoint withEvent:event];
//            if (hitTestView) {
//                return hitTestView;
//            }
//        }
//        return self;
//    }
//    return nil;
//}

@end
