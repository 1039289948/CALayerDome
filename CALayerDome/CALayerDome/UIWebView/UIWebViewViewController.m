//
//  UIWebViewViewController.m
//  CALayerDome
//
//  Created by Mobiyun on 2017/9/29.
//  Copyright © 2017年 Mobiyun. All rights reserved.
//

#import "UIWebViewViewController.h"

@interface UIWebViewViewController ()<UIWebViewDelegate>
@property (strong, nonatomic) IBOutlet UIWebView *m_webView;

@end

@implementation UIWebViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.m_webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    self.m_webView.delegate = self;
    self.m_webView.backgroundColor = [UIColor lightGrayColor];

    NSURL *url = [NSURL URLWithString:@"https://www.baidu.com"];
    NSURLRequest *req = [[NSURLRequest alloc]initWithURL:url];
    [self.m_webView loadRequest:req];
    
    [self.view addSubview:self.m_webView];
    
}

-(void)webViewDidStartLoad:(UIWebView *)webView{
    NSLog(@"start");
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    NSLog(@"finsh");
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    
    NSLog(@"error%@",error);
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
