//
//  IOFile+Path.m
//  IO
//
//  Created by Maskmale on 2019/2/9.
//  Copyright © 2019 Maskmale. All rights reserved.
//

#import "EZFile.h"

@implementation EZFile (Path)


+ (NSString *)pathForHomeDirectory {
    return NSHomeDirectory();
}


+ (NSString *)pathForApplicationSupportDirectory {
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, NSUserDomainMask, YES);
    
    NSString *path = [paths lastObject];
    
    return path;
}


+ (NSString *)pathForApplicationSupportDirectoryWithPath:(NSString *)path {
    return [[EZFile pathForApplicationSupportDirectory] stringByAppendingPathComponent:path];
}


+ (NSString *)pathForCachesDirectory {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *path = [paths lastObject];
    
    return path;
}


+ (NSString *)pathForCachesDirectoryWithPath:(NSString *)path {
    return [[EZFile pathForCachesDirectory] stringByAppendingPathComponent:path];
}


+ (NSString *)pathForDocumentsDirectory {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = [paths lastObject];
    
    return path;
}


+ (NSString *)pathForDocumentsDirectoryWithPath:(NSString *)path {
    return [[EZFile pathForDocumentsDirectory] stringByAppendingPathComponent:path];
}


+ (NSString *)pathForLibraryDirectory {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *path = [paths lastObject];
    
    return path;
}


+ (NSString *)pathForLibraryDirectoryWithPath:(NSString *)path {
    return [[EZFile pathForLibraryDirectory] stringByAppendingPathComponent:path];
}


+ (NSString *)pathForMainBundleDirectory {
    return [NSBundle mainBundle].resourcePath;
}


+ (NSString *)pathForMainBundleDirectoryWithPath:(NSString *)path {
    return [[EZFile pathForMainBundleDirectory] stringByAppendingPathComponent:path];
}


+ (NSString *)pathForPlistNamed:(NSString *)name {
    NSString *nameExtension = [name pathExtension];
    NSString *plistExtension = @"plist";
    
    if ([nameExtension isEqualToString:@""]) {
        name = [name stringByAppendingPathExtension:plistExtension];
    }
    
    return [self pathForMainBundleDirectoryWithPath:name];
}


+ (NSString *)pathForTemporaryDirectory {
    NSString *path = NSTemporaryDirectory();
    
    return path;
}


+ (NSString *)pathForTemporaryDirectoryWithPath:(NSString *)path {
    return [[EZFile pathForTemporaryDirectory] stringByAppendingPathComponent:path];
}

@end
