//
//  CircularRespondAreaButton.m
//  TestTemplateProject
//
//  Created by Ben on 2017/6/16.
//  Copyright © 2017年 iOSStudio. All rights reserved.
//

#import "CircularRespondAreaButton.h"

@implementation CircularRespondAreaButton

- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self commonInit];
    }
    
    return self;
}

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self commonInit];
    }
    
    return self;
}

- (void)commonInit {
    CGFloat cornerRadius = MIN(self.frame.size.width, self.frame.size.height) / 2;
    
    self.layer.cornerRadius = cornerRadius;
    self.layer.masksToBounds = YES;
}

- (CGFloat)distanceFromPointX:(CGPoint)start distanceToPointY:(CGPoint)end{
    CGFloat distance;
    //下面就是高中的数学，不详细解释了
    CGFloat xDist = (end.x - start.x);
    CGFloat yDist = (end.y - start.y);
    distance = sqrt((xDist * xDist) + (yDist * yDist));
    return distance;
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    CGPoint centerPoint = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);
    CGFloat cornerRadius = MIN(self.frame.size.width, self.frame.size.height) / 2;
    CGFloat distance = [self distanceFromPointX:centerPoint distanceToPointY:point];
    if (distance <= cornerRadius) {
        return [super pointInside:point withEvent:event];
    } else {
        return NO;
    }
}

@end


