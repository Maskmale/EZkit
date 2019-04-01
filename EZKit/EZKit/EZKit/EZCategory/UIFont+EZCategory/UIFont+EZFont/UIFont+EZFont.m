//
//  UIFont+EZFont.m
//  TaoBo_Paymet
//
//  Created by Maskmale on 2018/9/16.
//  Copyright © 2018年 Shanghai FairyMo Info Technologies. Ltd. All rights reserved.
//

#import "UIFont+EZFont.h"

@implementation UIFont (EZFont)

+ (UIFont *)EZ_pingFangSCSWithSize:(CGFloat)size {
    
    return [UIFont fontWithName:@"PingFangSC-Semibold" size:size];
}


+ (UIFont *)EZ_pingFangSCRWithSize:(CGFloat)size {
    
    return [UIFont fontWithName:@"PingFangSC-Regular" size:size];
}


+ (UIFont *)EZ_pingFangSCMWithSize:(CGFloat)size {
    
    return [UIFont fontWithName:@"PingFangSC-Medium" size:size];
}

@end
