//
//  MainListViewController.m
//  CALayerDome
//
//  Created by Mobiyun on 2017/9/14.
//  Copyright © 2017年 Mobiyun. All rights reserved.
//

#import "MainListViewController.h"
#import "Hit_TestingViewController.h"
#import "CircularBeadViewController.h"
#import "RunTimeViewController.h"
#import "RunLoopViewController.h"
#import "FrostedGlassViewController.h"
#import "ARCManagerViewController.h"
#import "UIWebViewViewController.h"
#import "KVOViewController.h"
#import "GCDViewController.h"

@interface MainListViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *m_tableView;

@property (strong, nonatomic) NSMutableArray *m_dataArray;

@end

@implementation MainListViewController

-(NSMutableArray *)m_dataArray{
    
    if (_m_dataArray == nil) {
        _m_dataArray = [[NSMutableArray alloc]initWithObjects:@"Hit Testing",@"圆角",@"Runtime",@"RunLoop",@"开发之模糊效果",@"ARC内存管理",@"UIWebView",@"KVO",@"GCD", nil];
    }
    
    return _m_dataArray;
}


- (void)viewDidLoad {
    [super viewDidLoad];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return [self.m_dataArray count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.textLabel.text = self.m_dataArray[indexPath.row];
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.row == 0) {
        Hit_TestingViewController *hit = [[Hit_TestingViewController alloc]init];
        [self.navigationController pushViewController:hit animated:true];
    }
    if (indexPath.row == 1) {
        CircularBeadViewController *next = [[CircularBeadViewController alloc]init];
        [self.navigationController pushViewController:next animated:true];
    }
    if (indexPath.row == 2) {
        RunTimeViewController *next = [[RunTimeViewController alloc]init];
        [self.navigationController pushViewController:next animated:true];
    }
    if (indexPath.row == 3) {
        RunLoopViewController *next = [[RunLoopViewController alloc]init];
        [self.navigationController pushViewController:next animated:true];
    }
    if (indexPath.row == 4) {
        FrostedGlassViewController *next = [[FrostedGlassViewController alloc]init];
        [self.navigationController pushViewController:next animated:true];
    }
    if (indexPath.row == 5) {
        ARCManagerViewController *next = [[ARCManagerViewController alloc]init];
        [self.navigationController pushViewController:next animated:true];
    }
    if (indexPath.row == 6) {
        UIWebViewViewController *next = [[UIWebViewViewController alloc]init];
        [self.navigationController pushViewController:next animated:true];
    }
    if (indexPath.row == 7) {
        KVOViewController *next = [[KVOViewController alloc]init];
        [self.navigationController pushViewController:next animated:true];
    }
    if (indexPath.row == 8) {
        GCDViewController *nextVc = [[GCDViewController alloc]init];
        [self.navigationController pushViewController:nextVc animated:true];
    }
    
}






@end
