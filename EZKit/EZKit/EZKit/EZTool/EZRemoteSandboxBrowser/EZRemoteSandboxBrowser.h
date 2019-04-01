//
//  EZRemoteSandboxBrowser.h
//  Pods
//
//  Created by 邢程 on 2017/7/20.
//
//  依赖 GCDWebServers
//  https://github.com/swisspol/GCDWebServer
/*
 link to libz (via Target > Build Phases > Link Binary With Libraries) and add $(SDKROOT)/usr/include/libxml2 to your header search paths (via Target > Build Settings > HEADER_SEARCH_PATHS).
 
 链接到libz(通过目标>构建阶段>链接带有库的二进制文件)，并将$(SDKROOT)/usr/include/libxml2添加到头部搜索路径(通过目标>构建设置> HEADER_SEARCH_PATHS)。
 */

#import <Foundation/Foundation.h>
#import "EZSingleton.h"

@interface EZRemoteSandboxBrowser : NSObject

singleton_interface(EZRemoteSandboxBrowser)

typedef void (^serverURLBlock)(NSString *serverURL);

@property (nonatomic, copy) serverURLBlock serverURLBlock;

-(void)start:(serverURLBlock)serverURLBlock;
-(void)startWithPort:(NSUInteger)port serverURLBlock:(serverURLBlock)serverURLBlock;
-(void)stop;

@end
