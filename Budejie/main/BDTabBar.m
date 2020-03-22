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
@end

@implementation BDTabBar
-(instancetype)init{
    if (self = [super init]) {
        [self addSubview:self.btn];
    }
    return self;
}
-(void)layoutSubviews {
    [super layoutSubviews];
    CGFloat btnW = self.bounds.size.width / 5;
    CGFloat btnH = 0.0;
    int i = 0;
    for (UIView *v  in self.subviews) {
        if (i == 2) {
            i++;
        }
        if ([v isKindOfClass: NSClassFromString(@"UITabBarButton")]) {
            btnH = v.bounds.size.height;
            v.frame = CGRectMake(btnW * i, 0, btnW, btnH);
            i++;
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
@end
