//
//  UIColor+EZColor.m
//
//
//  Created by Maskmale on 2018/9/4.
//  Copyright © 2018年 Maskmale. All rights reserved.
//
// 颜色转换：iOS中十六进制的颜色转换为UIColor(RGB)

#import "UIColor+EZColor.h"

@implementation UIColor (EZColor)

- (CGFloat)EZ_red {
    CGFloat rgba[4];
    [self getRGBAComponents:rgba];
    return rgba[0];
}


- (CGFloat)EZ_green {
    CGFloat rgba[4];
    [self getRGBAComponents:rgba];
    return rgba[1];
}


- (CGFloat)EZ_blue {
    CGFloat rgba[4];
    [self getRGBAComponents:rgba];
    return rgba[2];
}


- (CGFloat)EZ_alpha {
    return CGColorGetAlpha(self.CGColor);
}


+ (UIColor*)EZ_colorWithHex:(long)hexColor {
    return [UIColor EZ_colorWithHex:hexColor alpha:1.];
}


+ (UIColor *)EZ_colorWithHex:(long)hexColor
                       alpha:(float)opacity {
    float red = ((float)((hexColor & 0xFF0000) >> 16))/255.0;
    float green = ((float)((hexColor & 0xFF00) >> 8))/255.0;
    float blue = ((float)(hexColor & 0xFF))/255.0;
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:opacity];
}


+ (UIColor *)EZ_colorWithHexString:(NSString *)color {
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    
    // 判断前缀并剪切掉
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return [UIColor clearColor];
    
    // 从六位数值中找到RGB对应的位数并转换
    NSRange range;
    range.location = 0;
    range.length = 2;
    
    //R、G、B
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:1.0f];
}


+ (UIColor *)EZ_colorWithRed:(CGFloat)red
                       green:(CGFloat)green
                        blue:(CGFloat)blue {
    return [self EZ_colorWithRed:red green:green blue:blue alpha:1.];
}


+ (UIColor *)EZ_colorWithRed:(CGFloat)red
                       green:(CGFloat)green
                        blue:(CGFloat)blue
                       alpha:(CGFloat)alpha {
    return [UIColor colorWithRed:red / 255.0 green:green / 255.0 blue:blue / 255.0 alpha:alpha];
}


+ (UIColor *)EZ_grayColor:(CGFloat)color {
    return [self EZ_colorWithRed:color green:color blue:color];
}


+ (UIColor *)EZ_randomColor {
    return [self EZ_colorWithRed:arc4random_uniform(255) green:arc4random_uniform(255) blue:arc4random_uniform(255)];
}


+ (NSMutableDictionary *)standardColors {
    static NSMutableDictionary *colors = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        colors = [@{@"black": [self blackColor], // 0.0 white
                    @"darkgray": [self darkGrayColor], // 0.333 white
                    @"lightgray": [self lightGrayColor], // 0.667 white
                    @"white": [self whiteColor], // 1.0 white
                    @"gray": [self grayColor], // 0.5 white
                    @"red": [self redColor], // 1.0, 0.0, 0.0 RGB
                    @"green": [self greenColor], // 0.0, 1.0, 0.0 RGB
                    @"blue": [self blueColor], // 0.0, 0.0, 1.0 RGB
                    @"cyan": [self cyanColor], // 0.0, 1.0, 1.0 RGB
                    @"yellow": [self yellowColor], // 1.0, 1.0, 0.0 RGB
                    @"magenta": [self magentaColor], // 1.0, 0.0, 1.0 RGB
                    @"orange": [self orangeColor], // 1.0, 0.5, 0.0 RGB
                    @"purple": [self purpleColor], // 0.5, 0.0, 0.5 RGB
                    @"brown": [self brownColor], // 0.6, 0.4, 0.2 RGB
                    @"clear": [self clearColor]} mutableCopy];
    });
    
    return colors;
}


