//
//  BDLoginView.m
//  Budejie
//
//  Created by zq m on 2020/4/21.
//  Copyright © 2020 zq m. All rights reserved.
//

#import "BDLoginView.h"
@interface BDLoginView()

@end


@implementation BDLoginView
+ (UIView *)logInView {
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] firstObject];
}

+ (UIView *)registerView {
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}
@end
