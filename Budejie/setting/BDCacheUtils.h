//
//  BDCacheUtils.h
//  Budejie
//
//  Created by zq m on 2020/4/28.
//  Copyright © 2020 zq m. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BDCacheUtils : NSObject
+ (NSInteger)CacheSize;
+ (void)cleanCache;
@end

NS_ASSUME_NONNULL_END