- (void)getRGBAComponents:(CGFloat[4])rgba {
    CGColorSpaceModel model = CGColorSpaceGetModel(CGColorGetColorSpace(self.CGColor));
    const CGFloat *components = CGColorGetComponents(self.CGColor);
    
    switch (model) {
        case kCGColorSpaceModelMonochrome:
        {
            rgba[0] = components[0];
            rgba[1] = components[0];
            rgba[2] = components[0];
            rgba[3] = components[1];
            break;
        }
        case kCGColorSpaceModelRGB:
        {
            rgba[0] = components[0];
            rgba[1] = components[1];
            rgba[2] = components[2];
            rgba[3] = components[3];
            break;
        }
        default:
        {
            
#ifdef DEBUG
            
            //unsupported format
            NSLog(@"Unsupported color model: %i", model);
#endif
            rgba[0] = 0.0f;
            rgba[1] = 0.0f;
            rgba[2] = 0.0f;
            rgba[3] = 1.0f;
            break;
        }
    }
}


+ (void)registerColor:(UIColor *)color
              forName:(NSString *)name {
    name = [name lowercaseString];
    
#ifdef DEBUG
    
    //don't allow re-registration
    NSAssert([self standardColors][name] == nil || [[self standardColors][name] isEquivalentToColor:color],
             @"Cannot re-register the color '%@' as this is already assigned", name);
    
#endif
    
    [self standardColors][[name lowercaseString]] = color;
}


+ (UIColor *)colorWithString:(NSString *)string {
    //convert to lowercase
    string = [string lowercaseString];
    
    //try standard colors first
    UIColor *color = [self standardColors][string];
    
    if (color)
    {
        return color;
    }
    
    //create new instance
    return [[self alloc] initWithString:string];
}


+ (UIColor *)colorWithRGBValue:(uint32_t)rgb {
    return [[self alloc] initWithRGBValue:rgb];
}


+ (UIColor *)colorWithRGBAValue:(uint32_t)rgba {
    return [[self alloc] initWithRGBAValue:rgba];
}

- (UIColor *)initWithString:(NSString *)string {
    //convert to lowercase
    string = [string lowercaseString];
    
    //try standard colors
    UIColor *color = [[self class] standardColors][string];
    
    if (color) {
        return ((self = color));
    }
    
    //try hex
    string = [string stringByReplacingOccurrencesOfString:@"#" withString:@""];
    string = [string stringByReplacingOccurrencesOfString:@"0x" withString:@""];
    
    switch ([string length]) {
        case 0:
        {
            string = @"00000000";
            break;
        }
        case 3:
        {
            NSString *red = [string substringWithRange:NSMakeRange(0, 1)];
            NSString *green = [string substringWithRange:NSMakeRange(1, 1)];
            NSString *blue = [string substringWithRange:NSMakeRange(2, 1)];
            string = [NSString stringWithFormat:@"%1$@%1$@%2$@%2$@%3$@%3$@ff", red, green, blue];
            break;
        }
        case 6:
        {
            string = [string stringByAppendingString:@"ff"];
            break;
        }
        case 8:
        {
            //do nothing
            break;
        }
        default:
        {
            
#ifdef DEBUG
            
            //unsupported format
            NSLog(@"Unsupported color string format: %@", string);
#endif
            return nil;
        }
    }
    uint32_t rgba;
    NSScanner *scanner = [NSScanner scannerWithString:string];
    [scanner scanHexInt:&rgba];
    return [self initWithRGBAValue:rgba];
}


- (UIColor *)initWithRGBValue:(uint32_t)rgb {
    CGFloat red = ((rgb & 0xFF0000) >> 16) / 255.0f;
    CGFloat green = ((rgb & 0x00FF00) >> 8) / 255.0f;
    CGFloat blue = (rgb & 0x0000FF) / 255.0f;
    return [self initWithRed:red green:green blue:blue alpha:1.0f];
}


