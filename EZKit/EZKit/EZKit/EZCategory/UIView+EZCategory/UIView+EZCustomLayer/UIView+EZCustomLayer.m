//
//  UIView+EZCustomLayer.m
//  EZKit
//
//  Created by Maskmale on 2019/1/24.
//  Copyright © 2019 Maskmale. All rights reserved.
//

#import "UIView+EZCustomLayer.h"

@implementation UIView (EZCustomLayer)

#pragma mark - Other

- (void)EZ_cornerRadius:(CGFloat)cornerRadius byRoundingCorners:(UIRectCorner)corners {
    
    UIBezierPath *cornerRadiusPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corners cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
    
    CAShapeLayer *cornerRadiusLayer = [[CAShapeLayer alloc ] init];
    cornerRadiusLayer.frame = self.bounds;
    cornerRadiusLayer.path = cornerRadiusPath.CGPath; self.layer.mask = cornerRadiusLayer;
}




- (UIView *)EZ_borderForColor:(UIColor *)color
                  borderWidth:(CGFloat)borderWidth
        layerBorderCornerType:(LayerBorderCornerType)layerBorderCornerType {
    
    if (layerBorderCornerType == LayerBorderCornerTypeAll) {
        self.layer.borderWidth = borderWidth;
        self.layer.borderColor = color.CGColor;
        return self;
    }
    
    /// 左侧
    if (layerBorderCornerType & LayerBorderCornerTypeLeft) {
        /// 左侧线路径
        [self.layer addSublayer:[self addLineOriginPoint:CGPointMake(0.f, 0.f) toPoint:CGPointMake(0.0f, self.frame.size.height) color:color borderWidth:borderWidth]];
    }
    
    /// 右侧
    if (layerBorderCornerType & LayerBorderCornerTypeRight) {
        /// 右侧线路径
        [self.layer addSublayer:[self addLineOriginPoint:CGPointMake(self.frame.size.width, 0.0f) toPoint:CGPointMake(self.frame.size.width, self.frame.size.height) color:color borderWidth:borderWidth]];
    }
    
    /// top
    if (layerBorderCornerType & LayerBorderCornerTypeTop) {
        /// top线路径
        [self.layer addSublayer:[self addLineOriginPoint:CGPointMake(0.0f, 0.0f) toPoint:CGPointMake(self.frame.size.width, 0.0f) color:color borderWidth:borderWidth]];
    }
    
    /// bottom
    if (layerBorderCornerType & LayerBorderCornerTypeBottom) {
        /// bottom线路径
        [self.layer addSublayer:[self addLineOriginPoint:CGPointMake(0.0f, self.frame.size.height) toPoint:CGPointMake(self.frame.size.width, self.frame.size.height) color:color borderWidth:borderWidth]];
    }
    
    return self;
}

- (CAShapeLayer *)addLineOriginPoint:(CGPoint)p0
                             toPoint:(CGPoint)p1
                               color:(UIColor *)color
                         borderWidth:(CGFloat)borderWidth {
    
    /// 线的路径
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint:p0];
    [bezierPath addLineToPoint:p1];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.strokeColor = color.CGColor;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    /// 添加路径
    shapeLayer.path = bezierPath.CGPath;
    /// 线宽度
    shapeLayer.lineWidth = borderWidth;
    return shapeLayer;
}


@end
