//
//  DJFWarpViewController.m
//  DJFNavigationControllerDemo
//
//  Created by Jone Hua on 2018/7/31.
//  Copyright © 2018年 快乐的小屌丝儿. All rights reserved.
//

#import "DJFWarpViewController.h"
#import "DJFWarpNavigationController.h"

static NSValue *DJF_wrapTabBarRectValue;

@interface DJFWarpViewController ()
@property (nonatomic, weak) __kindof UIViewController *contentViewController;

@property (nonatomic, weak) DJFWarpNavigationController *wrapNavigationController;

@end

static NSValue *kDJFWarpViewControllerTabbarRectValue;
// The borderline value devcide is need push pop or not when gesture end.
const CGFloat kDJFWarpViewControllerTransitionBorderlineDelta = 0.4;
const CGFloat kDJFWarpViewControllerTransitionDuration = 0.25;
const CGFloat kDJFWarpViewControllerInterlaceFactor = 0.3;
@implementation DJFWarpViewController

+ (instancetype)wrapViewControllerWithViewController:(UIViewController *)viewController {
    return [[self alloc] initWithViewController:viewController];
}

// 包装过程
- (instancetype)initWithViewController:(UIViewController *)viewController {
    if (self = [super init]) {
        // 1. 第一次包装
        self.wrapNavigationController = [DJFWarpNavigationController wrapNavigationControllerWithViewController:viewController];
        
        // 2. 再次包装
        [self addChildViewController:self.wrapNavigationController];
        [self.wrapNavigationController didMoveToParentViewController:self];
        
        // 3. 记录控制器
        self.contentViewController = viewController;
        
        self.wrapNavigationController.DJF_wrapViewContorller = self;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 添加视图
    [self.view addSubview:self.wrapNavigationController.view];
    self.wrapNavigationController.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.wrapNavigationController.view.frame = self.view.bounds;
}

- (void)dealloc {
    [self.wrapNavigationController removeFromParentViewController];
    self.wrapNavigationController = nil;
}

- (void)didMoveToParentViewController:(UIViewController *)parent {
    if (parent == nil) {
        
        [self.wrapNavigationController removeFromParentViewController];
        self.wrapNavigationController = nil;
    }
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    if (self.tabBarController && !DJF_wrapTabBarRectValue) {
        DJF_wrapTabBarRectValue = [NSValue valueWithCGRect:self.tabBarController.tabBar.frame];
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.tabBarController.tabBar.translucent = YES;
    if (self.tabBarController && !self.tabBarController.tabBar.hidden && DJF_wrapTabBarRectValue) {
        self.tabBarController.tabBar.frame = DJF_wrapTabBarRectValue.CGRectValue;
    }
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    if (self.tabBarController && self.contentViewController.hidesBottomBarWhenPushed) {
        self.tabBarController.tabBar.frame = CGRectZero;
    }
}

- (BOOL)shouldAutorotate {
    return self.contentViewController.shouldAutorotate;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return self.contentViewController.supportedInterfaceOrientations;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return self.contentViewController.preferredInterfaceOrientationForPresentation;
}

- (BOOL)becomeFirstResponder {
    return [self.contentViewController becomeFirstResponder];
}

- (BOOL)canBecomeFirstResponder {
    return [self.contentViewController canBecomeFirstResponder];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return self.contentViewController.preferredStatusBarStyle;
}

- (BOOL)prefersStatusBarHidden {
    return self.contentViewController.prefersStatusBarHidden;
}

- (UIStatusBarAnimation)preferredStatusBarUpdateAnimation {
    return self.contentViewController.preferredStatusBarUpdateAnimation;
}

- (BOOL)hidesBottomBarWhenPushed {
    return self.contentViewController.hidesBottomBarWhenPushed;
}

- (NSString *)title {
    return self.contentViewController.title;
}

- (UITabBarItem *)tabBarItem {
    return self.contentViewController.tabBarItem;
}


@end
