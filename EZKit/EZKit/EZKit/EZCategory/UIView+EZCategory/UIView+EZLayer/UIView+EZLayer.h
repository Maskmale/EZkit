//
//  UIView+EZLayer.h
//  EZKit
//
//  Created by Maskmale on 2019/1/21.
//  Copyright © 2019 Maskmale. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EZ_LayerHelper.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Layer)

@property (nonatomic) EZ_Layer EZ_layerRoundedCorners;                      // 圆角
@property (nonatomic) EZ_Layer EZ_layerBorder;                              // 边框
@property (nonatomic) EZ_Layer EZ_layerShadow;                              // 阴影
@property (nonatomic) EZ_Layer EZ_layerRoundedCornersAndBorder;             // 圆角边框
@property (nonatomic) EZ_Layer EZ_layerRoundedCornersAndShadow;             // 圆角带阴影
@property (nonatomic) EZ_Layer EZ_layerBorderAndShadow;                     // 边框带阴影
@property (nonatomic) EZ_Layer EZ_layerRoundedCornersAndBorderAndShadow;    // 圆角+边框+阴影

@property (nonatomic, assign) BOOL EZ_masksToBounds;


- (void)EZ_removeLayer;


@end

NS_ASSUME_NONNULL_END
