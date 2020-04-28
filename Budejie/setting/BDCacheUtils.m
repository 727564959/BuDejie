//
//  BDCacheUtils.m
//  Budejie
//
//  Created by zq m on 2020/4/28.
//  Copyright © 2020 zq m. All rights reserved.
//

#import "BDCacheUtils.h"

@implementation BDCacheUtils
+ (NSInteger)CacheSize {
    NSInteger size = 0;
    NSFileManager *manager = [NSFileManager defaultManager];
    NSString *cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
    NSDirectoryEnumerator *fileEnumerator = [manager enumeratorAtPath:cachePath];
    for (NSString *fileName in fileEnumerator) {
        NSString *filePath = [cachePath stringByAppendingPathComponent:fileName];
        NSDictionary<NSString *, id> *attrs = [manager attributesOfItemAtPath:filePath error:nil];
        size += [attrs fileSize];
    }
    return size;
}

+ (void)cleanCache {
    NSString *cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory
    , NSUserDomainMask
    , YES) firstObject];
    NSFileManager *manager = [NSFileManager defaultManager];
    NSDirectoryEnumerator *fileEnumerator = [manager enumeratorAtPath:cachePath];
    for (NSString *fileName in fileEnumerator) {
         NSString *filePath = [cachePath stringByAppendingPathComponent:fileName];
        [manager removeItemAtPath:filePath error:nil];
     }
}
@end
