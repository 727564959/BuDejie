//
//  BDEssenceCell.m
//  Budejie
//
//  Created by zq m on 2020/5/15.
//  Copyright © 2020 zq m. All rights reserved.
//

#import "BDEssenceCell.h"
@interface BDEssenceCell()
@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *time;
@property (weak, nonatomic) IBOutlet UILabel *text;
@property (weak, nonatomic) IBOutlet UIButton *ding;
@property (weak, nonatomic) IBOutlet UIButton *cai;
@property (weak, nonatomic) IBOutlet UIButton *transport;
@property (weak, nonatomic) IBOutlet UIButton *comment;
@end



@implementation BDEssenceCell
-(instancetype)initWithCoder:(NSCoder *)coder {
    return [super initWithCoder:coder];
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}


-(void)setMode:(BDEssenceMode *)mode {
    _mode = mode;
    _name.text = mode.name;
    _time.text = mode.passtime;
    _text.text = mode.text;
    
}
@end
