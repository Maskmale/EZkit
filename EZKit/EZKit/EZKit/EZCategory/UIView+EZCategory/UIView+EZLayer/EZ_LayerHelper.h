//
//  EZ_LayerHelper.h
//  EZKit
//
//  Created by Maskmale on 2019/1/24.
//  Copyright © 2019 Maskmale. All rights reserved.
//

#ifndef EZ_LayerHelper_h
#define EZ_LayerHelper_h



typedef struct EZ_Layer {
    CGFloat cornerRadius;               // 圆角半径
    CGFloat borderWidth;                // 边框宽度
    UIColor *borderColor;               // 边框颜色
    CGFloat shadowRadius;               // 阴影颜色
    UIColor *shadowColor;               // 圆角半径
    CGSize shadowOffset;                // 阴影偏移量
    CGFloat shadowOpacity;              // 阴影透明度
} EZ_Layer;

UIKIT_STATIC_INLINE EZ_Layer EZLayerMake(CGFloat cornerRadius,
                                         CGFloat borderWidth,
                                         UIColor *borderColor,
                                         CGFloat shadowRadius,
                                         UIColor *shadowColor,
                                         CGSize shadowOffset,
                                         CGFloat shadowOpacity) {
    EZ_Layer insets = {
        cornerRadius,
        borderWidth,
        borderColor,
        shadowRadius,
        shadowColor,
        shadowOffset,
        shadowOpacity};
    return insets;
}


#endif /* EZ_LayerHelper_h */
