//
//  BDSignInViewContronller.m
//  Budejie
//
//  Created by zq m on 2020/4/21.
//  Copyright © 2020 zq m. All rights reserved.
//

#import "BDSignInViewContronller.h"
#import "BDLoginView.h"
@interface BDSignInViewContronller ()
@property (weak, nonatomic) IBOutlet UIView *signInView;
@property (strong, nonatomic) UIView *registerView;
@property (strong, nonatomic) UIView *logInView;

@end

@implementation BDSignInViewContronller
- (IBAction)clickClose:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)clickRegister:(id)sender {
    UIButton *btn = sender;
    btn.selected = !btn.selected;
    if (btn.selected) {
        [UIView animateWithDuration:0.3 animations:^{
             self.signInView.transform = CGAffineTransformMakeTranslation(-self.signInView.width / 2, 0);
         }];
    } else {
        [UIView animateWithDuration:0.3 animations:^{
             self.signInView.transform = CGAffineTransformMakeTranslation(0, 0);
         }];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.logInView = [BDLoginView logInView];
    self.registerView = [BDLoginView registerView];
    [self.signInView addSubview:self.registerView];
    [self.signInView addSubview:self.logInView];
}

-(void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.logInView.frame = CGRectMake(0, 0, self.signInView.width / 2, self.signInView.height);
    self.registerView.frame = CGRectMake(self.signInView.width / 2, 0, self.signInView.width / 2, self.signInView.height);
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
