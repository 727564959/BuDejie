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

@interface BDTabBarController ()

@end

@implementation BDTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupAllChildControll];
}
- (void)setupAllChildControll {
    BDEssenceViewController *essenceVC = [[BDEssenceViewController alloc] init];
    [self setItemControll:essenceVC itemTitle:@"精华" imageName:@"tabBar_essence_icon" selectedImageName:@"tabBar_essence_click_icon"];
    
    BDMeViewController *meVC = [[BDMeViewController alloc] init];
    [self setItemControll:meVC itemTitle:@"我" imageName:@"tabBar_me_icon" selectedImageName:@"tabBar_me_click_icon"];
    
    BDNewViewController *newVC = [[BDNewViewController alloc] init];
    [self setItemControll:newVC itemTitle:@"新帖" imageName:@"tabBar_new_icon" selectedImageName:@"tabBar_new_click_icon"];
    
    BDFriendViewController *friendVC = [[BDFriendViewController alloc] init];
    [self setItemControll:friendVC itemTitle:@"关注" imageName:@"tabBar_friend_icon" selectedImageName:@"tabBar_friend_click_icon"];
    
    BDPubilcViewController *pubilcVC = [[BDPubilcViewController alloc] init];
    [self setItemControll:pubilcVC itemTitle:nil imageName:@"tabBar_pubilc_icon" selectedImageName:@"tabBar_pubilc_click_icon"];
}

-(void)setItemControll:(UIViewController * _Nonnull)VC itemTitle:(NSString * _Nullable)title imageName:(NSString * _Nonnull)imageName selectedImageName:(NSString *_Nonnull)selectedImage
{
    UINavigationController *NaviVC = [[UINavigationController alloc] initWithRootViewController:VC];
    [self addChildViewController:NaviVC];
    NaviVC.tabBarItem.title = title;
    NaviVC.tabBarItem.image = [UIImage imageNamed:imageName];
    NaviVC.tabBarItem.image = [UIImage imageNamed:selectedImage];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
