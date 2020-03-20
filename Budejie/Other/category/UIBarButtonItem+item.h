//
//  UIBarButtonItem+item.h
//  Budejie
//
//  Created by zq m on 2020/3/20.
//  Copyright © 2020 zq m. All rights reserved.
//


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIBarButtonItem (item)
+ (UIBarButtonItem *)itemWithImageName:(NSString *)imageName itemWithHighlightedImageName:(NSString *)highlightedImageName addTarget:(id)object action:(SEL)selector;
+ (UIBarButtonItem *)itemWithImageName:(NSString *)imageName itemWithSelectedImageName:(NSString *)selectedImageName addTarget:(id)object action:(SEL)selector;
@end

NS_ASSUME_NONNULL_END
