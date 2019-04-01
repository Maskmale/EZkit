//
//  IOFile+Read.m
//  IO
//
//  Created by Maskmale on 2019/2/9.
//  Copyright © 2019 Maskmale. All rights reserved.
//

#import "EZFile.h"

@implementation EZFile (Read)

+ (NSString *)readFileAtPath:(NSString *)path {
    return [self readFileAtPathAsString:path error:nil];
}


+ (NSString *)readFileAtPath:(NSString *)path error:(NSError **)error {
    return [self readFileAtPathAsString:path error:error];
}


+ (NSArray *)readFileAtPathAsArray:(NSString *)path {
    return [NSArray arrayWithContentsOfFile:[self absolutePath:path]];
}


+ (NSObject *)readFileAtPathAsCustomModel:(NSString *)path {
    return [NSKeyedUnarchiver unarchiveObjectWithFile:[self absolutePath:path]];
}


+ (NSData *)readFileAtPathAsData:(NSString *)path {
    return [self readFileAtPathAsData:path error:nil];
}


+ (NSData *)readFileAtPathAsData:(NSString *)path error:(NSError **)error {
    return [NSData dataWithContentsOfFile:[self absolutePath:path] options:NSDataReadingMapped error:error];
}


+ (NSDictionary *)readFileAtPathAsDictionary:(NSString *)path {
    return [NSDictionary dictionaryWithContentsOfFile:[self absolutePath:path]];
}


+ (UIImage *)readFileAtPathAsImage:(NSString *)path {
    return [self readFileAtPathAsImage:path error:nil];
}


+ (UIImage *)readFileAtPathAsImage:(NSString *)path error:(NSError **)error {
    NSData *data = [self readFileAtPathAsData:path error:error];
    
    if ([self isNotError:error]) {
        return [UIImage imageWithData:data];
    }
    
    return nil;
}


+ (UIImageView *)readFileAtPathAsImageView:(NSString *)path
{
    return [self readFileAtPathAsImageView:path error:nil];
}


+ (UIImageView *)readFileAtPathAsImageView:(NSString *)path error:(NSError **)error {
    UIImage *image = [self readFileAtPathAsImage:path error:error];
    
    if ([self isNotError:error]) {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        [imageView sizeToFit];
        return imageView;
    }
    
    return nil;
}


+ (NSJSONSerialization *)readFileAtPathAsJSON:(NSString *)path {
    return [self readFileAtPathAsJSON:path error:nil];
}


+ (NSJSONSerialization *)readFileAtPathAsJSON:(NSString *)path error:(NSError **)error {
    NSData *data = [self readFileAtPathAsData:path error:error];
    
    if ([self isNotError:error]) {
        NSJSONSerialization *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:error];
        
        if ([NSJSONSerialization isValidJSONObject:json]) {
            return json;
        }
    }
    
    return nil;
}


+ (NSMutableArray *)readFileAtPathAsMutableArray:(NSString *)path {
    return [NSMutableArray arrayWithContentsOfFile:[self absolutePath:path]];
}


+ (NSMutableData *)readFileAtPathAsMutableData:(NSString *)path {
    return [self readFileAtPathAsMutableData:path error:nil];
}


+ (NSMutableData *)readFileAtPathAsMutableData:(NSString *)path error:(NSError **)error {
    return [NSMutableData dataWithContentsOfFile:[self absolutePath:path] options:NSDataReadingMapped error:error];
}


+ (NSMutableDictionary *)readFileAtPathAsMutableDictionary:(NSString *)path {
    return [NSMutableDictionary dictionaryWithContentsOfFile:[self absolutePath:path]];
}


+ (NSString *)readFileAtPathAsString:(NSString *)path {
    return [self readFileAtPath:path error:nil];
}


+ (NSString *)readFileAtPathAsString:(NSString *)path error:(NSError **)error {
    return [NSString stringWithContentsOfFile:[self absolutePath:path] encoding:NSUTF8StringEncoding error:error];
}

@end
