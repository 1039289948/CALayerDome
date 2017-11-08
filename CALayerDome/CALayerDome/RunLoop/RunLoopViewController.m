//
//  RunLoopViewController.m
//  CALayerDome
//
//  Created by Mobiyun on 2017/9/19.
//  Copyright © 2017年 Mobiyun. All rights reserved.
//

#import "RunLoopViewController.h"

@interface RunLoopViewController (){

    
    NSRunLoop *_runLoop;
    NSMachPort *_machPort;
    __weak NSThread *_thread;
    BOOL _isStopRunLoop;
}

@end

@implementation RunLoopViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(createObserver) object:nil];
    [thread setName:@"com.donyau.thread"];
    [thread start];
    _thread = thread;

    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (void)createObserver{
    
    
    _runLoop = [NSRunLoop currentRunLoop];
    CFRunLoopObserverContext context = {0, (__bridge void *)(self), NULL, NULL, NULL};
    CFRunLoopObserverRef observer = CFRunLoopObserverCreate(kCFAllocatorDefault, kCFRunLoopAllActivities, YES, 0, &myRunLoopObserver, &context);

    if (observer) {
        CFRunLoopRef cfLoop = [_runLoop getCFRunLoop];
        CFRunLoopAddObserver(cfLoop, observer, kCFRunLoopDefaultMode);
    }
    
    [self runLoopStop];
}


void myRunLoopObserver(CFRunLoopObserverRef observer, CFRunLoopActivity activity, void *info){
    NSString *threadName = [NSThread currentThread].name;
    if (activity & kCFRunLoopEntry) {
        NSLog(@"<%@>进入runloop",threadName);
    }else if (activity & kCFRunLoopBeforeTimers){
        NSLog(@"<%@>即将处理Timers",threadName);
    }else if (activity & kCFRunLoopBeforeSources){
        NSLog(@"<%@>即将处理Sources",threadName);
    }else if (activity & kCFRunLoopBeforeWaiting){
        NSLog(@"<%@>即将处理进入睡眠",threadName);
    }else if (activity & kCFRunLoopAfterWaiting){
        NSLog(@"<%@>从睡眠中唤醒",threadName);
    }else if (activity & kCFRunLoopExit){
        NSLog(@"<%@>退出runloop",threadName);
    }
}


#pragma mark - CFRunLoopStop
- (void)runLoopStop{
    _machPort = (NSMachPort *)[NSMachPort port];
    [_runLoop addPort:_machPort forMode:NSRunLoopCommonModes];
    [self performSelector:@selector(logRunLoopStop:) withObject:@"1" afterDelay:4];
    [self performSelector:@selector(logRunLoopStop:) withObject:@"2" afterDelay:8];
    while (!_isStopRunLoop && [_runLoop runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]]) {
        
    }
}

- (void)logRunLoopStop:(NSString *)mesg{
    NSLog(@"%@--%@",[NSThread currentThread],mesg);
    _isStopRunLoop = YES;
    CFRunLoopStop(CFRunLoopGetCurrent());
}


@end
