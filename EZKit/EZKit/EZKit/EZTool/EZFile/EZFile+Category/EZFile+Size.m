//
//  IOFile+Size.m
//  IO
//
//  Created by Maskmale on 2019/2/9.
//  Copyright © 2019 Maskmale. All rights reserved.
//
//https://baike.baidu.com/item/存储单位/3943356?fr=aladdin#2

//KB：全称千字节（Kbyte）；
//MB：全称兆字节（MByte）；
//GB：全称吉字节（GByte）。
//都是计算机存储容量单位，一般用字节(Byte)、千字节(KB)、兆字节(MB)、吉字节(GB)、太字节(TB)、拍字节(PB)、艾字节(EB)、泽它字节(ZB，又称皆字节)、尧它字节(YB)表示。

//计算机容量单位的换算关系是：
//1B=1byte=8bit
//1KB (Kilobyte 千字节)=1024B，
//1MB (Megabyte 兆字节 简称“兆”)=1024KB，
//1GB (Gigabyte 吉字节 又称“千兆”)=1024MB，
//1TB (Trillionbyte 万亿字节 太字节)=1024GB，其中1024=2^10 (2 的10次方)，
//1PB（Petabyte 千万亿字节 拍字节）=1024TB，
//1EB（Exabyte 百亿亿字节 艾字节）=1024PB，
//1ZB (Zettabyte 十万亿亿字节 泽字节)= 1024 EB,
//1YB (Yottabyte 一亿亿亿字节 尧字节)= 1024 ZB,
//1BB (Brontobyte 一千亿亿亿字节)= 1024 YB.

#define K_Base 1000  // 格式化文件大小时用

#import "EZFile.h"

@implementation EZFile (Size)

+ (NSString *)sizeFormatted:(NSNumber *)size {
    //TODO if OS X 10.8 or iOS 6
    //return [NSByteCountFormatter stringFromByteCount:[size intValue] countStyle:NSByteCountFormatterCountStyleFile];
    
    double convertedValue = [size doubleValue];
    if (convertedValue == 0) {
        
        return @"0 B";
    }
    
    int multiplyFactor = 0;
    
    NSArray *tokens = @[@"B", @"KB", @"MB", @"GB", @"TB", @"PB", @"EB", @"ZB", @"YB", @"BB"];
    
    while(convertedValue > K_Base) {
        convertedValue /= K_Base;
        
        multiplyFactor++;
    }
    
    NSString *sizeFormat = ((multiplyFactor > 1) ? @"%4.2f" : @"%4.0f");
    NSString *sizeFormatStr = [NSString stringWithFormat:sizeFormat, convertedValue];
    
    sizeFormatStr = [sizeFormatStr stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    sizeFormatStr = [NSString stringWithFormat:@"%@ %@",sizeFormatStr,tokens[multiplyFactor]];
    
    return sizeFormatStr;
}


+ (NSString *)sizeFormattedOfDirectoryAtPath:(NSString *)path {
    return [self sizeFormattedOfDirectoryAtPath:path error:nil];
}


+ (NSString *)sizeFormattedOfDirectoryAtPath:(NSString *)path error:(NSError **)error {
    NSNumber *size = [self sizeOfDirectoryAtPath:path error:error];
    
    if (size != nil && [self isNotError:error]) {
        return [self sizeFormatted:size];
    }
    
    return nil;
}


+ (NSString *)sizeFormattedOfFileAtPath:(NSString *)path {
    return [self sizeFormattedOfFileAtPath:path error:nil];
}


+ (NSString *)sizeFormattedOfFileAtPath:(NSString *)path error:(NSError **)error {
    NSNumber *size = [self sizeOfFileAtPath:path error:error];
    
    if (size != nil && [self isNotError:error]) {
        return [self sizeFormatted:size];
    }
    
    return nil;
}


+ (NSString *)sizeFormattedOfItemAtPath:(NSString *)path {
    return [self sizeFormattedOfItemAtPath:path error:nil];
}


+ (NSString *)sizeFormattedOfItemAtPath:(NSString *)path error:(NSError **)error {
    NSNumber *size = [self sizeOfItemAtPath:path error:error];
    
    if (size != nil && [self isNotError:error]) {
        return [self sizeFormatted:size];
    }
    
    return nil;
}


+ (NSNumber *)sizeOfDirectoryAtPath:(NSString *)path {
    return [self sizeOfDirectoryAtPath:path error:nil];
}


+ (NSNumber *)sizeOfDirectoryAtPath:(NSString *)path error:(NSError **)error {
    if ([self isDirectoryItemAtPath:path error:error]) {
        if ([self isNotError:error]) {
            NSNumber *size = [self sizeOfItemAtPath:path error:error];
            double sizeValue = [size doubleValue];
            
            if ([self isNotError:error]) {
                NSArray *subpaths = [self listItemsInDirectoryAtPath:path deep:YES];
                NSUInteger subpathsCount = [subpaths count];
                
                for (NSUInteger i = 0; i < subpathsCount; i++) {
                    NSString *subpath = [subpaths objectAtIndex:i];
                    NSNumber *subpathSize = [self sizeOfItemAtPath:subpath error:error];
                    
                    if ([self isNotError:error]) {
                        sizeValue += [subpathSize doubleValue];
                    }
                    else {
                        return nil;
                    }
                }
                
                return [NSNumber numberWithDouble:sizeValue];
            }
        }
    }
    
    return nil;
}


+ (NSNumber *)sizeOfFileAtPath:(NSString *)path {
    return [self sizeOfFileAtPath:path error:nil];
}


+ (NSNumber *)sizeOfFileAtPath:(NSString *)path error:(NSError **)error {
    if ([self isFileItemAtPath:path error:error]) {
        if ([self isNotError:error]) {
            return [self sizeOfItemAtPath:path error:error];
        }
    }
    
    return nil;
}


+ (NSNumber *)sizeOfItemAtPath:(NSString *)path {
    return [self sizeOfItemAtPath:path error:nil];
}


+ (NSNumber *)sizeOfItemAtPath:(NSString *)path error:(NSError **)error {
    return (NSNumber *)[self attributeOfItemAtPath:path forKey:NSFileSize error:error];
}

@end
