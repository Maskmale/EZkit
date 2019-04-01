//
//  UINavigationController+EZMethod.m
//  EZKit
//
//  Created by Maskmale on 2019/1/25.
//  Copyright © 2019 Maskmale. All rights reserved.
//

#import "UINavigationController+EZMethod.h"

@implementation UINavigationController (EZMethod)

/**
 返回当前视图控制器堆栈里的某个控制器
 
 @param targetViewController 目标控制器
 */
- (void)EZ_popToTargetViewController:(UIViewController *)targetViewController {
    UIViewController *targetVC = nil;
    
    // 遍历 ViewController
    for (UIViewController *viewController in self.navigationController.viewControllers) {
        // 这里判断是否为你想要跳转的页面
        if ([viewController isKindOfClass:[targetViewController class]]) {
            targetVC = viewController;
        }
    }
    
    if (targetVC) {
        [self.navigationController popToViewController:targetVC animated:YES]; //跳转
    }
}

@end
