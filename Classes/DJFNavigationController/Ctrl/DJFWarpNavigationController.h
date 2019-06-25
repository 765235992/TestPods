//
//  DJFWarpNavigationController.h
//  DJFNavigationControllerDemo
//
//  Created by Jone Hua on 2018/7/31.
//  Copyright © 2018年 快乐的小屌丝儿. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DJFWarpNavigationController : UINavigationController
/**
 用于包装导航控制器的控制器
 */
@property (nonatomic, weak) UIViewController *DJF_wrapViewContorller;

+ (instancetype)wrapNavigationControllerWithViewController:(UIViewController *)viewController;

@end
