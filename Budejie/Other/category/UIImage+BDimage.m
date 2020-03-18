//
//  UIImage+BDimage.m
//  Budejie
//
//  Created by zq m on 2020/3/18.
//  Copyright © 2020 zq m. All rights reserved.
//

#import "UIImage+BDimage.h"




@implementation UIImage (BDimage)

+(UIImage *)imageOrignalNamed:(NSString *)name
{
    UIImage *img = [self imageNamed:name];
    return [img imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

@end
