//
//  NSObject+DJF.h
//  DJFNavigationControllerDemo
//
//  Created by Jone Hua on 2018/8/30.
//  Copyright © 2018年 快乐的小屌丝儿. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSObject (DJF)
/**
 获取顶部控制器
  @return 顶部控制器
 */
- (UIViewController *)DJF_topViewController;

- (void)DJF_pushViewController:(UIViewController *)viewController animated:(BOOL)animated;

@end
