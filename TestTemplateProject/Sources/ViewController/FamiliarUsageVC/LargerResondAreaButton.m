//
//  LargerResondAreaButton.m
//  TestTemplateProject
//
//  Created by Ben on 2017/6/15.
//  Copyright © 2017年 iOSStudio. All rights reserved.
//

#import "LargerResondAreaButton.h"

@implementation LargerResondAreaButton

- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        self.largerRepondEdge = UIEdgeInsetsZero;
    }
    
    return self;
}

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.largerRepondEdge = UIEdgeInsetsZero;
    }
    
    return self;
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    if (UIEdgeInsetsEqualToEdgeInsets(self.largerRepondEdge, UIEdgeInsetsZero)) {
        return [super pointInside:point withEvent:event];
    } else {
        CGRect respondRect = self.bounds;
        respondRect.origin.x = respondRect.origin.x - self.largerRepondEdge.left;
        respondRect.origin.y = respondRect.origin.y - self.largerRepondEdge.top;
        respondRect.size.width = respondRect.size.width + self.largerRepondEdge.left + self.largerRepondEdge.right;
        respondRect.size.height = respondRect.size.height + self.largerRepondEdge.top + self.largerRepondEdge.bottom;
        
        return CGRectContainsPoint(respondRect, point);
    }
}

@end


