//  EZKit
//
//  Created by Maskmale on 2019/1/21.
//  Copyright © 2019 Maskmale. All rights reserved.
//

#import "UIView+EZFrame.h"

@implementation UIView (EZFrame)

#pragma mark - getter

- (CGFloat)EZ_left {
    return self.frame.origin.x;
}


- (CGFloat)EZ_top {
    return self.frame.origin.y;
}


- (CGFloat)EZ_right {
    return self.frame.origin.x + self.frame.size.width;
}


- (CGFloat)EZ_bottom {
    return self.frame.origin.y + self.frame.size.height;
}


- (CGFloat)EZ_centerX {
    return self.center.x;
}


- (CGFloat)EZ_centerY {
    return self.center.y;
}


- (CGFloat)EZ_width {
    return self.frame.size.width;
}


- (CGFloat)EZ_height {
    return self.frame.size.height;
}


- (CGFloat)EZ_screenX {
    CGFloat x = 0;
    for (UIView* view = self; view; view = view.superview) {
        x += view.EZ_left;
    }
    return x;
}


- (CGFloat)EZ_screenY {
    CGFloat y = 0;
    for (UIView* view = self; view; view = view.superview) {
        y += view.EZ_top;
    }
    return y;
}


- (CGFloat)EZ_screenViewX {
    CGFloat x = 0;
    for (UIView* view = self; view; view = view.superview) {
        x += view.EZ_left;
        
        if ([view isKindOfClass:[UIScrollView class]]) {
            UIScrollView* scrollView = (UIScrollView*)view;
            x -= scrollView.contentOffset.x;
        }
    }
    
    return x;
}


- (CGRect)EZ_screenFrame {
    return CGRectMake(self.EZ_screenViewX, self.EZ_screenViewY, self.EZ_width, self.EZ_height);
}


- (CGPoint)EZ_origin {
    return self.frame.origin;
}


- (CGFloat)EZ_screenViewY {
    CGFloat y = 0;
    for (UIView* view = self; view; view = view.superview) {
        y += view.EZ_top;
        
        if ([view isKindOfClass:[UIScrollView class]]) {
            UIScrollView* scrollView = (UIScrollView*)view;
            y -= scrollView.contentOffset.y;
        }
    }
    return y;
}


- (CGSize)EZ_size {
    return self.frame.size;
}



#pragma mark - setter

- (void)setEZ_left:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (void)setEZ_top:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}


- (void)setEZ_right:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}


- (void)setEZ_bottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}


- (void)setEZ_centerX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.center.y);
}


- (void)setEZ_centerY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, centerY);
}


- (void)setEZ_width:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}


- (void)setEZ_height:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}


- (void)setEZ_origin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}


- (void)setEZ_size:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}


@end
