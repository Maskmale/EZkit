//
//  UIView+EZLayer.m
//  EZKit
//
//  Created by Maskmale on 2019/1/21.
//  Copyright © 2019 Maskmale. All rights reserved.
//

#import "UIView+EZLayer.h"

@implementation UIView (Layer)

#pragma mark - Getter

- (EZ_Layer)EZ_layerRoundedCorners {
    return self.EZ_layerRoundedCorners;
}

- (EZ_Layer)EZ_layerBorder {
    return self.EZ_layerBorder;
}

- (EZ_Layer)EZ_layerShadow {
    return self.EZ_layerShadow;
}

- (EZ_Layer)EZ_layerRoundedCornersAndBorder {
    return self.EZ_layerRoundedCornersAndBorder;
}


- (EZ_Layer)EZ_layerRoundedCornersAndShadow {
    return self.EZ_layerRoundedCornersAndShadow;
}


- (EZ_Layer)EZ_layerBorderAndShadow {
    return self.EZ_layerBorderAndShadow;
}


- (EZ_Layer)EZ_layerRoundedCornersAndBorderAndShadow {
    
    return self.EZ_layerRoundedCornersAndBorderAndShadow;
}


-(BOOL)EZ_masksToBounds {
    return self.EZ_masksToBounds;
}



#pragma mark - Setter

- (void)setEZ_layerRoundedCorners:(EZ_Layer)EZ_layerRoundedCorners {
    [self EZ_cornerRadius:EZ_layerRoundedCorners.cornerRadius];
}


- (void)setEZ_layerBorder:(EZ_Layer)EZ_layerBorder {
    [self EZ_borderWidth:EZ_layerBorder.borderWidth
             borderColor:EZ_layerBorder.borderColor];
}


- (void)setEZ_layerShadow:(EZ_Layer)EZ_layerShadow {
    [self EZ_shadowColor:EZ_layerShadow.shadowColor
            shadowRadius:EZ_layerShadow.shadowRadius shadowOffset:EZ_layerShadow.shadowOffset
           shadowOpacity:EZ_layerShadow.shadowOpacity];
}


- (void)setEZ_layerRoundedCornersAndBorder:(EZ_Layer)EZ_layerRoundedCornersAndBorder {
    [self EZ_cornerRadius:EZ_layerRoundedCornersAndBorder.cornerRadius
              borderWidth:EZ_layerRoundedCornersAndBorder.borderWidth
              borderColor:EZ_layerRoundedCornersAndBorder.borderColor];
}


- (void)setEZ_layerRoundedCornersAndShadow:(EZ_Layer)EZ_layerRoundedCornersAndShadow {
    [self EZ_cornerRadius:EZ_layerRoundedCornersAndShadow.cornerRadius
              shadowColor:EZ_layerRoundedCornersAndShadow.shadowColor
             shadowRadius:EZ_layerRoundedCornersAndShadow.shadowRadius
             shadowOffset:EZ_layerRoundedCornersAndShadow.shadowOffset
            shadowOpacity:EZ_layerRoundedCornersAndShadow.shadowOpacity];
}


- (void)setEZ_layerBorderAndShadow:(EZ_Layer)EZ_layerBorderAndShadow {
    [self EZ_borderWidth:EZ_layerBorderAndShadow.borderWidth
             borderColor:EZ_layerBorderAndShadow.borderColor
             shadowColor:EZ_layerBorderAndShadow.shadowColor
            shadowRadius:EZ_layerBorderAndShadow.shadowRadius
            shadowOffset:EZ_layerBorderAndShadow.shadowOffset
           shadowOpacity:EZ_layerBorderAndShadow.shadowOpacity];
}


- (void)setEZ_layerRoundedCornersAndBorderAndShadow:(EZ_Layer)EZ_layerRoundedCornersAndBorderAndShadow {
    [self EZ_cornerRadius:EZ_layerRoundedCornersAndBorderAndShadow.cornerRadius
              borderWidth:EZ_layerRoundedCornersAndBorderAndShadow.borderWidth
              borderColor:EZ_layerRoundedCornersAndBorderAndShadow.borderColor
              shadowColor:EZ_layerRoundedCornersAndBorderAndShadow.shadowColor
             shadowRadius:EZ_layerRoundedCornersAndBorderAndShadow.shadowRadius
             shadowOffset:EZ_layerRoundedCornersAndBorderAndShadow.shadowOffset
            shadowOpacity:EZ_layerRoundedCornersAndBorderAndShadow.shadowOpacity];
}


- (void)setEZ_masksToBounds:(BOOL)EZ_masksToBounds {
    self.layer.masksToBounds = EZ_masksToBounds;
}



#pragma mark - Public Methods

/**
 移除样式
 */
