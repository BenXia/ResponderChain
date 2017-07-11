//
//  ScratchGestureRecognizer.m
//  TestTemplateProject
//
//  Created by Ben on 2017/7/11.
//  Copyright © 2017年 iOSStudio. All rights reserved.
//

#import "ScratchGestureRecognizer.h"

typedef NS_ENUM(NSUInteger, Direction) {
    DirectionUnknown,
    DirectionLeft,
    DirectionRight
};

@interface ScratchGestureRecognizer ()

@property (assign, nonatomic) NSUInteger tickleCount; //挠痒次数
@property (assign, nonatomic) CGPoint currentTickleStart; //当前挠痒开始坐标位置
@property (assign, nonatomic) Direction lastDirection; //最后一次挠痒方向

@end

@implementation ScratchGestureRecognizer

#define kMinTickleSpacing 20.0
#define kMaxTickleCount 3

- (void)reset {
    _tickleCount = 0;
    _currentTickleStart = CGPointZero;
    _lastDirection = DirectionUnknown;
    
    if (self.state == UIGestureRecognizerStatePossible) {
        self.state = UIGestureRecognizerStateFailed;
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    _currentTickleStart = [touch locationInView:self.view]; //设置当前挠痒开始坐标位置
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    //『当前挠痒开始坐标位置』和『移动后坐标位置』进行 X 轴值比较，得到是向左还是向右移动
    UITouch *touch = [touches anyObject];
    CGPoint tickleEnd = [touch locationInView:self.view];
    CGFloat tickleSpacing = tickleEnd.x - _currentTickleStart.x;
    Direction currentDirection = tickleSpacing < 0 ? DirectionLeft : DirectionRight;
    
    //移动的 X 轴间距值是否符合要求，足够大
    if (ABS(tickleSpacing) >= kMinTickleSpacing) {
        //判断是否有三次不同方向的动作，如果有则手势结束，将执行回调方法
        if (_lastDirection == DirectionUnknown ||
            (_lastDirection == DirectionLeft && currentDirection == DirectionRight) ||
            (_lastDirection == DirectionRight && currentDirection == DirectionLeft)) {
            _tickleCount++;
            _currentTickleStart = tickleEnd;
            _lastDirection = currentDirection;
            
            if (_tickleCount >= kMaxTickleCount && self.state == UIGestureRecognizerStatePossible) {
                self.state = UIGestureRecognizerStateEnded;
                //NSLog(@"自定义手势成功，将执行回调方法");
            }
        }
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [self reset];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    [self reset];
}

@end


