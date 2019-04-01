//
//  IOFile+Xattr.m
//  IO
//
//  Created by Maskmale on 2019/2/9.
//  Copyright © 2019 Maskmale. All rights reserved.
//

#import "EZFile.h"
#import <sys/xattr.h>

@implementation EZFile (Xattr)

+ (NSDictionary *)xattrOfItemAtPath:(NSString *)path {
    NSMutableDictionary *values = [[NSMutableDictionary alloc] init];
    
    const char *upath = [path UTF8String];
    
    ssize_t ukeysSize = listxattr(upath, NULL, 0, 0);
    
    if (ukeysSize > 0) {
        char *ukeys = malloc(ukeysSize);
        
        ukeysSize = listxattr(upath, ukeys, ukeysSize, 0);
        
        NSUInteger keyOffset = 0;
        NSString *key;
        NSString *value;
        
        while(keyOffset < ukeysSize) {
            key = [NSString stringWithUTF8String:(keyOffset + ukeys)];
            keyOffset += ([key length] + 1);
            
            value = [self xattrOfItemAtPath:path getValueForKey:key];
            [values setObject:value forKey:key];
        }
        
        free(ukeys);
    }
    
    return [NSDictionary dictionaryWithObjects:[values allValues] forKeys:[values allKeys]];
}


+ (NSString *)xattrOfItemAtPath:(NSString *)path getValueForKey:(NSString *)key {
    NSString *value = nil;
    
    const char *ukey = [key UTF8String];
    const char *upath = [path UTF8String];
    
    ssize_t uvalueSize = getxattr(upath, ukey, NULL, 0, 0, 0);
    
    if (uvalueSize > -1) {
        if (uvalueSize == 0) {
            value = @"";
        }
        else {
            
            char *uvalue = malloc(uvalueSize);
            
            if (uvalue) {
                getxattr(upath, ukey, uvalue, uvalueSize, 0, 0);
                uvalue[uvalueSize] = '\0';
                value = [NSString stringWithUTF8String:uvalue];
                free(uvalue);
            }
        }
    }
    
    return value;
}


+ (BOOL)xattrOfItemAtPath:(NSString *)path hasValueForKey:(NSString *)key {
    return ([self xattrOfItemAtPath:path getValueForKey:key] != nil);
}


+ (BOOL)xattrOfItemAtPath:(NSString *)path removeValueForKey:(NSString *)key {
    int result = removexattr([path UTF8String], [key UTF8String], 0);
    
    return (result == 0);
}


+ (BOOL)xattrOfItemAtPath:(NSString *)path setValue:(NSString *)value forKey:(NSString *)key {
    if (value == nil) {
        return NO;
    }
    
    int result = setxattr([path UTF8String], [key UTF8String], [value UTF8String], [value length], 0, 0);
    
    return (result == 0);
}

@end
