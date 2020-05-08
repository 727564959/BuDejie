//
//  BDTitleBar.m
//  Budejie
//
//  Created by zq m on 2020/5/7.
//  Copyright © 2020 zq m. All rights reserved.
//

#import "BDTitleBar.h"
#import "BDTitleButton.h"
@interface BDTitleBar()
@property (nonatomic, weak) UIButton *lastBtn;
@property (nonatomic, weak) UIView *line;
@end
@implementation BDTitleBar

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor lightGrayColor];
        self.alpha = 0.6;
        [self setupLine];
        [self setuptitles];
    }
    return self;
}
- (void)setupLine {
    UIView *line = [[UIView alloc] init];
    line.height = 2;
    line.y = self.height - line.height;
    line.backgroundColor = [UIColor redColor];
    [self addSubview:line];
    self.line = line;
}
- (void)setuptitles {
    NSArray *titles = @[@"全部", @"视频", @"声音", @"图片", @"段子"];
    CGFloat buttonWidth = self.width / titles.count;
    CGFloat buttonHight = self.height;
    for (int i = 0; i < titles.count; i++) {
        BDTitleButton *button = [[BDTitleButton alloc] initWithFrame:CGRectMake(i * buttonWidth, 0, buttonWidth, buttonHight)];
        [button setTitle:titles[i] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [button.titleLabel setFont:[UIFont systemFontOfSize:15]];
        [self addSubview:button];
        if (i == 0) {
            button.selected = YES;
            self.lastBtn = button;
            [button.titleLabel sizeToFit];
            self.line.width = button.titleLabel.width - 10;
            self.line.centerX = button.centerX;
        }
    }
}
- (void)buttonClick:(UIButton *)btn {
    self.lastBtn.selected = NO;
    btn.selected = YES;
    self.lastBtn = btn;
    [UIView animateWithDuration:0.3 animations:^{
        self.line.width = btn.titleLabel.width - 10;
        self.line.centerX = btn.centerX;
    }];
}
@end
