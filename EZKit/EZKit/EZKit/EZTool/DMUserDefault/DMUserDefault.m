//
//  DMUserDefault.m
//
//
//  Created by Maskmale on 2018/9/16.
//  Copyright © 2018 Maskmale. All rights reserved.
//

#import "DMUserDefault.h"

@implementation DMUserDefault

+ (void)setObject:(id)obj forKey:(NSString *)key {
    [[NSUserDefaults standardUserDefaults] setObject:obj forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (id)getObjForKey:(NSString *)key {
    return [[NSUserDefaults standardUserDefaults] objectForKey:key];;
}

+ (void)setInteger:(NSInteger)value forKey:(NSString *)key {
    [[NSUserDefaults standardUserDefaults] setInteger:value forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (NSInteger)getIntegerForKey:(NSString *)key {
    return [[NSUserDefaults standardUserDefaults] integerForKey:key];
}

+ (void)setBOOL:(BOOL)value forKey:(NSString *)key {
    [[NSUserDefaults standardUserDefaults] setBool:value forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (BOOL)getBoolForKey:(NSString *)key {
    return [[NSUserDefaults standardUserDefaults] boolForKey:key];
}

@end
