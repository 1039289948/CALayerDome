//
//  RunTimeViewController.m
//  CALayerDome
//
//  Created by Mobiyun on 2017/9/15.
//  Copyright © 2017年 Mobiyun. All rights reserved.
//

#import "RunTimeViewController.h"
#import "NSObject+object.h"
#import "NSMutableArray+Swizzling.h"

@interface RunTimeViewController ()

@end

@implementation RunTimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    /*Runtime 动态交换方法*/
    UIImage *image = [UIImage imageNamed:@"123456.jpeg"];
    
    NSObject *objc = [[NSObject alloc] init];
    objc.name = @"123";
    NSLog(@"runtime动态添加属性name==%@",objc.name);
    NSMutableArray *array = [NSMutableArray arrayWithObjects:@"1",@"1234", nil];
    [array addObject:nil];
    NSString *obj_01 = array[3];
    [array objectAtIndex:3];
    
    

    
    
//    [array setObject:nil atIndexedSubscript:9];
    

    [array objectAtIndexedSubscript:3];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
