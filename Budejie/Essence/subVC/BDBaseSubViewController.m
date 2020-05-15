//
//  BDBaseSubViewController.m
//  Budejie
//
//  Created by zq m on 2020/5/9.
//  Copyright © 2020 zq m. All rights reserved.
//

#import "BDBaseSubViewController.h"
#import "BDRefreshView.h"
#import "BDHTTPSessionManager.h"
#import "BDEssenceMode.h"
#import "BDEssenceCell.h"
#import <MJExtension/MJExtension.h>

@interface BDBaseSubViewController ()
@property (nonatomic, strong) BDRefreshView *headRefreshView;
@property (nonatomic, strong) BDRefreshView *footRefreshView;
@property (nonatomic, strong) BDHTTPSessionManager *manager;
@property (nonatomic, strong) NSMutableArray<BDEssenceMode *> *modes;
@property (nonatomic, strong) NSNumber *count;
@property (nonatomic, assign) BOOL mouse;
@property (nonatomic, assign) NSInteger maxtime;
@end

@implementation BDBaseSubViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.maxtime = 10000;
    UINib *nib = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([BDEssenceCell class]) owner:nil options:nil] firstObject];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"BDEssenceCell"];
    self.manager = [BDHTTPSessionManager manager];
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.contentInset = UIEdgeInsetsMake(scrollTopOffsetY, 0, kTabBarHeight, 0);
    [self setupRefreshView];
}

- (void)setupRefreshView {
    self.footRefreshView = [[BDRefreshView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, refreshFooterHeight)];
    [self.footRefreshView setLabelTitle:@"向下拉动刷新" refreshStatus:BDRefreshStatuNormal];
    [self.footRefreshView setLabelTitle:@"正在刷新中" refreshStatus:BDRefreshStatuBegin];
    self.tableView.tableFooterView = self.footRefreshView;
    
    self.headRefreshView = [[BDRefreshView alloc] initWithFrame:CGRectMake(0, -refreshHeaderHeight, kScreenWidth, refreshHeaderHeight)];
    self.headRefreshView.hidden = YES;
    [self.headRefreshView setLabelTitle:@"向上拉动刷新" refreshStatus:BDRefreshStatuNormal];
    [self.headRefreshView setLabelTitle:@"松开手指刷新" refreshStatus:BDRefreshStatuWill];
    [self.headRefreshView setLabelTitle:@"正在刷新中" refreshStatus:BDRefreshStatuBegin];
    [self.headRefreshView setLabelTitle:@"刷新成功" refreshStatus:BDRefreshStatuSuccees];
    [self.tableView addSubview:self.headRefreshView];
}

#pragma mark - UIScrollViewDelegate

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    self.mouse = YES;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (self.mouse == YES) {
        if (scrollView.contentOffset.y <= -refreshHeaderTopOffsetY) {
            self.headRefreshView.statu = BDRefreshStatuWill;
        } else if (scrollView.contentOffset.y > -refreshHeaderTopOffsetY){
            self.headRefreshView.statu = BDRefreshStatuNormal;
        }
    }
    self.headRefreshView.hidden = (scrollView.contentOffset.y >= -scrollTopOffsetY);
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if (scrollView.contentSize.height <= scrollView.contentOffset.y + scrollView.height - refreshFooterHeight) {
        [self appendNewData];
    }
    
    if (scrollView.contentOffset.y <= -refreshHeaderTopOffsetY) {
        [self reloadData];
    }
    self.mouse = NO;
}


#pragma mark - load data
- (void)reloadData {
    self.headRefreshView.statu = BDRefreshStatuBegin;
    self.tableView.contentInset = UIEdgeInsetsMake(refreshHeaderTopOffsetY, 0, kTabBarHeight, 0);
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"a"] = @"list";
    parameters[@"c"] = @"data";
    parameters[@"type"] = @"1";
    [self.manager.tasks makeObjectsPerformSelector:@selector(cancel)];
    [self.manager GET:@"http://api.budejie.com/api/api_open.php" parameters:parameters progress:nil
      success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary *  _Nullable responseObject) {
        BDWriteToPlist(responseObject);
        self.count = responseObject[@"count"];
        self.modes = [BDEssenceMode mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        [self.tableView reloadData];
        self.headRefreshView.statu = BDRefreshStatuSuccees;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            self.tableView.contentInset = UIEdgeInsetsMake(scrollTopOffsetY, 0, kTabBarHeight, 0);
        });
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        self.headRefreshView.statu = BDRefreshStatuSuccees;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            self.tableView.contentInset = UIEdgeInsetsMake(scrollTopOffsetY, 0, kTabBarHeight, 0);
        });
    }];
}


- (void)repeatClickForReloadData {
    CGPoint offset = self.tableView.contentOffset;
    offset.y = -refreshHeaderTopOffsetY;
    
    [UITableView animateWithDuration:2 animations:^{
        self.tableView.contentOffset = offset;
    } completion:^(BOOL finished) {
        [self reloadData];
    }];

}
- (void)appendNewData {
    
    self.footRefreshView.statu = BDRefreshStatuBegin;
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"a"] = @"list";
    parameters[@"c"] = @"data";
    parameters[@"type"] = @"1";
    parameters[@"maxtime"] = @(self.maxtime);
    [self.manager.tasks makeObjectsPerformSelector:@selector(cancel)];
    [self.manager GET:@"http://api.budejie.com/api/api_open.php" parameters:parameters progress:nil
      success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary *  _Nullable responseObject) {
        BDWriteToPlist(responseObject);
        self.maxtime = [(NSNumber *)responseObject[@"maxtime"] integerValue];
        NSArray *array = [BDEssenceMode mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        [self.modes addObjectsFromArray:array];
        [self.tableView reloadData];
        self.footRefreshView.statu = BDRefreshStatuNormal;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            self.tableView.contentInset = UIEdgeInsetsMake(scrollTopOffsetY, 0, kTabBarHeight, 0);
        });
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        self.footRefreshView.statu = BDRefreshStatuNormal;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            self.tableView.contentInset = UIEdgeInsetsMake(scrollTopOffsetY, 0, kTabBarHeight, 0);
        });
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.modes.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BDEssenceCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BDEssenceCell" forIndexPath:indexPath];
    cell.textLabel.text = self.modes[indexPath.row].name;
    return cell;
}
@end
