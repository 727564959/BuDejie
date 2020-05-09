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
@interface BDEssenceViewController ()<BDTitleBarDelegate,UIScrollViewDelegate>
@property (nonatomic, weak) BDTitleBar *titleBar;
@property (nonatomic, weak) UIScrollView *scrollView;
@end

@implementation BDEssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupScrollView];
    [self setupChildVC];
    [self setupNavBar];
    [self setupTitleBar];
}
-(void)viewDidAppear:(BOOL)animated {
    [self loadChildVCWithIndex:0];
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
    scrollView.delegate = self;
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
    titleBar.delegate = self;
    [self.view addSubview:titleBar];
    self.titleBar = titleBar;
}

- (void)changePage:(NSInteger)page {
    [UIView animateWithDuration:0.3 animations:^{
        CGPoint offset = self.scrollView.contentOffset;
        offset.x = page * self.scrollView.width;
        self.scrollView.contentOffset = offset;
    } completion:^(BOOL finished) {
        [self loadChildVCWithIndex:page];
    }];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    self.titleBar.page = (NSInteger)(scrollView.contentOffset.x / scrollView.width);
    [self loadChildVCWithIndex:self.titleBar.page];
}

- (void)loadChildVCWithIndex:(NSInteger)index {
    UIViewController *vc = self.childViewControllers[index];
    vc.view.frame = self.scrollView.bounds;
    [self.scrollView addSubview:vc.view];
}
@end
