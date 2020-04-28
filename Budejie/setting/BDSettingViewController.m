//
//  BDSettingViewController.m
//  Budejie
//
//  Created by zq m on 2020/3/20.
//  Copyright © 2020 zq m. All rights reserved.
//
#import "BDCacheUtils.h"
#import "BDSettingViewController.h"
#import  <SDWebImage.h>
@interface BDSettingViewController ()

@end

@implementation BDSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"设置";
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    __block NSInteger size;
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        size = [BDCacheUtils CacheSize];
        NSString *sizeStr = [self getSize:size];
        dispatch_sync(dispatch_get_main_queue(), ^{
            cell.textLabel.text = [NSString stringWithFormat:@"清除缓存 %@", sizeStr];
        });
    });
    cell.textLabel.text = [NSString stringWithFormat:@"清除缓存 计算中..."];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [BDCacheUtils cleanCache];
    [tableView reloadData];
}
- (NSString *)getSize:(CGFloat)size{
    if (size < 1024 && size > 0) {
        return [NSString stringWithFormat:@"%fB",size];
    }
    else if (size >= 1024 && size <1024 * 1024)
    {
        return [NSString stringWithFormat:@"%.1fKB",size / 1024];
    }
    else if (size >= 1024 * 1024 && size < 1024 * 1024 * 1024)
    {
        return [NSString stringWithFormat:@"%.1fMB",size / 1024 / 1024];
    }
    else if (size >= 1024 * 1024 * 1024)
    {
        return [NSString stringWithFormat:@"%.1fGB",size / 1024 / 1024 / 1024];
    }
    return @"";
}
@end
