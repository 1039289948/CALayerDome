//
//  KVOViewController.m
//  CALayerDome
//
//  Created by Mobiyun on 2017/10/9.
//  Copyright © 2017年 Mobiyun. All rights reserved.
//

#import "KVOViewController.h"
#import "NSObject+KVO.h"

@interface KVOViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *m_tableView;

@end

@implementation KVOViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.m_tableView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
    
//    [self.m_tableView PG_addObserver:self forKey:@"tableVoew" withBlock:^(id observedObject, NSString *observedKey, id oldValue, id newValue) {
//
//        NSLog(@"%@",observedObject);
//        NSLog(@"%@",observedKey);
//        NSLog(@"%@", oldValue);
//        NSLog(@"%@",new)
//
//    }];
    
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
 
    NSLog(@"%@",keyPath);
    NSLog(@"%@",change);
    CGFloat offset = self.m_tableView.contentOffset.y;
    CGFloat delta = offset / 64.f + 1.f;
    delta = MAX(0, delta);
    NSLog(@"%f",delta);
    NSLog(@"%f",offset);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 100;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 44;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    return cell;
}



@end
