//
//  DMUserDefault.h
//
//
//  Created by Maskmale on 2018/9/16.
//  Copyright © 2018 Maskmale. All rights reserved.
//
//  NSUserDefault 操作

#import <Foundation/Foundation.h>

@interface DMUserDefault : NSObject

+ (void)setObject:(id)obj forKey:(NSString *)key;

+ (id)getObjForKey:(NSString *)key;

+ (void)setInteger:(NSInteger)value forKey:(NSString *)key;

+ (NSInteger)getIntegerForKey:(NSString *)key;

+ (void)setBOOL:(BOOL)value forKey:(NSString *)key;

+ (BOOL)getBoolForKey:(NSString *)key;

@end
