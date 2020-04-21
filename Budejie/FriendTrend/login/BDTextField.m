//
//  BDTextField.m
//  Budejie
//
//  Created by zq m on 2020/4/21.
//  Copyright © 2020 zq m. All rights reserved.
//

#import "BDTextField.h"

@implementation BDTextField


-(instancetype)initWithCoder:(NSCoder *)coder {
    if (self = [super initWithCoder:coder]) {
        [self setValue:[UIColor grayColor] forKeyPath:@"placeholderLabel.textColor"];
    }
    return self;
}
@end
