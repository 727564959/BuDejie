//
//  BDWebViewController.m
//  Budejie
//
//  Created by zq m on 2020/4/24.
//  Copyright © 2020 zq m. All rights reserved.
//

#import "BDWebViewController.h"
#import <WebKit/WebKit.h>

@interface BDWebViewController ()
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIProgressView *progressBar;
@property (nonatomic, strong) WKWebView *webView;
@property (nonatomic, strong) NSURLRequest *request;
@end

@implementation BDWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    WKWebViewConfiguration *configuration = [[WKWebViewConfiguration alloc] init];
    self.webView = [[WKWebView alloc] initWithFrame:self.contentView.bounds];
    [self.contentView addSubview:self.webView];
    [self.webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
    [self.webView addObserver:self forKeyPath:@"title" options:NSKeyValueObservingOptionNew context:nil];
    [self.webView loadRequest:self.request];
}
- (void)loadWebViewWithURL:(NSURL *)url {
    self.request = [NSURLRequest requestWithURL:url];
    
}

- (IBAction)backClick:(id)sender {
    [self.webView goBack];
}
- (IBAction)refreshClick:(id)sender {
    [self.webView reload];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    self.progressBar.hidden = NO;
    self.progressBar.progress = self.webView.estimatedProgress;
    if (self.progressBar.progress >= 1) {
        self.progressBar.hidden = YES;
    }
    self.navigationItem.title = self.webView.title;
}

-(void)dealloc {
    [self.webView removeObserver:self forKeyPath:@"estimatedProgress"];
}


@end
