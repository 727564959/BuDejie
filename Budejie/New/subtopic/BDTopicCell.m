//
//  BDTopicCell.m
//  Budejie
//
//  Created by zq m on 2020/4/1.
//  Copyright © 2020 zq m. All rights reserved.
//

#import "BDTopicCell.h"
#import <SDWebImage.h>
@interface BDTopicCell()

@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *count;
@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UIButton *button;
@end
@implementation BDTopicCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.icon.layer.cornerRadius = 30;
    self.layer.masksToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setItem:(BDSubTopicMode *)item {
    _item = item;
    [self.icon sd_setImageWithURL:[NSURL URLWithString:_item.image_list] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
    self.name.text = item.theme_name;
    self.count.text = item.sub_number;
}
@end
