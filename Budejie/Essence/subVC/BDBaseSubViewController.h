//
//  BDBaseSubViewController.h
//  Budejie
//
//  Created by zq m on 2020/5/9.
//  Copyright © 2020 zq m. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
static const CGFloat refreshHeaderHeight = 50;
static const CGFloat refreshFooterHeight = 80;
#define scrollTopOffsetY (kNavBarAndStatusBarHeight + kTitleBarHeight)
#define refreshHeaderTopOffsetY (scrollTopOffsetY + refreshHeaderHeight)


@interface BDBaseSubViewController : UITableViewController
- (void)repeatClickForReloadData;

@end

NS_ASSUME_NONNULL_END
