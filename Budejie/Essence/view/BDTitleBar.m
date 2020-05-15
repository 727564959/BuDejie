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
@property (nonatomic, strong) NSMutableArray<UIButton *> *buttons;
@end
@implementation BDTitleBar

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor lightGrayColor];
        self.alpha = 0.6;
        self.page = 0;
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
    self.buttons = [NSMutableArray array];
    NSArray *titles = @[@"全部", @"视频", @"声音", @"图片", @"段子"];
    CGFloat buttonWidth = self.width / titles.count;
    CGFloat buttonHight = self.height;
    for (int i = 0; i < titles.count; i++) {
        BDTitleButton *button = [[BDTitleButton alloc] initWithFrame:CGRectMake(i * buttonWidth, 0, buttonWidth, buttonHight)];
        [button setTitle:titles[i] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [button.titleLabel setFont:[UIFont systemFontOfSize:15]];
        [self addSubview:button];
        [self.buttons addObject:button];
    }
    UIButton *btn = self.buttons[0];
    btn.selected = YES;
    self.lastBtn = btn;
    [btn.titleLabel sizeToFit];
    self.line.width = btn.titleLabel.width - 10;
    self.line.centerX = btn.centerX;
}



- (void)buttonClick:(UIButton *)btn {
    //判断是否重复点击
    NSInteger index = [self.buttons indexOfObject:btn];
    if (self.lastBtn == btn)
        if ([self.delegate respondsToSelector:@selector(repeatClickButton)])
            [self.delegate repeatClickButton];
 
    if([self.delegate respondsToSelector:@selector(clickOtherButton:)])
        [self.delegate clickOtherButton:index];
    self.page = index;
}


-(void)setPage:(NSInteger)page {
    _page = page;
    UIButton *btn = self.buttons[page];
    self.lastBtn.selected = NO;
    btn.selected = YES;
    self.lastBtn = btn;
    [UIView animateWithDuration:0.3 animations:^{
        self.line.width = btn.titleLabel.width - 10;
        self.line.centerX = btn.centerX;
    }];
}


@end
