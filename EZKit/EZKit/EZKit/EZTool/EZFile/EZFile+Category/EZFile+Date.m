//
//  IOFile+Date.m
//  IO
//
//  Created by Maskmale on 2019/2/9.
//  Copyright © 2019 Maskmale. All rights reserved.
//

#import "EZFile.h"

@implementation EZFile (Date)

+ (NSDate *)creationDateOfItemAtPath:(NSString *)path {
    return [self creationDateOfItemAtPath:path error:nil];
}


+ (NSDate *)creationDateOfItemAtPath:(NSString *)path error:(NSError **)error {
    return (NSDate *)[self attributeOfItemAtPath:path forKey:NSFileCreationDate error:error];
}

+ (NSDate *)modificationDateOfItemAtPath:(NSString *)path {
    return [self modificationDateOfItemAtPath:path error:nil];
}


+ (NSDate *)modificationDateOfItemAtPath:(NSString *)path error:(NSError **)error
{
    return (NSDate *)[self attributeOfItemAtPath:path forKey:NSFileModificationDate error:error];
}

@end
