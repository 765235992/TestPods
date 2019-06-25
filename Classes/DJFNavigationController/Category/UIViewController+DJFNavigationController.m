//
//  UIViewController+DJFNavigationController.m
//  FrameworkBaseDemo
//
//  Created by Jone Hua on 2018/8/31.
//  Copyright © 2018年 快乐的小屌丝儿. All rights reserved.
//

#import "UIViewController+DJFNavigationController.h"
#import "DJFNavigationController.h"
#import <objc/runtime.h>

static NSString *const DJFWarpViewControllerKey   = @"DJFWarpViewControllerKey";
static NSString *const DJFNavigationControllerKey = @"DJFNavigationControllerKey";

@implementation UIViewController (DJFNavigationController)


- (DJFWarpViewController *)DJF_wrapViewController {
    return objc_getAssociatedObject(self, &DJFWarpViewControllerKey);
}

- (void)setDJF_wrapViewController:(DJFWarpViewController *)DJF_wrapViewController {
    objc_setAssociatedObject(self, &DJFWarpViewControllerKey, DJF_wrapViewController, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (DJFNavigationController *)DJF_navigationController {
    UIViewController *vc = self;
    while (vc && ![vc isKindOfClass:[DJFNavigationController class]]) {
        vc = vc.navigationController;
    }
    return (DJFNavigationController *)vc;
}


@end
