//
//  DJFNavigationController.h
//  DJFNavigationControllerDemo
//
//  Created by Jone Hua on 2018/7/31.
//  Copyright © 2018年 快乐的小屌丝儿. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "UIViewController+DJF.h"
/**
 根导航控制器
 */
@interface DJFNavigationController : UINavigationController

/** 获取当前显示的控制器中的contentViewController */
@property (nonatomic, weak, readonly) UIViewController *DJF_visibleViewController;

/** 获取当前栈顶的控制器中的contentViewController */
@property (nonatomic, weak, readonly) UIViewController *DJF_topViewController;

/** 获取所有的contentViewController */
@property (nonatomic, weak, readonly) NSArray <__kindof UIViewController *> *DJF_viewControllers;

/** 移除栈中的某个控制器（contentViewController） */
- (void)removeViewControllerWithClass:(Class)className;

@end



