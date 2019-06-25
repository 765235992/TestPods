//
//  UIViewController+DJFNavigationController.h
//  FrameworkBaseDemo
//
//  Created by Jone Hua on 2018/8/31.
//  Copyright © 2018年 快乐的小屌丝儿. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DJFNavigationController, DJFWarpViewController;

@interface UIViewController (DJFNavigationController)
/**
 控制器对应的包装后的控制器
 */
@property (nonatomic, weak) DJFWarpViewController *DJF_wrapViewController;

/**
 控制器的根控制器
 */
@property (nonatomic, weak, readonly) DJFNavigationController *DJF_navigationController;
@end
