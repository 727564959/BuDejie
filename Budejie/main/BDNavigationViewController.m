//
//  BDNavigationViewController.m
//  Budejie
//
//  Created by zq m on 2020/3/20.
//  Copyright © 2020 zq m. All rights reserved.
//

#import "BDNavigationViewController.h"

@interface BDNavigationViewController () <UIGestureRecognizerDelegate>

@end

@implementation BDNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self.interactivePopGestureRecognizer.delegate action:@selector(handleNavigationTransition:)];
    [self.view addGestureRecognizer:panGesture];
    panGesture.delegate = self;
//    self.interactivePopGestureRecognizer.delegate = self;
    [self setupNavigationBar];
}
- (void)setupNavigationBar {
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:20];
    [self.navigationBar setTitleTextAttributes:attrs];
}
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(nonnull UITouch *)touch
{
    if (self.childViewControllers.count > 1) {
        return YES;
    }
    return NO;
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.childViewControllers.count > 0) {
        UIButton *backBtn = [[UIButton alloc] init];
        [backBtn setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:UIControlStateNormal];
        [backBtn setImage:[UIImage imageNamed:@"navigationButtonReturnClick"] forState:UIControlStateHighlighted];
        [backBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [backBtn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        [backBtn setTitle:@"返回" forState:UIControlStateNormal];
        [backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
        viewController.navigationItem.leftBarButtonItem.imageInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    }
    [super pushViewController:viewController animated:animated];
}
-(void)back {
    [self popViewControllerAnimated:YES];
}



@end
