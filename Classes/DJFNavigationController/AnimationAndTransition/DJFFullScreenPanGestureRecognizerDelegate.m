//
//  DJFFullScreenPanGestureRecognizerDelegate.m
//  FrameworkBaseDemo
//
//  Created by Jone Hua on 2018/8/31.
//  Copyright © 2018年 快乐的小屌丝儿. All rights reserved.
//

#import "DJFFullScreenPanGestureRecognizerDelegate.h"
#import "DJFNavigationController.h"

@implementation DJFFullScreenPanGestureRecognizerDelegate

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    
    // 如果当前只有一个控制器
    if (self.navigationController.viewControllers.count <= 1) {
        return NO;
    }
    
    // 获取当前控制器的导航栏的最顶层控制器的内容控制器
    UIViewController *topContentViewController = self.navigationController.DJF_topViewController;
    //    NSLog(@"%@-----%d", topContentViewController, topContentViewController.DJF_interactivePopDisabled);
    // 获取系统手势的action
    SEL action = NSSelectorFromString(@"handleNavigationTransition:");
    
    // 禁止手势滑动返回
    if (topContentViewController.DJF_interactivePopDisabled) return NO;
    
    // 正在做过渡动画
    if ([[self.navigationController valueForKey:@"_isTransitioning"] boolValue]) return NO;
    
    // 自定义手势处理
    if ([gestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]]) {
        UIPanGestureRecognizer *panGesture = (UIPanGestureRecognizer *)gestureRecognizer;
        
        // 获取手势的速度位置
        CGPoint velocity = [panGesture velocityInView:panGesture.view];
        if (velocity.x < 0) {  // 向左滑动push操作            
            return NO;
        }else {  // 向右滑动pop操作，使用系统的pop方法
            // 首先处理禁止pop的操作--控制器设置的最大滑动距离
            CGPoint beginningLocation = [panGesture locationInView:panGesture.view];
            CGFloat maxAllowDistance  = topContentViewController.DJF_popMaxAllowedDistanceToLeftEdge;
            
            if (maxAllowDistance > 0 && beginningLocation.x > maxAllowDistance && !topContentViewController.DJF_fullScreenPopDisabled) {
                return NO;
            }else {
                // 添加系统的pop操作
                [gestureRecognizer addTarget:self.popGestureTarget action:action];
            }
        }
    }
    return YES;
}

@end
