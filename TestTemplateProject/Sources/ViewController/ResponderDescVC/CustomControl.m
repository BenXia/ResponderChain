//
//  CustomControl.m
//  TestTemplateProject
//
//  Created by Ben on 2017/6/15.
//  Copyright © 2017年 iOSStudio. All rights reserved.
//

#import "CustomControl.h"

@implementation CustomControl

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UIResponder * next = [self nextResponder];
    NSMutableString *prefix = @"".mutableCopy;
    
    while (next != nil) {
        NSLog(@"%@%@", prefix, [next class]);
        
        [prefix appendString: @"--"];
        next = [next nextResponder];
    }
}

@end
