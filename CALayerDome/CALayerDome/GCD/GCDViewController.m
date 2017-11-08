//
//  GCDViewController.m
//  CALayerDome
//
//  Created by Mobiyun on 2017/11/8.
//  Copyright © 2017年 Mobiyun. All rights reserved.
//

#import "GCDViewController.h"

@interface GCDViewController ()

@end

@implementation GCDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self textTwoDom];
//    [self testThirDom];
//    [self testFourDom];
//    [self testFiveDom];
//    [self gcdQueueGroup];
//    [self gcdApply];

//    [self applyLockThread];
    [self queueBarrier];
}

- (void)textOneDom{

    /**
     这里可以使用dispatch_queue_create来创建对象, 这里需要传入两个参数.
     第一个参数: 队列的唯一标识符
     第二个参数: 队列的类型, DISPATCH_QUEUE_SERIAL表示串行队列, DISPATCH_QUEUE_CONCURRENT表示并行队列.
     */
    
    //串行队列的创建方法
    dispatch_queue_t queue_01 = dispatch_queue_create("text", DISPATCH_QUEUE_SERIAL);
    //并行队列的创建方法
    dispatch_queue_t queue_02 = dispatch_queue_create("text", DISPATCH_QUEUE_CONCURRENT);
    
    /**
     关于并行队列, 我们还可以用dispatch_get_global_queue来获取全局并行队列, 也需要传入两个参数.
     第一个参数: 队列的优先级, 一般都是用DISPATCH_QUEUE_PRIORITY_DEFAULT.
     第二个参数: 暂时没用, 可以用0去代替.
     */
    
    /*****注意: 并行队列只有在异步执行(dispatch_async)才有效******/
    
    // 同步执行任务创建方法
    dispatch_sync(queue_01, ^{
        
    });
    
    // 异步执行任务创建方法
    dispatch_async(queue_02, ^{
        
    });

}


/**
 并行队列+同步执行
 */
- (void)textTwoDom{

    NSLog(@"开始执行任务");
    dispatch_queue_t queue = dispatch_queue_create("test", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_sync(queue, ^{
        NSLog(@"第一个任务当前线程为: %@", [NSThread currentThread]);
    });
    dispatch_sync(queue, ^{
        NSLog(@"第二个任务当前线程为: %@", [NSThread currentThread]);
    });
    dispatch_sync(queue, ^{
        NSLog(@"第三个任务当前线程为: %@", [NSThread currentThread]);
    });
    NSLog(@"结束执行任务");
    
}

/**
 并行队列+异步执行
 */
- (void)testThirDom{

    NSLog(@"开始执行任务");
    dispatch_queue_t queue = dispatch_queue_create("thir", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(queue, ^{
        NSLog(@"第一个任务当前线程为: %@", [NSThread currentThread]);
    });
    
    dispatch_async(queue, ^{
        NSLog(@"第二个任务当前线程为: %@", [NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"第三个任务当前线程为: %@", [NSThread currentThread]);
    });
    NSLog(@"结束执行任务");
}

/**
 串行队列+同步执行
 */
- (void)testFourDom{

    NSLog(@"开始执行任务");
    dispatch_queue_t queue = dispatch_queue_create("four", DISPATCH_QUEUE_SERIAL);
    dispatch_sync(queue, ^{
        NSLog(@"第一个任务当前线程为: %@", [NSThread currentThread]);
    });
    dispatch_sync(queue, ^{
        NSLog(@"第二个任务当前线程为: %@", [NSThread currentThread]);
    });
    dispatch_sync(queue, ^{
        NSLog(@"第三个任务当前线程为: %@", [NSThread currentThread]);
    });
    NSLog(@"结束执行任务");
}

/**
 串行队列 + 异步执行
 */
- (void)testFiveDom{

    NSLog(@"开始执行任务");
    dispatch_queue_t queue = dispatch_queue_create("five", DISPATCH_QUEUE_SERIAL);
    dispatch_async(queue, ^{
        NSLog(@"第一个任务当前线程为: %@", [NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"第二个任务当前线程为: %@", [NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"第三个任务当前线程为: %@", [NSThread currentThread]);
    });
    NSLog(@"结束执行任务");
}

/**
 GCD的Queue Group
 */
- (void)gcdQueueGroup {
    
    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_group_async(group,
                         queue,
                         ^{
                             // 执行第一个耗时的任务
                         });
    
    dispatch_group_async(group,
                         queue,
                         ^{
                             // 执行第二个耗时的任务
                         });
    
    dispatch_group_notify(group,
                          dispatch_get_main_queue(),
                          ^{
                              // 回到主线程
                          });
}

/**
 GCD的快速遍历方法
 */
- (void)gcdApply {
    
    /**
     无论是串行还是并行队列都一样, 它将会阻塞主线程
     */
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_apply(5, queue, ^(size_t index) {
        NSLog(@"执行第%ld任务, 当前线程为: %@", index, [NSThread currentThread]);
    });
}


/**
 使用dispatch_apply造成的死锁
 */
- (void)applyLockThread {
    
    /**
     当创建一个串行队列时 DISPATCH_QUEUE_SERIAL 会出现锁死状态
     当创建一个并行队列时 DISPATCH_QUEUE_CONCURRENT 不会造成死锁
     
     无论是串行还是并行队列都一样, 它将会阻塞主线程

     */
    
    dispatch_queue_t queue = dispatch_queue_create("applyQueue", DISPATCH_QUEUE_SERIAL);
    dispatch_apply(3, queue, ^(size_t i) {
        NSLog(@"延迟添加一");
        dispatch_apply(3, queue, ^(size_t j) {
            NSLog(@"延迟添加二");
        });
    });
}

/**
 
 dispatch_group_notify
 当前的队列组任务执行完毕之后, 就会调用dispatch_group_notify来通知, 任务已经结束.
 
 dispatch_group_wait
 和dispatch_group_notify类似, 只不过是在可以添加延迟结束的时间, 但这里需要注意一点, dispatch_group_wait会阻塞当前线程, 所以不要在主线程中调用, 不然会阻塞主线程.
 */


/**
 dispatch_barrier_(a)sync其实是一个栅栏方法, 它的作用就是在向某个队列插入一个block, 等到该block执行完之后, 才会继续执行其他队列, 有点老大的味道.
 dispatch_barrier_(a)sync只在自己创建的并发队列的才会有效, 如果是在全局并发队列, 串行队列, dispatch_(a)sync效果是一样的, 这样子的话, 就会容易造成线程死锁, 所以这里要注意.
 */
- (void)queueBarrier {
    
    dispatch_queue_t queue = dispatch_queue_create("queueBarrier", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{
        NSLog(@"执行一, 当前线程:%@", [NSThread currentThread]);
    });
    dispatch_barrier_async(queue, ^{
        NSLog(@"大佬来了, 当前线程:%@", [NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"执行二, 当前线程:%@", [NSThread currentThread]);
    });
}















































- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}



@end