- (UIColor *)initWithRGBAValue:(uint32_t)rgba {
    CGFloat red = ((rgba & 0xFF000000) >> 24) / 255.0f;
    CGFloat green = ((rgba & 0x00FF0000) >> 16) / 255.0f;
    CGFloat blue = ((rgba & 0x0000FF00) >> 8) / 255.0f;
    CGFloat alpha = (rgba & 0x000000FF) / 255.0f;
    return [self initWithRed:red green:green blue:blue alpha:alpha];
}


- (uint32_t)RGBValue {
    CGFloat rgba[4];
    [self getRGBAComponents:rgba];
    uint8_t red = rgba[0]*255;
    uint8_t green = rgba[1]*255;
    uint8_t blue = rgba[2]*255;
    return (red << 16) + (green << 8) + blue;
}

- (uint32_t)RGBAValue {
    CGFloat rgba[4];
    [self getRGBAComponents:rgba];
    uint8_t red = rgba[0]*255;
    uint8_t green = rgba[1]*255;
    uint8_t blue = rgba[2]*255;
    uint8_t alpha = rgba[3]*255;
    return (red << 24) + (green << 16) + (blue << 8) + alpha;
}

- (NSString *)stringValue {
    //try standard colors
    NSUInteger index = [[[[self class] standardColors] allValues] indexOfObject:self];
    
    if (index != NSNotFound)
    {
        return [[[self class] standardColors] allKeys][index];
    }
    
    //convert to hex
    if (self.EZ_alpha < 1.0f)
    {
        //include alpha component
        return [NSString stringWithFormat:@"#%.8x", self.RGBAValue];
    }
    else
    {
        //don't include alpha component
        return [NSString stringWithFormat:@"#%.6x", self.RGBValue];
    }
}


- (BOOL)isMonochromeOrRGB {
    CGColorSpaceModel model = CGColorSpaceGetModel(CGColorGetColorSpace(self.CGColor));
    return model == kCGColorSpaceModelMonochrome || model == kCGColorSpaceModelRGB;
}


- (BOOL)isEquivalent:(id)object {
    if ([object isKindOfClass:[self class]])
    {
        return [self isEquivalentToColor:object];
    }
    return NO;
}


- (BOOL)isEquivalentToColor:(UIColor *)color {
    if ([self isMonochromeOrRGB] && [color isMonochromeOrRGB])
    {
        return self.RGBAValue == color.RGBAValue;
    }
    return [self isEqual:color];
}


- (UIColor *)colorWithBrightness:(CGFloat)brightness {
    brightness = fminf(fmaxf(brightness, 0.0f), 1.0f);
    
    CGFloat rgba[4];
    [self getRGBAComponents:rgba];
    
    return [[self class] colorWithRed:rgba[0] * brightness
                                green:rgba[1] * brightness
                                 blue:rgba[2] * brightness
                                alpha:rgba[3]];
}

- (UIColor *)colorBlendedWithColor:(UIColor *)color
                            factor:(CGFloat)factor {
    factor = fminf(fmaxf(factor, 0.0f), 1.0f);
    
    CGFloat fromRGBA[4], toRGBA[4];
    [self getRGBAComponents:fromRGBA];
    [color getRGBAComponents:toRGBA];
    
    return [[self class] colorWithRed:fromRGBA[0] + (toRGBA[0] - fromRGBA[0]) * factor
                                green:fromRGBA[1] + (toRGBA[1] - fromRGBA[1]) * factor
                                 blue:fromRGBA[2] + (toRGBA[2] - fromRGBA[2]) * factor
                                alpha:fromRGBA[3] + (toRGBA[3] - fromRGBA[3]) * factor];
}

//+ (UIColor *)themeColorNamed:(NSString *)key
//{
//    return [UIColor colorWithString:[JLThemeManagerSingeton.styles objectForKey:key]];
//}
@end
