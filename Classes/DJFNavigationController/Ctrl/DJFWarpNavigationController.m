//
//  DJFWarpNavigationController.m
//  DJFNavigationControllerDemo
//
//  Created by Jone Hua on 2018/7/31.
//  Copyright © 2018年 快乐的小屌丝儿. All rights reserved.
//

#import "DJFWarpNavigationController.h"
#import "DJFWarpViewController.h"
#import "UIViewController+DJFNavigationController.h"
#import "DJFNavigationController.h"
@interface DJFWarpNavigationController ()

@end
@implementation DJFWarpNavigationController

+ (instancetype)wrapNavigationControllerWithViewController:(UIViewController *)viewController {
    return [[self alloc] initWithViewController:viewController];
}

- (instancetype)initWithViewController:(UIViewController *)viewController {
    if (self = [super init]) {
        self.viewControllers = @[viewController];
        
        if ([viewController isKindOfClass:[UITabBarController class]]) {
            [self setNavigationBarHidden:YES animated:NO];
        }
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 禁用包装的控制器的返回手势
    self.interactivePopGestureRecognizer.enabled = NO;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    DJFNavigationController *nav = (DJFNavigationController *)self.navigationController;
    
    // push一个包装后的控制器
    DJFWarpViewController *wrapViewController = [DJFWarpViewController wrapViewControllerWithViewController:viewController];
    viewController.DJF_wrapViewController = wrapViewController;
    
    [nav pushViewController:wrapViewController animated:animated];
}


- (UIViewController *)popViewControllerAnimated:(BOOL)animated {
    
    if (self.navigationController.viewControllers.count > 1) {
        return [self.navigationController popViewControllerAnimated:animated];
    }else {
        if (self.navigationController.navigationController.navigationController) {
            // 暂时的解决办法，用于处理push到UITabBarController的情况
            return [self.navigationController.navigationController.navigationController popViewControllerAnimated:animated];
        }else if (self.navigationController.navigationController) {
            return [self.navigationController.navigationController popViewControllerAnimated:animated];
        }else {
            return [self.navigationController popViewControllerAnimated:animated];
        }
    }
}

- (NSArray<UIViewController *> *)popToViewController:(UIViewController *)viewController animated:(BOOL)animated {
    // pop到指定控制器时应找到对应的DJFWarpViewController
    DJFWarpViewController *wrapViewController = viewController.DJF_wrapViewController;
    return [self.navigationController popToViewController:wrapViewController animated:animated];
}

- (NSArray<UIViewController *> *)popToRootViewControllerAnimated:(BOOL)animated {
    return [self.navigationController popToRootViewControllerAnimated:animated];
}

- (void)setDelegate:(id<UINavigationControllerDelegate>)delegate {
    self.navigationController.delegate = delegate;
}
@end
