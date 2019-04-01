//
//  IOFile+Copy.m
//  IO
//
//  Created by Maskmale on 2019/2/9.
//  Copyright © 2019 Maskmale. All rights reserved.
//

#import "EZFile.h"

@implementation EZFile (Copy)

+ (BOOL)copyItemAtPath:(NSString *)path toPath:(NSString *)toPath {
    return [self copyItemAtPath:path toPath:toPath overwrite:NO error:nil];
}


+ (BOOL)copyItemAtPath:(NSString *)path toPath:(NSString *)toPath error:(NSError **)error {
    return [self copyItemAtPath:path toPath:toPath overwrite:NO error:error];
}


+ (BOOL)copyItemAtPath:(NSString *)path toPath:(NSString *)toPath overwrite:(BOOL)overwrite {
    return [self copyItemAtPath:path toPath:toPath overwrite:overwrite error:nil];
}


+ (BOOL)copyItemAtPath:(NSString *)path toPath:(NSString *)toPath overwrite:(BOOL)overwrite error:(NSError **)error {
    
    if (![self existsItemAtPath:path]) {
        NSLog(@"复制失败，源文件不存在！");
        return NO;
    }
    
    BOOL exists = [self existsItemAtPath:toPath];
    BOOL isRemoveItem = NO;
    BOOL isNotError = YES;
    
    
    if (exists) {
        if (overwrite) {
            isRemoveItem = [self removeItemAtPath:toPath error:error];
            isNotError = [self isNotError:error];
            
            if (!isRemoveItem || !isNotError) {
                return NO;
            }
        }
        else {
            NSString *fileName = [path lastPathComponent];
            toPath = [toPath stringByDeletingLastPathComponent];
            NSArray *allFile = [self listItemsInDirectoryAtPath:toPath deep:NO];
            
            NSMutableArray *newFiles = [NSMutableArray array];
            
            for (NSString *path in allFile) {
                NSString *name = [path lastPathComponent];
                
                if ([name rangeOfString:fileName].location != NSNotFound)  {
                    [newFiles addObject:name];
                }
            }
            
            if (newFiles.count > 0) {
                fileName = [NSString stringWithFormat:@"%@ %lu",fileName,(unsigned long)newFiles.count + 1];
            }
            
            toPath = [toPath stringByAppendingPathComponent:fileName];
        }
    }
    

    BOOL create = [self createDirectoriesForFileAtPath:toPath error:error];
    
    if (create) {
        path = [self absolutePath:path];
        toPath = [self absolutePath:toPath];
        
        BOOL copied = [[NSFileManager defaultManager] copyItemAtPath:path toPath:toPath error:error];
        
        isNotError = [self isNotError:error];
        return (copied && isNotError);
    }
    else {
        return NO;
    }
}

@end
