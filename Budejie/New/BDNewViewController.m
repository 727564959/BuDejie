//
//  BDNewViewController.m
//  Budejie
//
//  Created by zq m on 2020/3/17.
//  Copyright © 2020 zq m. All rights reserved.
//

#import "BDNewViewController.h"

@interface BDNewViewController ()

@end

@implementation BDNewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupNavBar];
}

-(void)setupNavBar {
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImageName:@"MainTagSubIcon" itemWithHighlightedImageName:@"MainTagSubIconClick" addTarget:nil action:nil];
}

@end
