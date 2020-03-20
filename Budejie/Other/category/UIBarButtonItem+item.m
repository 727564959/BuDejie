//
//  UIBarButtonItem+item.m
//  Budejie
//
//  Created by zq m on 2020/3/20.
//  Copyright © 2020 zq m. All rights reserved.
//

#import "UIBarButtonItem+item.h"




@implementation UIBarButtonItem (item)
+ (UIBarButtonItem *)itemWithImageName:(NSString *)imageName itemWithHighlightedImageName:(NSString *)highlightedImageName addTarget:(id)object action:(SEL)selector{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:highlightedImageName] forState:UIControlStateHighlighted];
    [btn addTarget:object action:selector forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *result = [[UIBarButtonItem alloc] initWithCustomView:btn];
    return result;
}

+ (UIBarButtonItem *)itemWithImageName:(NSString *)imageName itemWithSelectedImageName:(NSString *)selectedImageName addTarget:(id)object action:(SEL)selector{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:selectedImageName] forState:UIControlStateSelected];
    [btn addTarget:object action:selector forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *result = [[UIBarButtonItem alloc] initWithCustomView:btn];
    [btn addTarget:self action:@selector(buttonSelected:) forControlEvents:UIControlEventTouchUpInside];
    return result;
}
+ (void) buttonSelected:(UIButton *)btn
{
    btn.selected = !btn.selected;
}
@end
