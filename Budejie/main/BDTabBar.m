//
//  BDTabBar.m
//  Budejie
//
//  Created by zq m on 2020/3/18.
//  Copyright © 2020 zq m. All rights reserved.
//

#import "BDTabBar.h"
@interface BDTabBar()
@property (nonatomic, strong) UIButton *btn;
@property (nonatomic, strong) UIControl *lastCtl;
@end

@implementation BDTabBar
-(instancetype)init{
    if (self = [super init]) {
        [self addSubview:self.btn];
        self.alpha = 0.95;
    }
    return self;
}
-(void)layoutSubviews {
    [super layoutSubviews];
    CGFloat btnW = self.bounds.size.width / 5;
    CGFloat btnH = 0.0;
    int i = 0;
    for (UIControl *v  in self.subviews) {
        if (i == 2) {
            i++;
        }
        if ([v isKindOfClass: NSClassFromString(@"UITabBarButton")]) {
            if (i == 0 && !self.lastCtl) {
                self.lastCtl = v;
            }
            btnH = v.bounds.size.height;
            v.frame = CGRectMake(btnW * i, 0, btnW, btnH);
            i++;
            [v addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        }
    }
    self.btn.center = CGPointMake(self.bounds.size.width / 2, btnH / 2);
}

-(UIButton *)btn {
    if (_btn == nil) {
        _btn = [[UIButton alloc] init];
        [_btn setImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [_btn setImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
        [_btn sizeToFit];
    }
    return _btn;
}

-(void)click:(UIControl *)ctl {
    //判断是否重复点击
    if (ctl == self.lastCtl) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"BDTabbarDidRepeatClickNotification" object:nil];
    }
    self.lastCtl = ctl;
}
@end
