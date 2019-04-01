//
//  UIButton+EZButton.h
//
//
//  Created by Maskmale on 2018/9/4.
//  Copyright © 2018年 Maskmale. All rights reserved.
//
// Spacing 是图片和标题间的间隔

#import <UIKit/UIKit.h>
#import "EZButtonHelper.h"

@interface UIButton (EZButton)

- (void)setEZ_ImageName:(nullable NSString *)imageName forState:(UIControlState)state;

- (void)setEZ_BackgroundImage:(nullable NSString *)imageName forState:(UIControlState)state;

/**
 *  设置 UIButton 的 title 和 iCon 的布局样式，及间距
 *
 *  @param style title 和 iCon 的布局样式
 *  @param space title 和 iCon 之间的间距
 */
- (void)setEZ_ButtonEdgeInsetsWithStyle:(EZ_ButtonEdgeInsetsStyle)style
                                  space:(CGFloat)space;

@end
