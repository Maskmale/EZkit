//
//  EZDeviceDirection.h
//  Uboard
//
//  Created by Maskmale on 2019/2/18.
//  Copyright © 2019 Maskmale. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "EZSingleton.h"
#import "EZDeviceDirectionHelper.h"


NS_ASSUME_NONNULL_BEGIN

@interface EZDeviceDirection : NSObject

singleton_interface(EZDeviceDirection)

typedef void (^deviceDirectionBlock)(EZDirection deviceDirection);

- (void)deviceDirection:(deviceDirectionBlock)deviceDirection;

@end

NS_ASSUME_NONNULL_END
