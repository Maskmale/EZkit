//
//  UIColor+EZColor.h
//
//
//  Created by Maskmale on 2018/9/4.
//  Copyright © 2018年 Maskmale. All rights reserved.
//
// 颜色转换：iOS中十六进制的颜色转换为UIColor(RGB)

#import <UIKit/UIKit.h>

@interface UIColor (EZColor)

@property (nonatomic, readonly) CGFloat EZ_red;
@property (nonatomic, readonly) CGFloat EZ_green;
@property (nonatomic, readonly) CGFloat EZ_blue;
@property (nonatomic, readonly) CGFloat EZ_alpha;

/**
 透明度固定为 1，以 0x 开头的十六进制转换成的颜色

 @param hexColor hexColorStr
 @return UIColor
 */
+ (UIColor *)EZ_colorWithHex:(long)hexColor;


/**
 0x 开头的十六进制转换成的颜色,透明度可调整

 @param hexColor hexColorStr
 @param opacity alpha
 @return UIColor
 */
+ (UIColor *)EZ_colorWithHex:(long)hexColor alpha:(float)opacity;


/**
 颜色转换三：iOS 中十六进制的颜色（以 # 开头）转换为 UIColor

 @param color hexColorStr
 @return UIColor
 */
+ (UIColor *)EZ_colorWithHexString: (NSString *)color;


/**
 RGB Color

 @param red red
 @param green green
 @param blue blue
 @return UIColor
 */
+ (UIColor *)EZ_colorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue;


/**
 RGB Color
 
 @param red red
 @param green green
 @param blue blue
 @param alpha alpha
 @return UIColor
 */
+ (UIColor *)EZ_colorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;


/**
 灰度色

 @param color 灰度
 @return 灰度色
 */
+ (UIColor *)EZ_grayColor:(CGFloat)color;


// 随机色

/**
 Random Color

 @return Random Color
 */
+ (UIColor *)EZ_randomColor;



+ (void)registerColor:(UIColor *)color forName:(NSString *)name;

+ (UIColor *)colorWithString:(NSString *)string;
+ (UIColor *)colorWithRGBValue:(uint32_t)rgb;
+ (UIColor *)colorWithRGBAValue:(uint32_t)rgba;
- (UIColor *)initWithString:(NSString *)string;
- (UIColor *)initWithRGBValue:(uint32_t)rgb;
- (UIColor *)initWithRGBAValue:(uint32_t)rgba;

- (uint32_t)RGBValue;
- (uint32_t)RGBAValue;
- (NSString *)stringValue;

- (BOOL)isMonochromeOrRGB;
- (BOOL)isEquivalent:(id)object;
- (BOOL)isEquivalentToColor:(UIColor *)color;

- (UIColor *)colorWithBrightness:(CGFloat)brightness;
- (UIColor *)colorBlendedWithColor:(UIColor *)color factor:(CGFloat)factor;

//+ (UIColor *)themeColorNamed:(NSString *)key;
@end
