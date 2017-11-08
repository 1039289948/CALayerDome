//
//  CircularBeadViewController.m
//  CALayerDome
//
//  Created by Mobiyun on 2017/9/14.
//  Copyright © 2017年 Mobiyun. All rights reserved.
//

#import "CircularBeadViewController.h"

@interface CircularBeadViewController ()
@property (strong, nonatomic) IBOutlet UIView *layerView_01;
@property (strong, nonatomic) IBOutlet UIView *layerView_02;

@end

@implementation CircularBeadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    
    self.layerView_01.layer.cornerRadius = 20;
    self.layerView_02.layer.cornerRadius = 20;
    
    
    CALayer *layer_01 = [CALayer layer];
    layer_01.backgroundColor = [UIColor redColor].CGColor;
    layer_01.frame = CGRectMake(-20, -20, 100, 100);
    [self.layerView_01.layer addSublayer:layer_01];
    
    
    CALayer *layer_02 = [CALayer layer];
    layer_02.backgroundColor = [UIColor redColor].CGColor;
    layer_02.frame = CGRectMake(-20, -20, 100, 100);
    [self.layerView_02.layer addSublayer:layer_02];
    
    self.layerView_02.layer.masksToBounds = true;
    
    self.layerView_02.layer.shadowOpacity = 0.5;
    self.layerView_02.layer.shadowOffset = CGSizeMake(0, 10);

    
//    CGAffineTransform transform = CGAffineTransformMakeRotation(M_PI_4);
//    self.layerView_02.layer.affineTransform = transform;
    
    
    
//    CGAffineTransform transform = CGAffineTransformIdentity;
//    
//    transform = CGAffineTransformScale(transform, 0.5, 0.5);
//    transform = CGAffineTransformRotate(transform, M_PI/180 * 30);
//    transform = CGAffineTransformTranslate(transform, 200, 200);
    
    [UIView animateWithDuration:2 animations:^{
        
        CATransform3D transform = CATransform3DIdentity;
        
        transform.m34 = -1.0/500.0;
        
        transform =  CATransform3DRotate(transform, M_PI_4 * 3, 1, 1, 0.5);
        
        self.layerView_02.layer.transform = transform;

        
    }];
    
    
   
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}




@end
