//
//  BDTextField.m
//  Budejie
//
//  Created by zq m on 2020/4/21.
//  Copyright © 2020 zq m. All rights reserved.
//

#import "BDTextField.h"

@implementation BDTextField

-(void)awakeFromNib {
    [super awakeFromNib];
    [self setValue:[UIColor grayColor] forKeyPath:@"placeholderLabel.textColor"];
    [self addTarget:self action:@selector(textBegin) forControlEvents:UIControlEventEditingDidBegin];
    [self addTarget:self action:@selector(textEnd) forControlEvents:UIControlEventEditingDidEnd];
}
-(instancetype)initWithCoder:(NSCoder *)coder {
    if (self = [super initWithCoder:coder]) {
        [self setValue:[UIColor grayColor] forKeyPath:@"placeholderLabel.textColor"];
    }
    return self;
}

-(void)textBegin {
    [self setValue:[UIColor whiteColor] forKeyPath:@"placeholderLabel.textColor"];
}

-(void)textEnd {
    [self setValue:[UIColor grayColor] forKeyPath:@"placeholderLabel.textColor"];
}
@end
