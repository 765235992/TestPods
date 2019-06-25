//
//  UIViewController+DJF.m
//  DJFNavigationControllerDemo
//
//  Created by Jone Hua on 2018/7/31.
//  Copyright © 2018年 快乐的小屌丝儿. All rights reserved.
//

#import "UIViewController+DJF.h"
#import <objc/runtime.h>
#import "DJFNavigationController.h"
#import "DJFWarpViewController.h"
NSString *const DJFViewControllerPropertyChangedNotification = @"DJFViewControllerPropertyChangedNotification";

static const void* DJFInteractivePopKey = @"DJFInteractivePopKey";
static const void* DJFFullScreenPopKey  = @"DJFFullScreenPopKey";
static const void* DJFPopMaxDistanceKey = @"DJFPopMaxDistanceKey";
static const void* DJFNavBarAlphaKey    = @"DJFNavBarAlphaKey";

@implementation UIViewController (DJF)

- (BOOL)DJF_interactivePopDisabled {
    return [objc_getAssociatedObject(self, DJFInteractivePopKey) boolValue];
}

- (void)setDJF_interactivePopDisabled:(BOOL)disabled {
    objc_setAssociatedObject(self, DJFInteractivePopKey, @(disabled), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    // 当属性改变是，发送通知，告诉DJFNavigationController，让其做出相应处理
    [[NSNotificationCenter defaultCenter] postNotificationName:DJFViewControllerPropertyChangedNotification object:@{@"viewController": self}];
}

- (BOOL)DJF_fullScreenPopDisabled {
    return [objc_getAssociatedObject(self, DJFFullScreenPopKey) boolValue];
}

- (void)setDJF_fullScreenPopDisabled:(BOOL)disabled {
    objc_setAssociatedObject(self, DJFFullScreenPopKey, @(disabled), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    // 当属性改变是，发送通知，告诉DJFNavigationController，让其做出相应处理
    [[NSNotificationCenter defaultCenter] postNotificationName:DJFViewControllerPropertyChangedNotification object:@{@"viewController": self}];
}

- (CGFloat)DJF_popMaxAllowedDistanceToLeftEdge {
    return [objc_getAssociatedObject(self, DJFPopMaxDistanceKey) floatValue];
}

- (void)setDJF_popMaxAllowedDistanceToLeftEdge:(CGFloat)distance {
    objc_setAssociatedObject(self, DJFPopMaxDistanceKey, @(distance), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    // 当属性改变是，发送通知，告诉DJFNavigationController，让其做出相应处理
    [[NSNotificationCenter defaultCenter] postNotificationName:DJFViewControllerPropertyChangedNotification object:@{@"viewController": self}];
}


- (CGFloat)DJF_navBarAlpha {
    return [objc_getAssociatedObject(self, DJFNavBarAlphaKey) floatValue];
}

- (void)setDJF_navBarAlpha:(CGFloat)DJF_navBarAlpha {
    objc_setAssociatedObject(self, DJFNavBarAlphaKey, @(DJF_navBarAlpha), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    [self.navigationController setNavBarAlpha:DJF_navBarAlpha];
}


@end

@implementation UINavigationController (DJF)

// 设置导航栏透明度
- (void)setNavBarAlpha:(CGFloat)alpha {
    UIView *barBackgroundView = [self.navigationBar.subviews objectAtIndex:0]; // _UIBarBackground
    UIImageView *backgroundImageView = [barBackgroundView.subviews objectAtIndex:0]; // UIImageView
    
    if (self.navigationBar.isTranslucent) {
        if (backgroundImageView != nil && backgroundImageView.image != nil) {
            barBackgroundView.alpha = alpha;
        }else {
            UIView *backgroundEffectView = [barBackgroundView.subviews objectAtIndex:1]; // UIVisualEffectView
            if (backgroundEffectView != nil) {
                backgroundEffectView.alpha = alpha;
            }
        }
    }else {
        barBackgroundView.alpha = alpha;
    }
    // 底部分割线
    self.navigationBar.clipsToBounds = alpha == 0.0;
}

@end

