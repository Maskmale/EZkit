//
//  IOFile+Create.m
//  IO
//
//  Created by Maskmale on 2019/2/9.
//  Copyright © 2019 Maskmale. All rights reserved.
//

#import "EZFile.h"


@implementation EZFile (Create)

+ (BOOL)createDirectoriesForFileAtPath:(NSString *)path {
    return [self createDirectoriesForFileAtPath:path error:nil];
}


+ (BOOL)createDirectoriesForFileAtPath:(NSString *)path error:(NSError **)error {
    NSString *pathLastChar = [path substringFromIndex:(path.length - 1)];
    
    if ([pathLastChar isEqualToString:@"/"]) {
        [NSException raise:@"Invalid path" format:@"file path can't have a trailing '/'."];
        
        return NO;
    }
    
    return [self createDirectoriesForPath:[[self absolutePath:path] stringByDeletingLastPathComponent] error:error];
}


+ (BOOL)createDirectoriesForPath:(NSString *)path {
    return [self createDirectoriesForPath:path error:nil];
}


+ (BOOL)createDirectoriesForPath:(NSString *)path error:(NSError **)error {
    return [[NSFileManager defaultManager] createDirectoryAtPath:[self absolutePath:path] withIntermediateDirectories:YES attributes:nil error:error];
}


+ (BOOL)createFileAtPath:(NSString *)path {
    return [self createFileAtPath:path withContent:nil overwrite:NO error:nil];
}


+ (BOOL)createFileAtPath:(NSString *)path error:(NSError **)error {
    return [self createFileAtPath:path withContent:nil overwrite:NO error:error];
}


+ (BOOL)createFileAtPath:(NSString *)path overwrite:(BOOL)overwrite {
    return [self createFileAtPath:path withContent:nil overwrite:overwrite error:nil];
}


+ (BOOL)createFileAtPath:(NSString *)path overwrite:(BOOL)overwrite error:(NSError **)error {
    return [self createFileAtPath:path withContent:nil overwrite:overwrite error:error];
}


+ (BOOL)createFileAtPath:(NSString *)path withContent:(NSObject *)content {
    return [self createFileAtPath:path withContent:content overwrite:NO error:nil];
}


+ (BOOL)createFileAtPath:(NSString *)path withContent:(NSObject *)content error:(NSError **)error {
    return [self createFileAtPath:path withContent:content overwrite:NO error:error];
}


+ (BOOL)createFileAtPath:(NSString *)path withContent:(NSObject *)content overwrite:(BOOL)overwrite {
    return [self createFileAtPath:path withContent:content overwrite:overwrite error:nil];
}


+ (BOOL)createFileAtPath:(NSString *)path withContent:(NSObject *)content overwrite:(BOOL)overwrite error:(NSError **)error {
    if (![self existsItemAtPath:path] || (overwrite && [self removeItemAtPath:path error:error] && [self isNotError:error])) {
        if ([self createDirectoriesForFileAtPath:path error:error]) {
            BOOL created = [[NSFileManager defaultManager] createFileAtPath:[self absolutePath:path] contents:nil attributes:nil];
            
            if (content != nil) {
                [self writeFileAtPath:path content:content error:error];
            }
            
            return (created && [self isNotError:error]);
        }
        else {
            return NO;
        }
    }
    else {
        return NO;
    }
}
@end
