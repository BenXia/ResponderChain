//
//  GestureVC.m
//  TestTemplateProject
//
//  Created by Ben on 2017/5/22.
//  Copyright (c) 2017年 Ben. All rights reserved.
//

#import "GestureVC.h"
#import "ScratchGestureRecognizer.h"

@interface GestureVC ()

@property (weak, nonatomic) IBOutlet UIImageView *imageViewOne;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewTwo;

@property (nonatomic, strong) ScratchGestureRecognizer *customGestureRecognizer;

@end

@implementation GestureVC

#pragma mark - View life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addTapGestureForView:self.imageViewOne];
    [self addPanGestureForView:self.imageViewOne];
    [self addPinchGestureForView:self.imageViewOne];
    [self addRotationGestureForView:self.imageViewOne];
    [self addLongGestureForView:self.imageViewOne];
    
    [self addTapGestureForView:self.imageViewTwo];
    [self addPanGestureForView:self.imageViewTwo];
    [self addPinchGestureForView:self.imageViewTwo];
    [self addRotationGestureForView:self.imageViewTwo];
    [self addLongGestureForView:self.imageViewTwo];
    
    [self addScreenEdgePanGestureForView:self.view];
    
    // 为了处理手势识别优先级的问题，这里需先绑定自定义挠痒手势
    [self addCustomGestureRecognizer];
    [self addSwipeGestureRecognizer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)preferPopGestureRecognizerForbidden {
    return YES;
}

#pragma mark - 点按手势

/**
 *  绑定点按手势
 *
 *  @param imgVCustom 绑定到图片视图对象实例
 */
- (void)addTapGestureForView:(UIImageView *)imgVCustom {
    UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                 action:@selector(handleTap:)];
    //使用一根手指双击时，才触发点按手势识别器
    recognizer.numberOfTapsRequired = 2;
    recognizer.numberOfTouchesRequired = 1;
    [imgVCustom addGestureRecognizer:recognizer];
}

/**
 *  处理点按手势
 *
 *  @param recognizer 点按手势识别器对象实例
 */
- (void)handleTap:(UITapGestureRecognizer *)recognizer {
    UIView *view = recognizer.view;
    view.transform = CGAffineTransformMakeScale(1.0, 1.0);
    view.transform = CGAffineTransformMakeRotation(0.0);
    view.alpha = 1.0;
}

#pragma mark - 拖动手势

/**
 *  绑定拖动手势
 *
 *  @param imgVCustom 绑定到图片视图对象实例
 */
- (void)addPanGestureForView:(UIImageView *)imgVCustom {
    UIPanGestureRecognizer *recognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self
                                                                                 action:@selector(handlePan:)];
    [imgVCustom addGestureRecognizer:recognizer];
}

/**
 *  处理拖动手势
 *
 *  @param recognizer 拖动手势识别器对象实例
 */
- (void)handlePan:(UIPanGestureRecognizer *)recognizer {
    //视图前置操作
    [recognizer.view.superview bringSubviewToFront:recognizer.view];
    
    CGPoint center = recognizer.view.center;
    CGFloat cornerRadius = recognizer.view.frame.size.width / 2;
    CGPoint translation = [recognizer translationInView:self.view];
    //NSLog(@"%@", NSStringFromCGPoint(translation));
    recognizer.view.center = CGPointMake(center.x + translation.x, center.y + translation.y);
    [recognizer setTranslation:CGPointZero inView:self.view];
    
    if (recognizer.state == UIGestureRecognizerStateEnded) {
        //计算速度向量的长度，当他小于200时，滑行会很短
        CGPoint velocity = [recognizer velocityInView:self.view];
        CGFloat magnitude = sqrtf((velocity.x * velocity.x) + (velocity.y * velocity.y));
        CGFloat slideMult = magnitude / 200;
        //NSLog(@"magnitude: %f, slideMult: %f", magnitude, slideMult); //e.g. 397.973175, slideMult: 1.989866
        
        //基于速度和速度因素计算一个终点
        float slideFactor = 0.1 * slideMult;
        CGPoint finalPoint = CGPointMake(center.x + (velocity.x * slideFactor),
                                         center.y + (velocity.y * slideFactor));
        //限制最小［cornerRadius］和最大边界值［self.view.bounds.size.width - cornerRadius］，以免拖动出屏幕界限
        finalPoint.x = MIN(MAX(finalPoint.x, cornerRadius),
                           self.view.bounds.size.width - cornerRadius);
        finalPoint.y = MIN(MAX(finalPoint.y, cornerRadius),
                           self.view.bounds.size.height - cornerRadius);
        
        //使用 UIView 动画使 view 滑行到终点
        [UIView animateWithDuration:slideFactor*2
                              delay:0
                            options:UIViewAnimationOptionCurveEaseOut
                         animations:^{
                             recognizer.view.center = finalPoint;
                         }
                         completion:nil];
    }
}

#pragma mark - 捏合手势

/**
 *  绑定捏合手势
 *
 *  @param imgVCustom 绑定到图片视图对象实例
 */
- (void)addPinchGestureForView:(UIImageView *)imgVCustom {
    UIPinchGestureRecognizer *recognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self
                                                                                     action:@selector(handlePinch:)];
    [imgVCustom addGestureRecognizer:recognizer];
    //[recognizer requireGestureRecognizerToFail:imgVCustom.gestureRecognizers.firstObject];
}

/**
 *  处理捏合手势
 *
 *  @param recognizer 捏合手势识别器对象实例
 */
