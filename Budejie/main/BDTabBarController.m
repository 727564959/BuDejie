//
//  BDTabBarController.m
//  Budejie
//
//  Created by zq m on 2020/3/17.
//  Copyright © 2020 zq m. All rights reserved.
//

#import "BDTabBarController.h"
#import "BDMeViewController.h"
#import "BDNewViewController.h"
#import "BDFriendViewController.h"
#import "BDPubilcViewController.h"
#import "BDEssenceViewController.h"
#import "UIImage+BDimage.h"
#import "BDTabBar.h"
#import "BDNavigationViewController.h"
@interface BDTabBarController ()
@end
static BDTabBarController* instance = nil;
@implementation BDTabBarController
+ (instancetype)defaultTabbarVC {
    static dispatch_once_t onceToken;
       dispatch_once(&onceToken, ^{
           instance = [[self alloc] init];
       });
       return instance;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setValue:[[BDTabBar alloc] init] forKey:@"tabBar"];
    [self setupAllChildControll];
}
- (void)setupAllChildControll {
    BDEssenceViewController *essenceVC = [[BDEssenceViewController alloc] init];
    [self setItemControll:essenceVC itemTitle:@"精华" imageName:@"tabBar_essence_icon" selectedImageName:@"tabBar_essence_click_icon"];
    
    BDNewViewController *newVC = [[BDNewViewController alloc] init];
    [self setItemControll:newVC itemTitle:@"新帖" imageName:@"tabBar_new_icon" selectedImageName:@"tabBar_new_click_icon"];
    
    
    BDFriendViewController *friendVC = [[BDFriendViewController alloc] init];
    [self setItemControll:friendVC itemTitle:@"关注" imageName:@"tabBar_friendTrends_icon" selectedImageName:@"tabBar_friendTrends_click_icon"];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:NSStringFromClass([BDMeViewController class]) bundle:nil];
    BDMeViewController *meVC = [storyboard instantiateInitialViewController];
    [self setItemControll:meVC itemTitle:@"我" imageName:@"tabBar_me_icon" selectedImageName:@"tabBar_me_click_icon"];
}

-(void)setItemControll:(UIViewController * _Nonnull)VC itemTitle:(NSString * _Nullable)title imageName:(NSString * _Nonnull)imageName selectedImageName:(NSString *_Nonnull)selectedImageName {
    BDNavigationViewController *NaviVC = [[BDNavigationViewController alloc] initWithRootViewController:VC];
    [self addChildViewController:NaviVC];
    NaviVC.tabBarItem.title = title;
    
    NSMutableDictionary * norAttrs = [NSMutableDictionary dictionary];
       norAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
       [NaviVC.tabBarItem setTitleTextAttributes:norAttrs forState:UIControlStateNormal];
    NSMutableDictionary * attrs = [NSMutableDictionary dictionary];
       attrs[NSForegroundColorAttributeName] = [UIColor blackColor];
       [NaviVC.tabBarItem setTitleTextAttributes:attrs forState:UIControlStateSelected];
    NaviVC.tabBarItem.image = [UIImage imageOrignalNamed:imageName];
    
    NaviVC.tabBarItem.selectedImage = [UIImage imageOrignalNamed:selectedImageName];
    
    self.tabBar.tintColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1];
    self.tabBar.barTintColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1];
}

@end
