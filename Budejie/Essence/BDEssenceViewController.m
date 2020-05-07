//
//  BDEssenceViewController.m
//  Budejie
//
//  Created by zq m on 2020/3/17.
//  Copyright © 2020 zq m. All rights reserved.
//

#import "BDEssenceViewController.h"
#import "BDTitleBar.h"
@interface BDEssenceViewController ()
@property (nonatomic, weak) BDTitleBar *titleBar;
@property (nonatomic, weak) UIScrollView *scrollView;
@end

@implementation BDEssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupScrollView];
    [self setupNavBar];
    [self setupTitleBar];
}

-(void) setupScrollView {
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    scrollView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:scrollView];
    self.scrollView = scrollView;
}

- (void)setupNavBar {
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImageName:@"nav_item_game_icon" itemWithHighlightedImageName:@"nav_item_game_click_icon" addTarget:nil action:nil];
}

- (void)setupTitleBar {
    BDTitleBar *titleBar = [[BDTitleBar alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 50)];
    [self.scrollView addSubview:titleBar];
    self.titleBar = titleBar;
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
