//
//  BDRefreshView.h
//  Budejie
//
//  Created by zq m on 2020/5/11.
//  Copyright © 2020 zq m. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
static const int BDRefreshStatusCount = 6;
typedef NS_ENUM(NSUInteger, BDRefreshStatu) {
    BDRefreshStatuNone,
    BDRefreshStatuNormal,
    BDRefreshStatuWill,
    BDRefreshStatuBegin,
    BDRefreshStatuSuccees,
    BDRefreshStatuFail
};

@interface BDRefreshView : UIView
@property (nonatomic, assign) BDRefreshStatu statu;
- (void)setLabelTitle:(NSString *)title refreshStatus:(BDRefreshStatu)statu;
- (void)setImage:(UIImage *)image refreshStatus:(BDRefreshStatu)statu;

@end

NS_ASSUME_NONNULL_END
