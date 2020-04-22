//
//  BDMeCell.m
//  Budejie
//
//  Created by zq m on 2020/4/22.
//  Copyright © 2020 zq m. All rights reserved.
//

#import "BDMeCell.h"
#import "BDMeItem.h"
#import <SDWebImage.h>
@interface BDMeCell()
@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *name;
@end

@implementation BDMeCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
}

-(void)setItem:(BDMeItem *)item {
    _item = item;
    self.name.text = item.name;
    [self.icon sd_setImageWithURL:[NSURL URLWithString:item.icon]];
}
@end
