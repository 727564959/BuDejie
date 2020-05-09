//
//  BDPictureViewController.m
//  Budejie
//
//  Created by zq m on 2020/5/8.
//  Copyright © 2020 zq m. All rights reserved.
//

#import "BDPictureViewController.h"

@interface BDPictureViewController ()

@end

@implementation BDPictureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    self.tableView.backgroundColor = [UIColor blueColor];
    self.tableView.contentInset = UIEdgeInsetsMake(kNavBarAndStatusBarHeight + kTitleBarHeight, 0, kTabBarHeight, 0);

}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 30;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    NSString *str = [NSString stringWithFormat:@"%ld -- %@",(long)indexPath.row, [self class]];
    cell.textLabel.text = str;
    cell.backgroundColor = [UIColor blueColor];
    return cell;
}

@end
