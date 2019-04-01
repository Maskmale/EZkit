//
//  IOFile+Delete.m
//  IO
//
//  Created by Maskmale on 2019/2/9.
//  Copyright © 2019 Maskmale. All rights reserved.
//

#import "EZFile.h"

@implementation EZFile (Delete)

+ (BOOL)removeFilesInDirectoryAtPath:(NSString *)path {
    return [self removeItemsAtPaths:[self listFilesInDirectoryAtPath:path] error:nil];
}


+ (BOOL)removeFilesInDirectoryAtPath:(NSString *)path error:(NSError **)error {
    return [self removeItemsAtPaths:[self listFilesInDirectoryAtPath:path] error:error];
}


+ (BOOL)removeFilesInDirectoryAtPath:(NSString *)path withExtension:(NSString *)extension {
    return [self removeItemsAtPaths:[self listFilesInDirectoryAtPath:path withExtension:extension] error:nil];
}


+ (BOOL)removeFilesInDirectoryAtPath:(NSString *)path withExtension:(NSString *)extension error:(NSError **)error {
    return [self removeItemsAtPaths:[self listFilesInDirectoryAtPath:path withExtension:extension] error:error];
}


+ (BOOL)removeFilesInDirectoryAtPath:(NSString *)path withPrefix:(NSString *)prefix {
    return [self removeItemsAtPaths:[self listFilesInDirectoryAtPath:path withPrefix:prefix] error:nil];
}


+ (BOOL)removeFilesInDirectoryAtPath:(NSString *)path withPrefix:(NSString *)prefix error:(NSError **)error {
    return [self removeItemsAtPaths:[self listFilesInDirectoryAtPath:path withPrefix:prefix] error:error];
}


+ (BOOL)removeFilesInDirectoryAtPath:(NSString *)path withSuffix:(NSString *)suffix {
    return [self removeItemsAtPaths:[self listFilesInDirectoryAtPath:path withSuffix:suffix] error:nil];
}


+ (BOOL)removeFilesInDirectoryAtPath:(NSString *)path withSuffix:(NSString *)suffix error:(NSError **)error {
    return [self removeItemsAtPaths:[self listFilesInDirectoryAtPath:path withSuffix:suffix] error:error];
}


+ (BOOL)removeItemsInDirectoryAtPath:(NSString *)path {
    return [self removeItemsInDirectoryAtPath:path error:nil];
}


+ (BOOL)removeItemsInDirectoryAtPath:(NSString *)path error:(NSError **)error {
    return [self removeItemsAtPaths:[self listItemsInDirectoryAtPath:path deep:NO] error:error];
}


+ (BOOL)removeItemAtPath:(NSString *)path {
    return [self removeItemAtPath:path error:nil];
}


+ (BOOL)removeItemAtPath:(NSString *)path error:(NSError **)error {
    return [[NSFileManager defaultManager] removeItemAtPath:[self absolutePath:path] error:error];
}


+ (BOOL)removeItemsAtPaths:(NSArray *)paths {
    return [self removeItemsAtPaths:paths error:nil];
}


+ (BOOL)removeItemsAtPaths:(NSArray *)paths error:(NSError **)error {
    BOOL success = YES;
    
    for (NSString *path in paths) {
        success &= [self removeItemAtPath:[self absolutePath:path] error:error];
    }
    
    return success;
}


+ (BOOL)renameItemAtPath:(NSString *)path withName:(NSString *)name {
    return [self renameItemAtPath:path withName:name error:nil];
}


+ (BOOL)renameItemAtPath:(NSString *)path withName:(NSString *)name error:(NSError **)error {
    NSRange indexOfSlash = [name rangeOfString:@"/"];
    
    if (indexOfSlash.location < name.length) {
        [NSException raise:@"Invalid name" format:@"file name can't contain a '/'."];
        
        return NO;
    }
    
    return [self moveItemAtPath:path toPath:[[[self absolutePath:path] stringByDeletingLastPathComponent] stringByAppendingPathComponent:name] error:error];
}

+ (BOOL)emptyCachesDirectory {
    return [self removeFilesInDirectoryAtPath:[self pathForCachesDirectory]];
}


+ (BOOL)emptyTemporaryDirectory {
    return [self removeFilesInDirectoryAtPath:[self pathForTemporaryDirectory]];
}

@end
