//
//  EZDeviceDirectionHelper.h
//  EZKit
//
//  Created by Maskmale on 2019/4/1.
//  Copyright © 2019 Maskmale. All rights reserved.
//

#ifndef EZDeviceDirectionHelper_h
#define EZDeviceDirectionHelper_h

typedef NS_ENUM(NSUInteger, EZDirection) {
    EZDirectionUnknown,
    EZDirectionNoChange,
    EZDirectionPortrait,            // Device direction vertically, home button on the bottom
    EZDirectionPortraitUpsideDown,  // Device direction vertically, home button on the top
    EZDirectionLandscapeLeft,       // Device direction horizontally, home button on the right
    EZDirectionLandscapeRight,      // Device direction horizontally, home button on the left
    EZDirectionFaceUp,              // Device direction flat, face up
    EZDirectionFaceDown             // Device direction flat, face down
};

#endif /* EZDeviceDirectionHelper_h */
