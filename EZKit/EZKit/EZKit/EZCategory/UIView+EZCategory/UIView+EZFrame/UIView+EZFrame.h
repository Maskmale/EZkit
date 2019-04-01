//  EZKit
//
//  Created by Maskmale on 2019/1/21.
//  Copyright © 2019 Maskmale. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (EZFrame)

@property(nonatomic) CGFloat EZ_left;
@property(nonatomic) CGFloat EZ_top;
@property(nonatomic) CGFloat EZ_right;
@property(nonatomic) CGFloat EZ_bottom;

@property(nonatomic) CGFloat EZ_width;
@property(nonatomic) CGFloat EZ_height;

@property(nonatomic) CGFloat EZ_centerX;
@property(nonatomic) CGFloat EZ_centerY;

@property(nonatomic,readonly) CGFloat EZ_screenX;
@property(nonatomic,readonly) CGFloat EZ_screenY;
@property(nonatomic,readonly) CGFloat EZ_screenViewX;
@property(nonatomic,readonly) CGFloat EZ_screenViewY;
@property(nonatomic,readonly) CGRect EZ_screenFrame;

@property(nonatomic) CGPoint EZ_origin;
@property(nonatomic) CGSize EZ_size;


@end

NS_ASSUME_NONNULL_END


