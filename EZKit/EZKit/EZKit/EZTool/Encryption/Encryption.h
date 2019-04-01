//
//  Encryption.h
//  Uboard
//
//  Created by Maskmale on 2019/1/18.
//  Copyright © 2019 Maskmale. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Encryption : NSObject

/**
 base64 编码
 
 @param string 需要加密的字符串
 @return 已加密的字符串
 */
+ (NSString *)encodeString:(NSString *)string;


/**
 base64 解码
 
 @param string 已加密的字符串
 @return 已解密的字符串
 */
+ (NSString *)decodeString:(NSString *)string;

@end

NS_ASSUME_NONNULL_END
