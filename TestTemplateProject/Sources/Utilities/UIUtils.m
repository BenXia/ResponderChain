//
//  UIUtils.m
//  TestTemplateProject
//
//  Created by Ben on 2017/5/22.
//  Copyright (c) 2017年 Ben. All rights reserved.
//

#import "UIUtils.h"
#import <objc/runtime.h>

void BN_swapMethodsFromClass(Class c, SEL orig, SEL new)
{
    Method origMethod = class_getInstanceMethod(c, orig);
    Method newMethod = class_getInstanceMethod(c, new);
    if (class_addMethod(c, orig, method_getImplementation(newMethod), method_getTypeEncoding(newMethod)))
    {
        class_replaceMethod(c, new, method_getImplementation(origMethod), method_getTypeEncoding(origMethod));
    }
    else
    {
        method_exchangeImplementations(origMethod, newMethod);
    }
}

@implementation UIUtils

+ (CGFloat)statusHeight {
    CGRect rectStatus = [[UIApplication sharedApplication] statusBarFrame];
    return rectStatus.size.height;
}

+ (CGFloat)navigationBarHeight {
    UINavigationController *vc =[UINavigationController new];
    CGRect rectNav = [vc.navigationBar frame];
    return rectNav.size.height;
}

+ (CGFloat)tabBarHeight {
    UITabBarController *vc = [UITabBarController new];
    CGRect rectTab = [vc.tabBar frame];
    return rectTab.size.height;
}

+ (CGFloat)keyboardHeightFromNotificationUserInfo:(NSDictionary *)userInfo {
    CGFloat currentKeyboardHeight = [[userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size.height;
    
#if (defined(__IPHONE_OS_VERSION_MAX_ALLOWED) && (__IPHONE_OS_VERSION_MAX_ALLOWED >= 80000))
    //以下代码主要是为了让iOS8SDK＋iOS8之后的设备得到的键盘尺寸与iOS8SDK之前的计算方法保持一致
    if (([[[UIDevice currentDevice] systemVersion] compare:@"8.0" options:NSNumericSearch] != NSOrderedAscending)
        && UIDeviceOrientationIsLandscape((UIDeviceOrientation)[UIApplication sharedApplication].statusBarOrientation)) {
        currentKeyboardHeight = [[userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size.width;
    }
#endif
    
    return currentKeyboardHeight;
}

+ (CGFloat)screenWidth {
    return MIN([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
}

+ (CGFloat)screenHeight {
    return MAX([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
}

@end

