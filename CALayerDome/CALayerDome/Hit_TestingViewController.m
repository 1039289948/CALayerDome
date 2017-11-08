//
//  Hit_TestingViewController.m
//  CALayerDome
//
//  Created by Mobiyun on 2017/9/14.
//  Copyright © 2017年 Mobiyun. All rights reserved.
//

#import "Hit_TestingViewController.h"

@interface Hit_TestingViewController ()

@property (nonatomic, strong) CALayer *blueLayer;
@property (nonatomic, strong) UIView *layerView;



@end

@implementation Hit_TestingViewController

- (void)viewDidLoad {

    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    self.layerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    self.layerView.center = self.view.center;
    self.layerView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.layerView];
    
    
    self.blueLayer = [CALayer layer];
    self.blueLayer.frame = CGRectMake(50.0f, 50.0f, 100.0f, 100.0f);
    self.blueLayer.backgroundColor = [UIColor blueColor].CGColor;
    [self.layerView.layer addSublayer:self.blueLayer];
    
}

#pragma mark 普通做法

//- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
//
//    CGPoint point = [[touches anyObject] locationInView:self.view];
//    point = [self.layerView.layer convertPoint:point fromLayer:self.view.layer];
//    
//    
//    if ([self.layerView.layer containsPoint:point]) {
//        point = [self.blueLayer convertPoint:point fromLayer:self.layerView.layer];
//        if ([self.blueLayer containsPoint:point]) {
//            [[[UIAlertView alloc] initWithTitle:@"Inside Blue Layer"
//                                        message:nil
//                                       delegate:nil
//                              cancelButtonTitle:@"OK"
//                              otherButtonTitles:nil] show];
//        } else {
//            [[[UIAlertView alloc] initWithTitle:@"Inside White Layer"
//                                        message:nil
//                                       delegate:nil
//                              cancelButtonTitle:@"OK"
//                              otherButtonTitles:nil] show];
//        }
//    }
//}


#pragma mark 用hit做，判断点击某个图层

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    CGPoint point = [[touches anyObject] locationInView:self.view];
    CALayer *layer = [self.layerView.layer hitTest:point];
    if (layer == self.blueLayer) {
        [[[UIAlertView alloc] initWithTitle:@"Inside Blue Layer"
                                    message:nil
                                   delegate:nil
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil] show];
    } else if (layer == self.layerView.layer) {
        [[[UIAlertView alloc] initWithTitle:@"Inside White Layer"
                                    message:nil
                                   delegate:nil
                          cancelButtonTitle:@"OK"
                          otherButtonTitles:nil] show];
    }
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





@end