- (void)EZ_removeLayer {
    
    self.EZ_layerRoundedCornersAndBorderAndShadow = (EZ_Layer){
        .cornerRadius = 0,
        .borderWidth = 0,
        .borderColor = [UIColor clearColor],
        .shadowRadius = 0,
        .shadowColor = [UIColor clearColor],
        .shadowOffset = CGSizeZero,
        .shadowOpacity = .0
    };
    self.layer.masksToBounds = NO;
}



#pragma mark - Private Methods
/**
 创建圆角 Layer;
 
 @param cornerRadius 圆角半径;
 */
- (void)EZ_cornerRadius:(CGFloat)cornerRadius {
    self.layer.cornerRadius = cornerRadius;
}


/**
 创建描边的 Layer;
 
 @param borderWidth 边框宽度;
 @param borderColor 边框颜色;
 */
- (void)EZ_borderWidth:(CGFloat)borderWidth
        borderColor:(UIColor *)borderColor {
    self.layer.borderWidth = borderWidth;
    self.layer.borderColor = borderColor.CGColor;
}
    

/**
 创建圆角带描边的 Layer;
 
 @param cornerRadius  圆角半径;
 @param borderWidth   边框宽度;
 @param borderColor   边框颜色;
 */
- (void)EZ_cornerRadius:(CGFloat)cornerRadius
         borderWidth:(CGFloat)borderWidth
         borderColor:(UIColor *)borderColor {
    [self EZ_cornerRadius:cornerRadius];
    [self EZ_borderWidth:borderWidth
          borderColor:borderColor];
}


/**
 创建阴影 Layer
 
 @param shadowColor    阴影颜色;
 @param shadowRadius   圆角半径;
 @param shadowOffset   阴影偏移量;
 @param shadowOpacity  阴影透明度;
 */
- (void)EZ_shadowColor:(UIColor *)shadowColor
       shadowRadius:(CGFloat)shadowRadius
       shadowOffset:(CGSize)shadowOffset
      shadowOpacity:(CGFloat)shadowOpacity {
    
    self.layer.shadowColor = shadowColor.CGColor;
    self.layer.shadowRadius = shadowRadius;
    self.layer.shadowOffset = shadowOffset;
    self.layer.shadowOpacity = shadowOpacity;
}


/**
 创建圆角带阴影的 Layer
 
 @param cornerRadius    圆角半径
 @param shadowColor     阴影颜色
 @param shadowRadius    圆角半径
 @param shadowOffset    阴影偏移量
 @param shadowOpacity   阴影透明度
 */
- (void)EZ_cornerRadius:(CGFloat)cornerRadius
         shadowColor:(UIColor *)shadowColor
        shadowRadius:(CGFloat)shadowRadius
        shadowOffset:(CGSize)shadowOffset
       shadowOpacity:(CGFloat)shadowOpacity {
    
    [self EZ_cornerRadius:cornerRadius];
    [self EZ_shadowColor:shadowColor
         shadowRadius:shadowRadius
         shadowOffset:shadowOffset
        shadowOpacity:shadowOpacity];
}


/**
 创建描边带阴影的 Layer
 
 @param borderWidth     边框宽度
 @param borderColor     边框颜色
 @param shadowColor     阴影颜色
 @param shadowRadius    圆角半径
 @param shadowOffset    阴影偏移量
 @param shadowOpacity   阴影透明度
 */
- (void)EZ_borderWidth:(CGFloat)borderWidth
        borderColor:(UIColor *)borderColor
        shadowColor:(UIColor *)shadowColor
       shadowRadius:(CGFloat)shadowRadius
       shadowOffset:(CGSize)shadowOffset
      shadowOpacity:(CGFloat)shadowOpacity {
    
    [self EZ_borderWidth:borderWidth
          borderColor:borderColor];
    [self EZ_shadowColor:shadowColor
         shadowRadius:shadowRadius
         shadowOffset:shadowOffset
        shadowOpacity:shadowOpacity];
}


/**
 创建圆角描边带阴影的 Layer
 
 @param cornerRadius    圆角半径
 @param borderWidth     边框宽度
 @param borderColor     边框颜色
 @param shadowColor     阴影颜色
 @param shadowRadius    圆角半径
 @param shadowOffset    阴影偏移量
 @param shadowOpacity   阴影透明度
 */
- (void)EZ_cornerRadius:(CGFloat)cornerRadius
         borderWidth:(CGFloat)borderWidth
         borderColor:(UIColor *)borderColor
         shadowColor:(UIColor *)shadowColor
        shadowRadius:(CGFloat)shadowRadius
        shadowOffset:(CGSize)shadowOffset
       shadowOpacity:(CGFloat)shadowOpacity {

    [self EZ_cornerRadius:cornerRadius
           borderWidth:borderWidth
           borderColor:borderColor];
    [self EZ_shadowColor:shadowColor
         shadowRadius:shadowRadius
         shadowOffset:shadowOffset
        shadowOpacity:shadowOpacity];
}




@end
