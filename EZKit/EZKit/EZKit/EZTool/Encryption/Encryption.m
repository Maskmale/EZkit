//
//  Encryption.m
//  Uboard
//
//  Created by Maskmale on 2019/1/18.
//  Copyright © 2019 Maskmale. All rights reserved.
//

#import "Encryption.h"

@implementation Encryption


/**
 base64 编码

 @param string 需要加密的字符串
 @return 已加密的字符串
 */
+ (NSString *)encodeString:(NSString *)string
{
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    NSString *encodedStr = [data base64EncodedStringWithOptions:0];
    return encodedStr;
}


/**
 base64 解码
 
 @param string 已加密的字符串
 @return 已解密的字符串
 */
+ (NSString *)decodeString:(NSString *)string
{
    NSData *data = [[NSData alloc] initWithBase64EncodedString:string options:0];
    NSString *decodedStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return decodedStr;
}


@end
