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

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    //解决手势返回失效的问题
    if (self.navigationController.viewControllers.count > 1) {
        if ([self preferPopGestureRecognizerForbidden]) {
            self.navigationController.interactivePopGestureRecognizer.delegate = nil;
            self.navigationController.interactivePopGestureRecognizer.enabled = NO;
        } else {
            self.navigationController.interactivePopGestureRecognizer.delegate = (id)self;
            self.navigationController.interactivePopGestureRecognizer.enabled = YES;
        }
    } else {
        self.navigationController.interactivePopGestureRecognizer.delegate = nil;
        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    }
}

- (BOOL)preferPopGestureRecognizerForbidden {
    return NO;
}

- (void)dealloc {
    NSLog (@"====DEALLOC==== %@ ", NSStringFromClass([self class]));
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
#if BN_ENABLE_RESPONDCHAIN_LOGGING
    NSLog (@"%@: ==BEGIN== touchesBegan", [self class]);
#endif
    
    [super touchesBegan:touches withEvent:event];
    
#if BN_ENABLE_RESPONDCHAIN_LOGGING
    NSLog (@"%@: ===END=== touchesBegan", [self class]);
#endif
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
#if BN_ENABLE_RESPONDCHAIN_LOGGING
    NSLog (@"%@: ==BEGIN== touchesMoved", [self class]);
#endif
    
    [super touchesMoved:touches withEvent:event];

#if BN_ENABLE_RESPONDCHAIN_LOGGING
    NSLog (@"%@: ===END=== touchesMoved", [self class]);
#endif
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
#if BN_ENABLE_RESPONDCHAIN_LOGGING
    NSLog (@"%@: ==BEGIN== touchesEnded", [self class]);
#endif
    
    [super touchesEnded:touches withEvent:event];

#if BN_ENABLE_RESPONDCHAIN_LOGGING
    NSLog (@"%@: ===END=== touchesEnded", [self class]);
#endif
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
#if BN_ENABLE_RESPONDCHAIN_LOGGING
    NSLog (@"%@: ==BEGIN== touchesCancelled", [self class]);
#endif
    
    [super touchesCancelled:touches withEvent:event];

#if BN_ENABLE_RESPONDCHAIN_LOGGING
    NSLog (@"%@: ===END=== touchesCancelled", [self class]);
#endif
}

- (void)touchesEstimatedPropertiesUpdated:(NSSet<UITouch *> *)touches {
#if BN_ENABLE_RESPONDCHAIN_LOGGING
    NSLog (@"%@: ==BEGIN== touchesEstimatedPropertiesUpdated", [self class]);
#endif
    
    [super touchesEstimatedPropertiesUpdated:touches];

#if BN_ENABLE_RESPONDCHAIN_LOGGING
    NSLog (@"%@: ===END=== touchesEstimatedPropertiesUpdated", [self class]);
#endif
}

@end


