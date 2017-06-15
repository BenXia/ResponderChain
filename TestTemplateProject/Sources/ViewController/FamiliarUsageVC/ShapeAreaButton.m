//
//  ShapeAreaButton.m
//  TestTemplateProject
//
//  Created by Ben on 2017/6/16.
//  Copyright © 2017年 iOSStudio. All rights reserved.
//

#import "ShapeAreaButton.h"

@interface ShapeAreaButton ()

@property (nonatomic, strong) CAShapeLayer *shapeLayer;

@end

@implementation ShapeAreaButton

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
    self.shapeLayer = [CAShapeLayer layer];
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, nil, 100, 0);
    CGPathAddLineToPoint(path, nil, 100, 100);
    CGPathAddLineToPoint(path, nil,0, 100);
    self.shapeLayer.path = path;
    [self.layer setMask:self.shapeLayer];
    self.layer.masksToBounds = true;
    self.backgroundColor = [UIColor redColor];
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    if (CGPathContainsPoint(self.shapeLayer.path, nil, point, true)) {
        return [super pointInside:point withEvent:event];
    } else {
        return false;
    }
}

@end


