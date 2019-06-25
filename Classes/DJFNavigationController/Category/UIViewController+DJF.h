//
//  UIViewController+DJF.h
//  DJFNavigationControllerDemo
//
//  Created by Jone Hua on 2018/7/31.
//  Copyright © 2018年 快乐的小屌丝儿. All rights reserved.
//

#import <UIKit/UIKit.h>
extern NSString *const DJFViewControllerPropertyChangedNotification;

@class DJFNavigationController, DJFWarpViewController;
@interface UIViewController (DJF)

/** 是否禁止当前控制器的滑动返回(包括全屏返回和边缘返回) */
@property (nonatomic, assign) BOOL DJF_interactivePopDisabled;

/** 是否禁止当前控制器的全屏滑动返回 */
@property (nonatomic, assign) BOOL DJF_fullScreenPopDisabled;

/** 全屏滑动时，滑动区域距离屏幕左边的最大位置，默认是0，表示全屏都可滑动 */
@property (nonatomic, assign) CGFloat DJF_popMaxAllowedDistanceToLeftEdge;

/** 设置导航栏的透明度 */
@property (nonatomic, assign) CGFloat DJF_navBarAlpha;

@end
@interface UINavigationController (DJF)

- (void)setNavBarAlpha:(CGFloat)alpha;

@end
