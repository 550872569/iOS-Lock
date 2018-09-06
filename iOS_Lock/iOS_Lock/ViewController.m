//
//  ViewController.m
//  iOS_Lock
//
//  Created by Yan on 2018/9/2.
//  Copyright © 2018年 YY. All rights reserved.
//

#import "ViewController.h"
//#import "NSLog.h"

@interface ViewController ()

@property (nonatomic, strong) NSLock *lock;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.lock = [[NSLock alloc] init];
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"self------1加锁%@",self);
        [self.lock lock];
        sleep(10);
        [self.lock  unlock];
        NSLog(@"self------1解锁----%@",self);
    });
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"self------2加锁%@",self);
        [self.lock  lock];
        sleep(2);
        [self.lock  unlock];
        NSLog(@"self------2解锁----%@",self);
    });
}

@end
