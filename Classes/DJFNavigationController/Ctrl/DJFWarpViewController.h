//
//  DJFWarpViewController.h
//  DJFNavigationControllerDemo
//
//  Created by Jone Hua on 2018/7/31.
//  Copyright © 2018年 快乐的小屌丝儿. All rights reserved.
//

#import <UIKit/UIKit.h>
/* 说明：此类是用来将传入的UIViewController 包装一个导航控制器（DJFWarpNavigationController),然后再包装一个
 UIViewController(DJFWarpViewController),并将包装后的控制器返回
 */
@interface DJFWarpViewController : UIViewController
/**
 这里用来记录包装前的控制器
 */
@property (nonatomic, weak, readonly) __kindof UIViewController *contentViewController;

/**
 包装控制器的方法
 
 @param viewController 将要包装的控制器
 @return 包装后的控制器
 */
+ (instancetype)wrapViewControllerWithViewController:(UIViewController *)viewController;

@end


