//
//  ViewController.m
//  Day1
//
//  Created by 张岩 on 2019/9/24.
//  Copyright © 2019 zyGroup. All rights reserved.
//

#import "ViewController.h"

@interface TestView : UIView

@end

@implementation TestView
-(instancetype) init {
    self = [super init];
    if (self) {
        
    }
    return self;
}
- (void)willMoveToSuperview:(nullable UIView *)newSuperview{
    [super willMoveToSuperview: newSuperview];
}
- (void)didMoveToSuperview{
    [super didMoveToSuperview];
}
- (void)willMoveToWindow:(nullable UIWindow *)newWindow{
    [super willMoveToSuperview:newWindow];
}
- (void)didMoveToWindow{
    [super didMoveToWindow];
}
@end

@interface ViewController ()

@end

@implementation ViewController

-(instancetype)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}
- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // lesson1
//    UILabel *label = [[UILabel alloc] init];
//    label.text = @"hello world";
//    [label sizeToFit];
//    label.center =self.view.center;
//    [self.view addSubview:label];
    
    // lesson1
//    [self.view addSubview:({
//        UILabel *label = [[UILabel alloc] init];
//        label.text = @"hello world";
//        [label sizeToFit];
//        label.center =self.view.center;
//        label;
//    })];
    
    // lesson2
//    [self.view addSubview:({
//        UIView *view = [[UIView alloc] init];
//        view.backgroundColor = [UIColor redColor];
//        view.frame = CGRectMake(100, 100, 100, 100);
//        view;
//    })];
    
    // lesson3
//    [self.view addSubview:({
//        TestView *view = [[TestView alloc] init];
//        view.backgroundColor = [UIColor grayColor];
//        view.frame = CGRectMake(100, 100, 100, 100);
//        view;
//    })];
}


@end
