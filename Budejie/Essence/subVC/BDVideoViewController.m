//
//  BDVedioViewController.m
//  Budejie
//
//  Created by zq m on 2020/5/8.
//  Copyright © 2020 zq m. All rights reserved.
//

#import "BDVideoViewController.h"

@interface BDVideoViewController ()

@end

@implementation BDVideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];

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
    cell.backgroundColor = [UIColor greenColor];
    return cell;
}
@end
