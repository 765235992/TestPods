//
//  NSObject+DJF.m
//  DJFNavigationControllerDemo
//
//  Created by Jone Hua on 2018/8/30.
//  Copyright © 2018年 快乐的小屌丝儿. All rights reserved.
//

#import "NSObject+DJF.h"
#import "DJFWarpViewController.h"
@implementation NSObject (DJF)

- (UIViewController *)DJF_topViewController {
    UIViewController *resultVC;
    resultVC = [self DJF_topViewController:[[UIApplication sharedApplication].keyWindow rootViewController]];
    while (resultVC.presentedViewController) {
        resultVC = [self DJF_topViewController:resultVC.presentedViewController];
    }
    if ([resultVC isKindOfClass:[DJFWarpViewController class]]) {
        UINavigationController *currentNav = [[resultVC childViewControllers] firstObject];
        UIViewController *rootVC = (UIViewController *)currentNav.viewControllers.firstObject;
        return rootVC;
    }else{
        return resultVC;
    }
 
}
- (UIViewController *)DJF_topViewController:(UIViewController *)viewController
{
    if ([viewController isKindOfClass:[UINavigationController class]]) {
        return [self DJF_topViewController:[(UINavigationController *)viewController topViewController]];
    } else if ([viewController isKindOfClass:[UITabBarController class]]) {
        return [self DJF_topViewController:[(UITabBarController *)viewController selectedViewController]];
    }else {
        return viewController;
    }
    return nil;
}
- (void)DJF_pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    UIViewController *topmostVC = [self DJF_topViewController];
    [topmostVC.navigationController pushViewController:viewController animated:animated];
}

@end
