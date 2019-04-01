//
//  IOFile+Move.m
//  IO
//
//  Created by Maskmale on 2019/2/9.
//  Copyright © 2019 Maskmale. All rights reserved.
//

#import "EZFile.h"

@implementation EZFile (Move)

+ (BOOL)moveItemAtPath:(NSString *)path toPath:(NSString *)toPath {
    return [self moveItemAtPath:path toPath:toPath overwrite:NO error:nil];
}


+ (BOOL)moveItemAtPath:(NSString *)path toPath:(NSString *)toPath error:(NSError **)error {
    return [self moveItemAtPath:path toPath:toPath overwrite:NO error:error];
}


+ (BOOL)moveItemAtPath:(NSString *)path toPath:(NSString *)toPath overwrite:(BOOL)overwrite {
    return [self moveItemAtPath:path toPath:toPath overwrite:overwrite error:nil];
}


+ (BOOL)moveItemAtPath:(NSString *)path toPath:(NSString *)toPath overwrite:(BOOL)overwrite error:(NSError **)error {
    if (![self existsItemAtPath:toPath] || (overwrite && [EZFile removeItemAtPath:toPath error:error] && [self isNotError:error])) {
        return ([self createDirectoriesForFileAtPath:toPath error:error] && [[NSFileManager defaultManager] moveItemAtPath:[self absolutePath:path] toPath:[self absolutePath:toPath] error:error]);
    }
    else {
        return NO;
    }
}

@end
