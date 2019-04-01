//
//  DeviceModel.h
//  HardwareType
//
//  Created by dev on 2017/10/9.
//  Copyright © 2017年 dev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DeviceModel : NSObject


+ (NSString *)deviceModelName;

+ (BOOL)iPodTouch;
+ (BOOL)iPhone;
+ (BOOL)iPad;

@end
