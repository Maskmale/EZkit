//
//  XCSandboxViewer.m
//  Pods
//
//  Created by 邢程 on 2017/7/20.
//
//

#import "EZRemoteSandboxBrowser.h"
#import "GCDWebDAVServer.h"
#import "GCDWebServer.h"

@interface  EZRemoteSandboxBrowser()

@property(nonatomic,strong) GCDWebDAVServer * davServer;

@end

@implementation EZRemoteSandboxBrowser

singleton_implementation(EZRemoteSandboxBrowser)

- (void)start:(serverURLBlock)serverURLBlock {
    [self startWithPort:8888 serverURLBlock:^(NSString *serverURL) {
        serverURLBlock(serverURL);
    }];
}

- (void)startWithPort:(NSUInteger)port serverURLBlock:(serverURLBlock)serverURLBlock {
    [self.davServer startWithPort:port bonjourName:@"XCSandboxViewer"];
    NSString *serverURL = [_davServer.serverURL absoluteString];
    serverURLBlock(serverURL);
    NSLog(@"\n 🐳 Visit %@ in your WebDAV client 🐳 \n", _davServer.serverURL);
}

-(void)stop {
    if (self.davServer) {
        [self.davServer stop];
    }
}

-(GCDWebDAVServer *)davServer {
    if (!_davServer) {
        NSString * homePath = NSHomeDirectory();
        _davServer  = [[GCDWebDAVServer alloc] initWithUploadDirectory:homePath];
        [GCDWebDAVServer setLogLevel:5];
    }
    
    return _davServer;
}


@end
