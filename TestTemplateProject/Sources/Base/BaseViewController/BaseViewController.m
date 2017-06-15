//
//  BaseViewController.m
//  TestTemplateProject
//
//  Created by Ben on 2017/5/22.
//  Copyright (c) 2017年 Ben. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    if ([self respondsToSelector:@selector(edgesForExtendedLayout)]) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    
    self.view.backgroundColor = RGB(240, 240, 240);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog (@"%@: ==BEGIN== touchesBegan", [self class]);
    
    [super touchesBegan:touches withEvent:event];
    
    NSLog (@"%@: ===END=== touchesBegan", [self class]);
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
    NSLog (@"%@: ==BEGIN== touchesMoved", [self class]);
    
    [super touchesMoved:touches withEvent:event];
    
    NSLog (@"%@: ===END=== touchesMoved", [self class]);
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
    NSLog (@"%@: ==BEGIN== touchesEnded", [self class]);
    
    [super touchesEnded:touches withEvent:event];
    
    NSLog (@"%@: ===END=== touchesEnded", [self class]);
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
    NSLog (@"%@: ==BEGIN== touchesCancelled", [self class]);
    
    [super touchesCancelled:touches withEvent:event];
    
    NSLog (@"%@: ===END=== touchesCancelled", [self class]);
}

- (void)touchesEstimatedPropertiesUpdated:(NSSet<UITouch *> *)touches {
    NSLog (@"%@: ==BEGIN== touchesEstimatedPropertiesUpdated", [self class]);
    
    [super touchesEstimatedPropertiesUpdated:touches];
    
    NSLog (@"%@: ===END=== touchesEstimatedPropertiesUpdated", [self class]);
}

@end


