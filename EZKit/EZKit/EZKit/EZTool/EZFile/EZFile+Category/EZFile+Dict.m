//
//  IOFile+Dict.m
//  IO
//
//  Created by Maskmale on 2019/2/9.
//  Copyright © 2019 Maskmale. All rights reserved.
//

#import "EZFile.h"

@implementation EZFile (Dict)

+ (NSDictionary *)metadataOfImageAtPath:(NSString *)path {
    if ([self isFileItemAtPath:path]) {
        //http://blog.depicus.com/getting-exif-data-from-images-on-ios/
        
        NSURL *url = [self urlForItemAtPath:path];
        CGImageSourceRef sourceRef = CGImageSourceCreateWithURL((CFURLRef)url, NULL);
        NSDictionary *metadata = (NSDictionary *)CFBridgingRelease(CGImageSourceCopyPropertiesAtIndex(sourceRef, 0, NULL));
        
        return metadata;
    }
    
    return nil;
}


+ (NSDictionary *)exifDataOfImageAtPath:(NSString *)path {
    NSDictionary *metadata = [self metadataOfImageAtPath:path];
    
    if (metadata) {
        return [metadata objectForKey:(NSString *)kCGImagePropertyExifDictionary];
    }
    
    return nil;
}


+ (NSDictionary *)tiffDataOfImageAtPath:(NSString *)path {
    NSDictionary *metadata = [self metadataOfImageAtPath:path];
    
    if (metadata) {
        return [metadata objectForKey:(NSString *)kCGImagePropertyTIFFDictionary];
    }
    
    return nil;
}

@end
