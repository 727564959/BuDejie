//
//  BDBaseSubViewController.m
//  Budejie
//
//  Created by zq m on 2020/5/9.
//  Copyright © 2020 zq m. All rights reserved.
//

#import "BDBaseSubViewController.h"
#import "BDRefreshView.h"
@interface BDBaseSubViewController ()
@property (nonatomic, strong) BDRefreshView *headRefreshView;
@property (nonatomic, strong) BDRefreshView *footRefreshView;
@property (nonatomic, assign) NSInteger count;
@end

@implementation BDBaseSubViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.count = 20;
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.contentInset = UIEdgeInsetsMake(kNavBarAndStatusBarHeight + kTitleBarHeight, 0, kTabBarHeight, 0);
    [self setupRefreshView];
}
- (void)setupRefreshView {
    self.footRefreshView = [[BDRefreshView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 80)];
    [self.footRefreshView setLabelTitle:@"向下拉动刷新" refreshStatus:BDRefreshStatuNormal];
    [self.footRefreshView setLabelTitle:@"正在刷新中" refreshStatus:BDRefreshStatuBegin];
    self.tableView.tableFooterView = self.footRefreshView;
    
    self.headRefreshView = [[BDRefreshView alloc] initWithFrame:CGRectMake(0, -50, kScreenWidth, 50)];
    [self.headRefreshView setLabelTitle:@"向上拉动刷新" refreshStatus:BDRefreshStatuNormal];
    [self.headRefreshView setLabelTitle:@"松开手指刷新" refreshStatus:BDRefreshStatuWill];
    [self.headRefreshView setLabelTitle:@"正在刷新中" refreshStatus:BDRefreshStatuBegin];
    [self.tableView addSubview:self.headRefreshView];
}

#pragma mark - UIScrollViewDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView.contentOffset.y <= -50 - kNavBarAndStatusBarHeight - kTitleBarHeight
        && self.headRefreshView.statu != BDRefreshStatuBegin) {
        self.headRefreshView.statu = BDRefreshStatuWill;
    } else if (scrollView.contentOffset.y > -50 - kNavBarAndStatusBarHeight - kTitleBarHeight
    && self.headRefreshView.statu != BDRefreshStatuBegin){
        self.headRefreshView.statu = BDRefreshStatuNormal;
    }
    
    self.headRefreshView.hidden = (scrollView.contentOffset.y >= -kNavBarAndStatusBarHeight - kTitleBarHeight);
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if (scrollView.contentSize.height <= scrollView.contentOffset.y + scrollView.height) {
        self.footRefreshView.statu = BDRefreshStatuBegin;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            self.count += 10;
            [self.tableView reloadData];
            self.footRefreshView.statu = BDRefreshStatuNormal;
        });
    }
    
    if (scrollView.contentOffset.y <= - 50 - kNavBarAndStatusBarHeight - kTitleBarHeight) {
        self.headRefreshView.statu = BDRefreshStatuBegin;
        scrollView.contentInset = UIEdgeInsetsMake(kNavBarAndStatusBarHeight + kTitleBarHeight + 50, 0, kTabBarHeight, 0);
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            self.tableView.contentInset = UIEdgeInsetsMake(kNavBarAndStatusBarHeight + kTitleBarHeight, 0, kTabBarHeight, 0);
            self.count = 20;
            [self.tableView reloadData];
            self.headRefreshView.statu = BDRefreshStatuNormal;
        });
    }
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.count;
}
@end
