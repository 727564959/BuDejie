//
//  BDTopicCell.h
//  Budejie
//
//  Created by zq m on 2020/4/1.
//  Copyright © 2020 zq m. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BDSubTopicMode.h"
NS_ASSUME_NONNULL_BEGIN

@interface BDTopicCell : UITableViewCell
@property (nonatomic, strong) BDSubTopicMode *item;
@end

NS_ASSUME_NONNULL_END
