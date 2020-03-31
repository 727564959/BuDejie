//
//  BDHTTPSessionManager.m
//  Budejie
//
//  Created by zq m on 2020/3/31.
//  Copyright © 2020 zq m. All rights reserved.
//

#import "BDHTTPSessionManager.h"

@implementation BDHTTPSessionManager
-(instancetype)init {
    if (self = [super init]) {
        [self.requestSerializer setValue:@"Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0)" forHTTPHeaderField:@"User-Agent"];
        self.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html",@"application/javascript",nil];
    }
    return self;
}
@end
