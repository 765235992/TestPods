//
//  DJFFullScreenPanGestureRecognizerDelegate.h
//  FrameworkBaseDemo
//
//  Created by Jone Hua on 2018/8/31.
//  Copyright © 2018年 快乐的小屌丝儿. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DJFNavigationController;

@interface DJFFullScreenPanGestureRecognizerDelegate : NSObject<UIGestureRecognizerDelegate>

/**
 根控制器
 */
@property (nonatomic, weak) DJFNavigationController *navigationController;

/**
 系统返回手势的target
 */
@property (nonatomic, weak) id popGestureTarget;


@end
