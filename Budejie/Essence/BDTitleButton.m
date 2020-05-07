//
//  BDTitleButton.m
//  Budejie
//
//  Created by zq m on 2020/5/7.
//  Copyright © 2020 zq m. All rights reserved.
//

#import "BDTitleButton.h"

@implementation BDTitleButton

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    }
    return self;
}

-(void)setHighlighted:(BOOL)highlighted {
    
}

@end
