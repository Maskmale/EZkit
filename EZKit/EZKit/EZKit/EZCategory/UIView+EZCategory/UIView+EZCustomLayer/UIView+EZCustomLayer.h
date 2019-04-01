//
//  UIView+EZCustomLayer.h
//  EZKit
//
//  Created by Maskmale on 2019/1/24.
//  Copyright © 2019 Maskmale. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EZ_CustomLayerHelper.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIView (EZCustomLayer)

- (void)EZ_cornerRadius:(CGFloat)cornerRadius byRoundingCorners:(UIRectCorner)corners;

- (UIView *)EZ_borderForColor:(UIColor *)color
                  borderWidth:(CGFloat)borderWidth
        layerBorderCornerType:(LayerBorderCornerType)borderType;

@end

NS_ASSUME_NONNULL_END
