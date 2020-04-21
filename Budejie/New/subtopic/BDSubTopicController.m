//
//  BDSubTableController.m
//  Budejie
//
//  Created by zq m on 2020/3/31.
//  Copyright © 2020 zq m. All rights reserved.
//

#import "BDSubTopicController.h"
#import "BDHTTPSessionManager.h"
#import "BDSubTopicMode.h"
#import "BDTopicCell.h"
#import <MJExtension.h>
#import <SVProgressHUD/SVProgressHUD.h>
@interface BDSubTopicController ()
@property (nonatomic, strong) NSArray<BDSubTopicMode *> *items;
@end

@implementation BDSubTopicController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
    [self.tableView registerNib:[UINib nibWithNibName:@"BDTopicCell" bundle:nil] forCellReuseIdentifier:@"BDTopicCell"];
    self.title = @"推荐标签";
    self.tableView.separatorInset = UIEdgeInsetsZero;
}

- (void)loadData{
    BDHTTPSessionManager *manager = [BDHTTPSessionManager manager];
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"a"] = @"tag_recommend";
    parameters[@"action"] = @"sub";
    parameters[@"c"] = @"topic";
    [SVProgressHUD showWithStatus:@"loading..."];
    [manager GET:@"http://api.budejie.com/api/api_open.php" parameters:parameters progress:nil
      success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary *  _Nullable responseObject) {
        [SVProgressHUD dismiss];
        [responseObject writeToFile:@"/Users/zqm/Desktop/Budejie/a.plist" atomically:YES];
        NSLog(@"%@",responseObject);
        self.items = [BDSubTopicMode mj_objectArrayWithKeyValuesArray:responseObject].copy;
        [self.tableView reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD dismiss];
        NSLog(@"%@",error);
    }];

}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BDTopicCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BDTopicCell" forIndexPath:indexPath];
    cell.item = self.items[indexPath.row];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
