//
//  IOFile+Attribute.m
//  IO
//
//  Created by Maskmale on 2019/2/9.
//  Copyright © 2019 Maskmale. All rights reserved.
//

#import "EZFile.h"


@implementation EZFile (Attribute)

+ (id)attributeOfItemAtPath:(NSString *)path forKey:(NSString *)key {
    return [[self attributesOfItemAtPath:path] objectForKey:key];
}


+ (id)attributeOfItemAtPath:(NSString *)path forKey:(NSString *)key error:(NSError **)error {
    return [[self attributesOfItemAtPath:path error:error] objectForKey:key];
}


+ (NSDictionary *)attributesOfItemAtPath:(NSString *)path {
    return [self attributesOfItemAtPath:path error:nil];
}


+ (NSDictionary *)attributesOfItemAtPath:(NSString *)path error:(NSError **)error {
    return [[NSFileManager defaultManager] attributesOfItemAtPath:[self absolutePath:path] error:error];
}


@end
