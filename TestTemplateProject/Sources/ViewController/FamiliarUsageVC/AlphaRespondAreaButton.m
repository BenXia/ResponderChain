//
//  AlphaRespondAreaButton.m
//  TestTemplateProject
//
//  Created by Ben on 2017/6/16.
//  Copyright © 2017年 iOSStudio. All rights reserved.
//

#import "AlphaRespondAreaButton.h"

@implementation AlphaRespondAreaButton

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

}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    //Using code from http://stackoverflow.com/questions/1042830/retrieving-a-pixel-alpha-value-for-a-uiimage

    unsigned char pixel[1] = {0};
    CGContextRef context = CGBitmapContextCreate(pixel,
                                                 1, 1, 8, 1, NULL,
                                                 kCGImageAlphaOnly);
    UIGraphicsPushContext(context);
    
    UIImage *image = [self imageForState:UIControlStateNormal];
    [image drawAtPoint:CGPointMake(-point.x, -point.y)];
    UIGraphicsPopContext();
    CGContextRelease(context);
    CGFloat alpha = pixel[0]/255.0f;
    BOOL transparent = alpha < 0.01f;

    return !transparent;
}

@end


