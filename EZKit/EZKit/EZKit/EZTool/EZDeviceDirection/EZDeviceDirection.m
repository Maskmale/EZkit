//
//  EZDeviceDirection.m
//  Uboard
//
//  Created by Maskmale on 2019/2/18.
//  Copyright © 2019 Maskmale. All rights reserved.
//



#import "EZDeviceDirection.h"
#import <CoreMotion/CoreMotion.h>

@interface EZDeviceDirection ()

@property (nonatomic, strong) CMMotionManager *cmmotionManager;

@end

@implementation EZDeviceDirection

singleton_implementation(EZDeviceDirection)

- (CMMotionManager *)cmmotionManager{
    if (!_cmmotionManager) {
        _cmmotionManager = [[CMMotionManager alloc] init];
    }
    return _cmmotionManager;
}

- (void)deviceDirection:(deviceDirectionBlock)deviceDirection {
    if([self.cmmotionManager isDeviceMotionAvailable]) {
        [self.cmmotionManager startAccelerometerUpdatesToQueue:[NSOperationQueue currentQueue] withHandler:^(CMAccelerometerData * _Nullable accelerometerData, NSError * _Nullable error) {
            
            CMAccelerometerData *accelerationrometerData = self.cmmotionManager.accelerometerData;
            CMAcceleration acceleration = accelerationrometerData.acceleration;
            
            EZDirection orientation = EZDirectionUnknown;
//            EZLog(@"x:%f.2",acceleration.x);
//            EZLog(@"y:%f.2",acceleration.y);
//            EZLog(@"z:%f.2",acceleration.z);
            //           AVCaptureVideoOrientation orientationNew;
            if (acceleration.x >= 0.75) {//home button left
                orientation = EZDirectionLandscapeRight;
            }
            else if (acceleration.x <= -0.75) {//home button right
                orientation = EZDirectionLandscapeLeft;
            }
            else if (acceleration.y <= -0.75) {
                orientation = EZDirectionPortrait;
            }
            else if (acceleration.y >= 0.75) {
                orientation = EZDirectionPortraitUpsideDown;
            }
            else {
                // Consider same as last time
                orientation = EZDirectionNoChange;
            }
            
            deviceDirection(orientation);
        }];
    }
}


@end
