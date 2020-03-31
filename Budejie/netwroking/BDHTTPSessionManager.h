//
//  BDHTTPSessionManager.h
//  Budejie
//
//  Created by zq m on 2020/3/31.
//  Copyright © 2020 zq m. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

NS_ASSUME_NONNULL_BEGIN
const static NSString *baseUrl = @"http://mobads.baidu.com/cpro/ui/mads.php";
@interface BDHTTPSessionManager : AFHTTPSessionManager

@end

NS_ASSUME_NONNULL_END
