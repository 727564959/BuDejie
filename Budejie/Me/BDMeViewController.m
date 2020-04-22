//
//  BDMeViewController.m
//  Budejie
//
//  Created by zq m on 2020/3/17.
//  Copyright © 2020 zq m. All rights reserved.
//

#import "BDMeViewController.h"
#import "BDSettingViewController.h"
#import "BDHTTPSessionManager.h"
#import "BDMeCell.h"
#import <MJExtension/MJExtension.h>
#import "BDMeItem.h"
@interface BDMeViewController () <UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic, strong) NSMutableArray *items;
@property (nonatomic, strong) UICollectionView *collectionView;
@end

@implementation BDMeViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.contentInset = UIEdgeInsetsMake(-25, 0, 0, 0);
    [self setupCollectionView];
    [self setupNavBar];
    [self loadData];
}

-(void)loadData {
    BDHTTPSessionManager * manager = [BDHTTPSessionManager manager];
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"a"] = @"square";
    parameters[@"c"] = @"topic";
    __weak BDMeViewController *weakSelf = self;
    [manager GET:@"http://api.budejie.com/api/api_open.php" parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSMutableDictionary*  _Nullable responseObject) {
        weakSelf.items = [BDMeItem mj_objectArrayWithKeyValuesArray:responseObject[@"square_list"]];
        [weakSelf.items removeLastObject];
        [weakSelf.collectionView reloadData];
        CGFloat width = (BDScreenWidth - 3) / 4;
        CGFloat height = ((weakSelf.items.count - 1)/ 4 + 1) * (width + 1);
        weakSelf.collectionView.frame = CGRectMake(0, 0, BDScreenWidth, height);
        self.tableView.tableFooterView = self.collectionView;
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

-(void)setupNavBar {
    self.navigationItem.title = @"我的";
    UIBarButtonItem *nightItem = [UIBarButtonItem itemWithImageName:@"mine-moon-icon" itemWithSelectedImageName:@"mine-moon-icon-click" addTarget:nil action:nil];
    UIBarButtonItem *setItem = [UIBarButtonItem itemWithImageName:@"mine-setting-icon" itemWithHighlightedImageName:@"mine-setting-icon-click" addTarget:self action:@selector(setting)];
    self.navigationItem.rightBarButtonItems = @[setItem,nightItem];
}

- (void)setupCollectionView {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    CGFloat width = (BDScreenWidth - 3) / 4;
    layout.minimumInteritemSpacing = 1;
    layout.minimumLineSpacing = 1;
    layout.itemSize = CGSizeMake(width, width);
    CGRect frame = CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width, 500);
    self.collectionView = [[UICollectionView alloc] initWithFrame:frame collectionViewLayout:layout];
    [self.collectionView registerNib:[UINib nibWithNibName:@"BDMeCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"BDMeCell"];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.scrollEnabled = NO;
    self.collectionView.backgroundColor = [UIColor clearColor];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
}


- (void)setting {
    BDSettingViewController *settingVC = [[BDSettingViewController alloc] init];
    [self.navigationController pushViewController:settingVC animated:YES];
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    BDMeCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"BDMeCell" forIndexPath:indexPath];
    cell.item = self.items[indexPath.row];
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.items.count;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}


@end