- (void)handlePinch:(UIPinchGestureRecognizer *)recognizer {
    CGFloat scale = recognizer.scale;
    recognizer.view.transform = CGAffineTransformScale(recognizer.view.transform, scale, scale); //在已缩放大小基础下进行累加变化；区别于：使用 CGAffineTransformMakeScale 方法就是在原大小基础下进行变化
    recognizer.scale = 1.0;
}

#pragma mark - 旋转手势

/**
 *  绑定旋转手势
 *
 *  @param imgVCustom 绑定到图片视图对象实例
 */
- (void)addRotationGestureForView:(UIImageView *)imgVCustom {
    UIRotationGestureRecognizer *recognizer = [[UIRotationGestureRecognizer alloc] initWithTarget:self
                                                                                           action:@selector(handleRotation:)];
    [imgVCustom addGestureRecognizer:recognizer];
}

/**
 *  处理旋转手势
 *
 *  @param recognizer 旋转手势识别器对象实例
 */
- (void)handleRotation:(UIRotationGestureRecognizer *)recognizer {
    recognizer.view.transform = CGAffineTransformRotate(recognizer.view.transform, recognizer.rotation);
    recognizer.rotation = 0.0;
}

#pragma mark - 旋转手势

/**
 *  绑定长按手势
 *
 *  @param imgVCustom 绑定到图片视图对象实例
 */
- (void)addLongGestureForView:(UIImageView *)imgVCustom {
    UILongPressGestureRecognizer *recognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress:)];
    recognizer.minimumPressDuration = 0.5; //设置最小长按时间；默认为0.5秒
    [imgVCustom addGestureRecognizer:recognizer];
}

/**
 *  处理长按手势
 *
 *  @param recognizer 点按手势识别器对象实例
 */
- (void)handleLongPress:(UILongPressGestureRecognizer *)recognizer {
    //长按的时候，设置不透明度为0.7
    recognizer.view.alpha = 0.7;
}

#pragma mark - 边缘手势

/**
 *  绑定边缘手势
 *
 *  @param imgVCustom 绑定到图片视图对象实例
 */
- (void)addScreenEdgePanGestureForView:(UIView *)viewToAdd {
    UIScreenEdgePanGestureRecognizer *recognizer = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(handleScreenEdgePanPress:)];
    recognizer.edges = UIRectEdgeLeft;
    [viewToAdd addGestureRecognizer:recognizer];
}

/**
 *  处理长按手势
 *
 *  @param recognizer 点按手势识别器对象实例
 */
- (void)handleScreenEdgePanPress:(UILongPressGestureRecognizer *)recognizer {
    [CommonUtils showToastWithText:@"边缘手势识别"];
}

#pragma mark - 自定义挠痒手势

/**
 *  绑定自定义挠痒手势；判断是否有三次不同方向的动作，如果有则手势结束，将执行回调方法
 */
- (void)addCustomGestureRecognizer {
    //当 recognizer.state 为 UIGestureRecognizerStateEnded 时，才执行回调方法 handleCustomGestureRecognizer:
    _customGestureRecognizer = [[ScratchGestureRecognizer alloc] initWithTarget:self
                                                                         action:@selector(handleCustomGestureRecognizer:)];
    [self.view addGestureRecognizer:_customGestureRecognizer];
}

/**
 *  处理自定义手势
 *
 *  @param recognizer 自定义手势识别器对象实例
 */
- (void)handleCustomGestureRecognizer:(ScratchGestureRecognizer *)recognizer {
    //代码块方式封装操作方法
    void (^positionOperation)() = ^() {
        CGPoint newPoint = recognizer.view.center;
        newPoint.y = 300;
        newPoint.x -= 20.0;
        self.imageViewOne.center = newPoint;
        
        newPoint.x += 40.0;
        self.imageViewTwo.center = newPoint;
    };
    
    positionOperation();
}

#pragma mark - 轻扫手势

/**
 *  绑定轻扫手势；支持四个方向的轻扫，但是不同的方向要分别定义轻扫手势
 */
- (void)addSwipeGestureRecognizer {
    //向右轻扫手势
    UISwipeGestureRecognizer *recognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self
                                                                                     action:@selector(handleSwipe:)];
    recognizer.direction = UISwipeGestureRecognizerDirectionRight; //设置轻扫方向；默认是 UISwipeGestureRecognizerDirectionRight，即向右轻扫
    [self.view addGestureRecognizer:recognizer];
    [recognizer requireGestureRecognizerToFail:_customGestureRecognizer]; //设置以自定义挠痒手势优先识别
    
    //向左轻扫手势
    recognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self
                                                           action:@selector(handleSwipe:)];
    recognizer.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:recognizer];
    [recognizer requireGestureRecognizerToFail:_customGestureRecognizer]; //设置以自定义挠痒手势优先识别
}

/**
 *  处理轻扫手势
 *
 *  @param recognizer 轻扫手势识别器对象实例
 */
- (void)handleSwipe:(UISwipeGestureRecognizer *)recognizer {
    //代码块方式封装操作方法
    void (^positionOperation)() = ^() {
        CGPoint newPoint = recognizer.view.center;
        newPoint.y = 300;
        newPoint.y -= 20.0;
        self.imageViewOne.center = newPoint;
        
        newPoint.y += 40.0;
        self.imageViewTwo.center = newPoint;
    };
    
    //根据轻扫方向，进行不同控制
    switch (recognizer.direction) {
        case UISwipeGestureRecognizerDirectionRight: {
            positionOperation();
            break;
        }
        case UISwipeGestureRecognizerDirectionLeft: {
            positionOperation();
            break;
        }
        case UISwipeGestureRecognizerDirectionUp: {
            break;
        }
        case UISwipeGestureRecognizerDirectionDown: {
            break;
        }
    }
}

@end


