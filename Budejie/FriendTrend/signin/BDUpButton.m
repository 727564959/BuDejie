//
//  BDUpButton.m
//  Budejie
//
//  Created by zq m on 2020/4/21.
//  Copyright © 2020 zq m. All rights reserved.
//

#import "BDUpButton.h"

@implementation BDUpButton

-(void)layoutSubviews {
    [super layoutSubviews];
    self.imageView.centerX = self.width / 2;
    self.imageView.y = 0;
    [self.titleLabel sizeToFit];
    self.titleLabel.centerX = self.width / 2;
    
    self.titleLabel.y = self.imageView.y + 20 + self.imageView.height;
}

@end
