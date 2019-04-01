//
//  IOFile+Write.m
//  IO
//
//  Created by Maskmale on 2019/2/9.
//  Copyright © 2019 Maskmale. All rights reserved.
//

#import "EZFile.h"

@implementation EZFile (Write)

+ (BOOL)writeFileAtPath:(NSString *)path content:(NSObject *)content {
    return [self writeFileAtPath:path content:content error:nil];
}


+ (BOOL)writeFileAtPath:(NSString *)path content:(NSObject *)content error:(NSError **)error {
    if (content == nil) {
        [NSException raise:@"Invalid content" format:@"content can't be nil."];
    }
    
    [self createFileAtPath:path withContent:nil overwrite:YES error:error];
    
    NSString *absolutePath = [self absolutePath:path];
    
    if ([content isKindOfClass:[NSMutableArray class]]) {
        [((NSMutableArray *)content) writeToFile:absolutePath atomically:YES];
    }
    else if ([content isKindOfClass:[NSArray class]]) {
        [((NSArray *)content) writeToFile:absolutePath atomically:YES];
    }
    else if ([content isKindOfClass:[NSMutableData class]]) {
        [((NSMutableData *)content) writeToFile:absolutePath atomically:YES];
    }
    else if ([content isKindOfClass:[NSData class]]) {
        [((NSData *)content) writeToFile:absolutePath atomically:YES];
    }
    else if ([content isKindOfClass:[NSMutableDictionary class]]) {
        [((NSMutableDictionary *)content) writeToFile:absolutePath atomically:YES];
    }
    else if ([content isKindOfClass:[NSDictionary class]]) {
        [((NSDictionary *)content) writeToFile:absolutePath atomically:YES];
    }
    else if ([content isKindOfClass:[NSJSONSerialization class]]) {
        [((NSDictionary *)content) writeToFile:absolutePath atomically:YES];
    }
    else if ([content isKindOfClass:[NSMutableString class]]) {
        [[((NSString *)content) dataUsingEncoding:NSUTF8StringEncoding] writeToFile:absolutePath atomically:YES];
    }
    else if ([content isKindOfClass:[NSString class]]) {
        [[((NSString *)content) dataUsingEncoding:NSUTF8StringEncoding] writeToFile:absolutePath atomically:YES];
    }
    else if ([content isKindOfClass:[UIImage class]]) {
        [UIImagePNGRepresentation((UIImage *)content) writeToFile:absolutePath atomically:YES];
    }
    else if ([content isKindOfClass:[UIImageView class]]) {
        return [self writeFileAtPath:absolutePath content:((UIImageView *)content).image error:error];
    }
    else if ([content conformsToProtocol:@protocol(NSCoding)]) {
        [NSKeyedArchiver archiveRootObject:content toFile:absolutePath];
    }
    else {
        [NSException raise:@"Invalid content type" format:@"content of type %@ is not handled.", NSStringFromClass([content class])];
        
        return NO;
    }
    
    return YES;
}

@end
