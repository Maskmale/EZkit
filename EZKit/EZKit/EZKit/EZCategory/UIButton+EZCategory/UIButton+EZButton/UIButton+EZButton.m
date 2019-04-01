//
//  UIButton+EZButton.h
//
//
//  Created by Maskmale on 2018/9/4.
//  Copyright © 2018年 Maskmale. All rights reserved.
//

#import "UIButton+EZButton.h"

@implementation UIButton (EZButton)

- (void)setEZ_ImageName:(nullable NSString *)imageName forState:(UIControlState)state {
    [self setImage:[UIImage imageNamed:imageName] forState:state];
}


- (void)setEZ_BackgroundImage:(nullable NSString *)imageName forState:(UIControlState)state {
    [self setBackgroundImage:[UIImage imageNamed:imageName] forState:state];
}


- (void)setEZ_ButtonEdgeInsetsWithStyle:(EZ_ButtonEdgeInsetsStyle)style
                                  space:(CGFloat)space {
    /**
     *  前置知识点：titleEdgeInsets 是 title 相对于其上下左右的 inset，跟 tableView 的 contentInset 是类似的;
     
     *  如果只有 title，那它上下左右都是相对于 button 的，image 也是一样;
     
     *  如果同时有 image 和 label，那这时候 image 的上左下是相对于 button，右边是相对于 label 的；title 的上右下是相对于 button，左边是相对于 image 的;
     */
    
    switch (style) {
        case EZ_ButtonEdgeInsetsStyleTop:
            [self setEZ_ButtonStyleTopWithSpacing:space];
            break;
        case EZ_ButtonEdgeInsetsStyleLeft:
            [self setEZ_ButtonStyleLeftWithSpacing:space];
            break;
        case EZ_ButtonEdgeInsetsStyleBottom:
            [self setEZ_ButtonStyleBottomWithSpacing:space];
            break;
        case EZ_ButtonEdgeInsetsStyleRight:
            [self setEZ_ButtonStyleRightSpacing:space];
            break;
        default:
            break;
    }
}


- (void)setEZ_ButtonStyleLeftWithSpacing:(CGFloat)spacing {
    self.titleEdgeInsets = (UIEdgeInsets){
        .top    =   0,
        .left   =   (spacing / 2),
        .bottom =   0,
        .right  = - (spacing / 2),
    };
    
    self.imageEdgeInsets = (UIEdgeInsets){
        .top    =   0,
        .left   = - (spacing / 2),
        .bottom =   0,
        .right  =   (spacing / 2),
    };
}

- (void)setEZ_ButtonStyleRightSpacing:(CGFloat)spacing {
    CGFloat img_W = self.imageView.frame.size.width;
    CGFloat tit_W = self.titleLabel.frame.size.width;
    
    self.titleEdgeInsets = (UIEdgeInsets){
        .top    =   0,
        .left   = - (img_W + spacing / 2),
        .bottom =   0,
        .right  =   (img_W + spacing / 2),
    };
    
    self.imageEdgeInsets = (UIEdgeInsets){
        .top    =   0,
        .left   =   (tit_W + spacing / 2),
        .bottom =   0,
        .right  = - (tit_W + spacing / 2),
    };
}


- (void)setEZ_ButtonStyleTopWithSpacing:(CGFloat)spacing {
    CGFloat img_W = self.imageView.frame.size.width;
    CGFloat img_H = self.imageView.frame.size.height;
    CGFloat tit_W = self.titleLabel.frame.size.width;
    CGFloat tit_H = self.titleLabel.frame.size.height;
    
    self.titleEdgeInsets = (UIEdgeInsets){
        .top    =   (tit_H / 2 + spacing / 2),
        .left   = - (img_W / 2),
        .bottom = - (tit_H / 2 + spacing / 2),
        .right  =   (img_W / 2),
    };
    
    self.imageEdgeInsets = (UIEdgeInsets){
        .top    = - (img_H / 2 + spacing / 2),
        .left   =   (tit_W / 2),
        .bottom =   (img_H / 2 + spacing / 2),
        .right  = - (tit_W / 2),
    };
}


- (void)setEZ_ButtonStyleBottomWithSpacing:(CGFloat)spacing {
    CGFloat img_W = self.imageView.frame.size.width;
    CGFloat img_H = self.imageView.frame.size.height;
    CGFloat tit_W = self.titleLabel.frame.size.width;
    CGFloat tit_H = self.titleLabel.frame.size.height;

    self.titleEdgeInsets = (UIEdgeInsets){
        .top    = - (tit_H / 2 + spacing / 2),
        .left   = - (img_W / 2),
        .bottom =   (tit_H / 2 + spacing / 2),
        .right  =   (img_W / 2),
    };
    
    self.imageEdgeInsets = (UIEdgeInsets){
        .top    =   (img_H / 2 + spacing / 2),
        .left   =   (tit_W / 2),
        .bottom = - (img_H / 2 + spacing / 2),
        .right  = - (tit_W / 2),
    };
}

@end
