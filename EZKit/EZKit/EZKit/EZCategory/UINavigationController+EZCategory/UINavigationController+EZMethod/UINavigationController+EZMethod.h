//
//  UINavigationController+EZMethod.h
//  EZKit
//
//  Created by Maskmale on 2019/1/25.
//  Copyright © 2019 Maskmale. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UINavigationController (EZMethod)

- (void)EZ_popToTargetViewController:(UIViewController *)targetViewController;

@end

NS_ASSUME_NONNULL_END
