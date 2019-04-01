//
//  IOFile+Rename.m
//  IO
//
//  Created by Maskmale on 2019/2/9.
//  Copyright © 2019 Maskmale. All rights reserved.
//

#import "EZFile.h"

@implementation EZFile (Rename)

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

@end
