//
//  UIView+EZMethod.m
//  EZKit
//
//  Created by Maskmale on 2019/1/25.
//  Copyright © 2019 Maskmale. All rights reserved.
//

#import "UIView+EZMethod.h"

@implementation UIView (EZMethod)

- (void)EZ_removeAllSubviews {
    while (self.subviews.count) {
        UIView* child = self.subviews.lastObject;
        [child removeFromSuperview];
    }
}

@end
