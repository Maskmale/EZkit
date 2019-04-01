//
//  IOFile+Other.m
//  IO
//
//  Created by Maskmale on 2019/2/9.
//  Copyright © 2019 Maskmale. All rights reserved.
//

#import "EZFile.h"

@implementation EZFile (Other)

+ (NSDictionary*)dictForPlist {
    return [NSBundle mainBundle].infoDictionary;
}

+ (BOOL)existsItemAtPath:(NSString *)path {
    return [[NSFileManager defaultManager] fileExistsAtPath:[self absolutePath:path]];
}

+ (BOOL)isDirectoryItemAtPath:(NSString *)path {
    return [self isDirectoryItemAtPath:path error:nil];
}


+ (BOOL)isDirectoryItemAtPath:(NSString *)path error:(NSError **)error {
    return ([self attributeOfItemAtPath:path forKey:NSFileType error:error] == NSFileTypeDirectory);
}


+ (BOOL)isEmptyItemAtPath:(NSString *)path {
    return [self isEmptyItemAtPath:path error:nil];
}


+ (BOOL)isEmptyItemAtPath:(NSString *)path error:(NSError **)error {
    return ([self isFileItemAtPath:path error:error] && ([[self sizeOfItemAtPath:path error:error] intValue] == 0)) || ([self isDirectoryItemAtPath:path error:error] && ([[self listItemsInDirectoryAtPath:path deep:NO] count] == 0));
}


+ (BOOL)isFileItemAtPath:(NSString *)path {
    return [self isFileItemAtPath:path error:nil];
}


+ (BOOL)isFileItemAtPath:(NSString *)path error:(NSError **)error {
    return ([self attributeOfItemAtPath:path forKey:NSFileType error:error] == NSFileTypeRegular);
}


+ (BOOL)isExecutableItemAtPath:(NSString *)path {
    return [[NSFileManager defaultManager] isExecutableFileAtPath:[self absolutePath:path]];
}





+ (BOOL)isReadableItemAtPath:(NSString *)path {
    return [[NSFileManager defaultManager] isReadableFileAtPath:[self absolutePath:path]];
}


+ (BOOL)isWritableItemAtPath:(NSString *)path {
    return [[NSFileManager defaultManager] isWritableFileAtPath:[self absolutePath:path]];
}


+ (NSURL *)urlForItemAtPath:(NSString *)path {
    return [NSURL fileURLWithPath:[self absolutePath:path]];
}


+ (BOOL)isNotError:(NSError **)error {
    //the first check prevents EXC_BAD_ACCESS error in case methods are called passing nil to error argument
    //the second check prevents that the methods returns always NO just because the error pointer exists (so the first condition returns YES)
    return ((error == nil) || ((*error) == nil));
}


+ (NSString *)absolutePath:(NSString *)path {
    [self assertPath:path];
    
    NSString *defaultDirectory = [self absoluteDirectoryForPath:path];
    if (defaultDirectory != nil) {
        return path;
    }
    else {
        return [self pathForDocumentsDirectoryWithPath:path];
    }
}

+ (NSString *)absoluteDirectoryForPath:(NSString *)path {
    [self assertPath:path];
    
    if ([path isEqualToString:@"/"]) {
        return nil;
    }
    
    NSMutableArray *directories = [self absoluteDirectories];
    
    for (NSString *directory in directories) {
        NSRange indexOfDirectoryInPath = [path rangeOfString:directory];
        
        if (indexOfDirectoryInPath.location == 0) {
            return directory;
        }
    }
    
    return nil;
}

+ (void)assertPath:(NSString *)path {
    NSAssert(path != nil, @"Invalid path. Path cannot be nil.");
    NSAssert(![path isEqualToString:@""], @"Invalid path. Path cannot be empty string.");
}


+ (NSMutableArray *)absoluteDirectories {
    
    NSMutableArray *directories = [NSMutableArray arrayWithObjects:
                                   [self pathForApplicationSupportDirectory],
                                   [self pathForCachesDirectory],
                                   [self pathForDocumentsDirectory],
                                   [self pathForLibraryDirectory],
                                   [self pathForMainBundleDirectory],
                                   [self pathForTemporaryDirectory],
                                   nil];
    
    [directories sortUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        return (((NSString *)obj1).length > ((NSString *)obj2).length) ? 0 : 1;
    }];
    
    return directories;
}

@end
