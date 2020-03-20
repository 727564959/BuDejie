//
//  BDFriendViewController.m
//  Budejie
//
//  Created by zq m on 2020/3/17.
//  Copyright © 2020 zq m. All rights reserved.
//

#import "BDFriendViewController.h"

@interface BDFriendViewController ()

@end

@implementation BDFriendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupNavBar];
}

-(void)setupNavBar {
    self.navigationItem.title = @"我的关注";
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImageName:@"friendsRecommentIcon" itemWithHighlightedImageName:@"friendsRecommentIcon-click" addTarget:nil action:nil];
}

@end
