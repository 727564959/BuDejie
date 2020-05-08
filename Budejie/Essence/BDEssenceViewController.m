//
//  BDEssenceViewController.m
//  Budejie
//
//  Created by zq m on 2020/3/17.
//  Copyright © 2020 zq m. All rights reserved.
//

#import "BDEssenceViewController.h"
#import "BDAllViewController.h"
#import "BDVideoViewController.h"
#import "BDListenViewController.h"
#import "BDWordViewController.h"
#import "BDPictureViewController.h"
#import "BDTitleBar.h"
@interface BDEssenceViewController ()
@property (nonatomic, weak) BDTitleBar *titleBar;
@property (nonatomic, weak) UIScrollView *scrollView;
@end

@implementation BDEssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupChildVC];
    [self setupScrollView];
    [self setupNavBar];
    [self setupTitleBar];
}

-(void) setupChildVC {
    [self addChildViewController:[[BDAllViewController alloc] init]];
    [self addChildViewController:[[BDVideoViewController alloc] init]];
    [self addChildViewController:[[BDListenViewController alloc] init]];
    [self addChildViewController:[[BDPictureViewController alloc] init]];
    [self addChildViewController:[[BDWordViewController alloc] init]];
}
-(void) setupScrollView {
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    NSInteger count = self.childViewControllers.count;
    scrollView.backgroundColor = [UIColor whiteColor];
    scrollView.contentSize = CGSizeMake(count * kScreenWidth, 0);
    for (int i = 0; i < count; i++) {
        UIViewController *vc = self.childViewControllers[i];
        vc.view.frame = CGRectMake(i * kScreenWidth, -kNavBarAndStatusBarHeight, kScreenWidth, kScreenHeight);
        [scrollView addSubview:vc.view];
    }
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.pagingEnabled = YES;
    [self.view addSubview:scrollView];
    self.scrollView = scrollView;
}

- (void)setupNavBar {
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
//    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImageName:@"nav_item_game_icon" itemWithHighlightedImageName:@"nav_item_game_click_icon" addTarget:nil action:nil];
}

- (void)setupTitleBar {
    BDTitleBar *titleBar = [[BDTitleBar alloc] initWithFrame:CGRectMake(0, kNavBarAndStatusBarHeight, self.view.width, 40)];
    [self.view addSubview:titleBar];
    self.titleBar = titleBar;
}

@end
