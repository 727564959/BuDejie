//
//  BDRefreshView.m
//  Budejie
//
//  Created by zq m on 2020/5/11.
//  Copyright © 2020 zq m. All rights reserved.
//

#import "BDRefreshView.h"

@interface BDRefreshView()
@property (nonatomic, strong) UIImageView *icon;
@property (nonatomic, strong) UILabel *label;
@property (nonatomic,strong) UIView *contentView;
@property (nonatomic, strong) NSMutableArray<UIImage *> *imageOfStatus;
@property (nonatomic, strong) NSMutableArray<NSString *> *stringOfStatus;
@end

@implementation BDRefreshView
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.statu = BDRefreshStatuNormal;
        self.contentView = [[UIView alloc] initWithFrame:self.bounds];
        [self addSubview:self.contentView];
    }
    return self;
}

-(void)layoutSubviews {
    [super layoutSubviews];
    [self setStatu:self.statu];
    [self.label sizeToFit];
    if (self.icon && self.label) {
        self.icon.x = (self.contentView.width - self.icon.width - self.label.width) / 2;
        self.icon.centerY = self.contentView.centerY;
        self.label.x = self.icon.x + self.icon.width;
        self.label.y = self.contentView.centerY;
    } else if (self.label && !self.icon) {
        self.label.center = self.contentView.center;
    } else if (!self.label && self.icon) {
        self.icon.center = self.icon.center;
    }
}

- (void)setImage:(UIImage *)image refreshStatus:(BDRefreshStatu)statu {
    if (_icon == nil) {
        _icon = [[UIImageView alloc] init];
        [self.contentView addSubview:_icon];
    }
    self.imageOfStatus[statu] = image;
}

- (void)setLabelTitle:(NSString *)title refreshStatus:(BDRefreshStatu)statu {
    if (_label == nil) {
        _label = [[UILabel alloc] init];
        _label.center = self.center;
        _label.numberOfLines = 1;
        _label.font = [UIFont systemFontOfSize:16];

        [self.contentView addSubview:_label];
    }
    self.stringOfStatus[statu] = title;
}

#pragma mark - setter && getter
- (NSArray<UIImage *> *)imageOfStatus {
    if (_imageOfStatus == nil) {
        _imageOfStatus = [[NSMutableArray alloc] initWithCapacity:BDRefreshStatusCount];
        for (int i = 0; i < BDRefreshStatusCount; i++) {
            [_imageOfStatus addObject:(UIImage *)[NSNull null]];
        }
    }
    return _imageOfStatus;
}
- (NSArray<NSString *> *)stringOfStatus {
    if (_stringOfStatus == nil) {
        _stringOfStatus = [[NSMutableArray alloc] initWithCapacity:BDRefreshStatusCount];
        for (int i = 0; i < BDRefreshStatusCount; i++) {
            [_stringOfStatus addObject:(NSString *)[NSNull null]];
        }
    }
    return _stringOfStatus;
}

- (void)setStatu:(BDRefreshStatu)statu {
    _statu = statu;
    self.icon.image = self.imageOfStatus[statu];
    self.label.text = self.stringOfStatus[statu];
}
@end
