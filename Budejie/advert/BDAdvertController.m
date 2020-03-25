//
//  BDAdvertController.m
//  Budejie
//
//  Created by zq m on 2020/3/25.
//  Copyright © 2020 zq m. All rights reserved.
//

#import "BDAdvertController.h"

@interface BDAdvertController ()
@property (weak, nonatomic) IBOutlet UIImageView *lanchImageView;
@property (weak, nonatomic) IBOutlet UIView *adContainView;

@end

@implementation BDAdvertController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViews];
}
- (void)setupViews {
    self.lanchImageView.image = [UIImage imageNamed:@"LaunchImage-800-Portrait-736h@3x"];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)skipBtn:(id)sender {
}

@end
