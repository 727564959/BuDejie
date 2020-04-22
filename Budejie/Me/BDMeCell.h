//
//  BDMeCell.h
//  Budejie
//
//  Created by zq m on 2020/4/22.
//  Copyright © 2020 zq m. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class BDMeItem;
@interface BDMeCell : UICollectionViewCell
@property (nonatomic, strong) BDMeItem *item;
@end

NS_ASSUME_NONNULL_END
