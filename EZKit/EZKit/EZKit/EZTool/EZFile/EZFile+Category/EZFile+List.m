//
//  IOFile+List.m
//  IO
//
//  Created by Maskmale on 2019/2/9.
//  Copyright © 2019 Maskmale. All rights reserved.
//

#import "EZFile.h"

@implementation EZFile (List)

+ (NSArray *)listDirectoriesInDirectoryAtPath:(NSString *)path {
    return [self listDirectoriesInDirectoryAtPath:path deep:NO];
}


+ (NSArray *)listDirectoriesInDirectoryAtPath:(NSString *)path deep:(BOOL)deep {
    NSArray *subpaths = [self listItemsInDirectoryAtPath:path deep:deep];
    
    return [subpaths filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(id evaluatedObject, NSDictionary *bindings) {
        
        NSString *subpath = (NSString *)evaluatedObject;
        
        return [self isDirectoryItemAtPath:subpath];
    }]];
}


+ (NSArray *)listFilesInDirectoryAtPath:(NSString *)path {
    return [self listFilesInDirectoryAtPath:path deep:NO];
}


+ (NSArray *)listFilesInDirectoryAtPath:(NSString *)path deep:(BOOL)deep {
    NSArray *subpaths = [self listItemsInDirectoryAtPath:path deep:deep];
    
    return [subpaths filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(id evaluatedObject, NSDictionary *bindings) {
        
        NSString *subpath = (NSString *)evaluatedObject;
        
        return [self isFileItemAtPath:subpath];
    }]];
}


+ (NSArray *)listFilesInDirectoryAtPath:(NSString *)path withExtension:(NSString *)extension
{
    return [self listFilesInDirectoryAtPath:path withExtension:extension deep:NO];
}


+ (NSArray *)listFilesInDirectoryAtPath:(NSString *)path withExtension:(NSString *)extension deep:(BOOL)deep {
    NSArray *subpaths = [self listFilesInDirectoryAtPath:path deep:deep];
    
    return [subpaths filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(id evaluatedObject, NSDictionary *bindings) {
        
        NSString *subpath = (NSString *)evaluatedObject;
        NSString *subpathExtension = [[subpath pathExtension] lowercaseString];
        NSString *filterExtension = [[extension lowercaseString] stringByReplacingOccurrencesOfString:@"." withString:@""];
        
        return [subpathExtension isEqualToString:filterExtension];
    }]];
}


+ (NSArray *)listFilesInDirectoryAtPath:(NSString *)path withPrefix:(NSString *)prefix {
    return [self listFilesInDirectoryAtPath:path withPrefix:prefix deep:NO];
}


+ (NSArray *)listFilesInDirectoryAtPath:(NSString *)path withPrefix:(NSString *)prefix deep:(BOOL)deep {
    NSArray *subpaths = [self listFilesInDirectoryAtPath:path deep:deep];
    
    return [subpaths filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(id evaluatedObject, NSDictionary *bindings) {
        
        NSString *subpath = (NSString *)evaluatedObject;
        NSString *fileName = [subpath lastPathComponent];
        
        return ([fileName hasPrefix:prefix] || [fileName isEqualToString:prefix]);
    }]];
}


+ (NSArray *)listFilesInDirectoryAtPath:(NSString *)path withSuffix:(NSString *)suffix {
    return [self listFilesInDirectoryAtPath:path withSuffix:suffix deep:NO];
}


+ (NSArray *)listFilesInDirectoryAtPath:(NSString *)path withSuffix:(NSString *)suffix deep:(BOOL)deep {
    NSArray *subpaths = [self listFilesInDirectoryAtPath:path deep:deep];
    
    return [subpaths filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(id evaluatedObject, NSDictionary *bindings) {
        
        NSString *subpath = (NSString *)evaluatedObject;
        NSString *subpathName = [subpath stringByDeletingPathExtension];
        
        return ([subpath hasSuffix:suffix] || [subpath isEqualToString:suffix] || [subpathName hasSuffix:suffix] || [subpathName isEqualToString:suffix]);
    }]];
}


+ (NSArray *)listItemsInDirectoryAtPath:(NSString *)path deep:(BOOL)deep {
    NSString *absolutePath = [self absolutePath:path];
    NSArray *relativeSubpaths = (deep ? [[NSFileManager defaultManager] subpathsOfDirectoryAtPath:absolutePath error:nil] : [[NSFileManager defaultManager] contentsOfDirectoryAtPath:absolutePath error:nil]);
    
    NSMutableArray *absoluteSubpaths = [[NSMutableArray alloc] init];
    
    for(NSString *relativeSubpath in relativeSubpaths) {
        NSString *absoluteSubpath = [absolutePath stringByAppendingPathComponent:relativeSubpath];
        [absoluteSubpaths addObject:absoluteSubpath];
    }
    
    return [NSArray arrayWithArray:absoluteSubpaths];
}
@end
