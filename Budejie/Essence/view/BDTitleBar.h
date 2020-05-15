//
//  BDTitleBar.h
//  Budejie
//
//  Created by zq m on 2020/5/7.
//  Copyright © 2020 zq m. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol BDTitleBarDelegate <NSObject>
- (void)clickOtherButton:(NSInteger)index;
- (void)repeatClickButton;
@end


@interface BDTitleBar : UIView
@property (nonatomic, assign) NSInteger page;
@property (nonatomic, weak) id<BDTitleBarDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
