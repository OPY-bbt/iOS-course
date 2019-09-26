//
//  ScrollViewController.m
//  Day2
//
//  Created by 张岩 on 2019/9/26.
//  Copyright © 2019 zyGroup. All rights reserved.
//

#import "ScrollViewController.h"

@interface ScrollViewController ()

@end

@implementation ScrollViewController

-(instancetype) init {
    self = [super init];
    if (self) {
        self.view.backgroundColor = [UIColor blueColor];
        self.tabBarItem.title = @"tuijian";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    UIScrollView *scrollview = [[UIScrollView alloc] initWithFrame:self.view.bounds];

    scrollview.contentSize = CGSizeMake(self.view.bounds.size.width * 5, self.view.bounds.size.height);
    NSArray *colors = @[[UIColor grayColor], [UIColor greenColor], [UIColor yellowColor], [UIColor blackColor], [UIColor redColor]];
    for (int i =0;i<5;i++) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(i * self.view.bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
        view.backgroundColor = [colors objectAtIndex:i];
        [scrollview addSubview:view];
    }
    scrollview.pagingEnabled = YES;
    [self.view addSubview:scrollview];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
