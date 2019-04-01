//
//  EZ_CustomLayerHelper.h
//  EZKit
//
//  Created by Maskmale on 2019/1/24.
//  Copyright © 2019 Maskmale. All rights reserved.
//

#ifndef EZ_CustomLayerHelper_h
#define EZ_CustomLayerHelper_h

typedef NS_OPTIONS(NSUInteger, LayerRoundedCornerType){
    LayerRoundedCornerTypeAll            = 0,
    LayerRoundedCornerTypeTop            = 1 << 0,
    LayerRoundedCornerTypeLeft           = 1 << 1,
    LayerRoundedCornerTypeBottom         = 1 << 2,
    LayerRoundedCornerTypeRight          = 1 << 3,
    LayerRoundedCornerTypeTopLeft        = 1 << 4,
    LayerRoundedCornerTypeTopRight       = 1 << 5,
    LayerRoundedCornerTypeBottomLeft     = 1 << 6,
    LayerRoundedCornerTypeBottomRight    = 1 << 7,
};

typedef NS_OPTIONS(NSUInteger, LayerBorderCornerType){
    LayerBorderCornerTypeAll         = 0,
    LayerBorderCornerTypeTop         = 1 << 0,
    LayerBorderCornerTypeBottom      = 1 << 1,
    LayerBorderCornerTypeLeft        = 1 << 2,
    LayerBorderCornerTypeRight       = 1 << 3,
};

#endif /* EZ_CustomLayerHelper_h */
