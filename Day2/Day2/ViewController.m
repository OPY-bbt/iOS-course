//
//  ViewController.m
//  Day2
//
//  Created by 张岩 on 2019/9/24.
//  Copyright © 2019 zyGroup. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:({
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = [UIColor blackColor];
        view.frame = CGRectMake(100, 100, 100, 100);
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pushController)];
        [view addGestureRecognizer:tapGesture];
        view;
    })];
}

-(void) pushController{
    UIViewController *viewController = [[UIViewController alloc] init];
    viewController.view.backgroundColor = [UIColor whiteColor];
    viewController.navigationItem.title = @"content";
    
    viewController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"rightBtn" style:UIBarButtonItemStylePlain target:self action:nil];
    
    [self.navigationController pushViewController:viewController animated:true];
}


@end
