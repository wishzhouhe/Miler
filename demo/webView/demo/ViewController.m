//
//  ViewController.m
//  demo
//
//  Created by myzj2004 on 16/6/2.
//  Copyright © 2016年 myzj2004. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *city = @"https://www.baidu.com?q=北京";
    city = [city stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    NSURL *url = [NSURL URLWithString:city];
    
    NSURL *nocity = [NSURL URLWithString:city];
    
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:nocity];
    
    
    
    [self.webView loadRequest:urlRequest];
    
    
}

#pragma mark - UIWebViewDelegate 
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(nullable NSError *)error {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
