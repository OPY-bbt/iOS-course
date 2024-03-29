//
//  ViewController.m
//  Day2
//
//  Created by 张岩 on 2019/9/24.
//  Copyright © 2019 zyGroup. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>

@end

@implementation ViewController

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    // 去系统复用回收池里取相同identifier的cell,取不到再新建
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"id"];
    if(!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"id"];
    }
    
    cell.textLabel.text = [NSString stringWithFormat: @"TITLE - %@", @(indexPath.row)];
    cell.detailTextLabel.text = @"SUBTITLE";
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%@", @(indexPath.row));
    UIViewController *viewController = [[UIViewController alloc] init];
    viewController.title = [NSString stringWithFormat: @"%@", @(indexPath.row)];
    [self.navigationController pushViewController:viewController animated:YES];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    tableView.dataSource = self;
    tableView.delegate = self;
    [self.view addSubview:tableView];
}

@end
