//
//  ViewController.m
//  Day2
//
//  Created by 张岩 on 2019/9/24.
//  Copyright © 2019 zyGroup. All rights reserved.
//

#import "ViewController.h"
#import "HomeTableViewCell.h"
#import "DataDetailViewController.h"
#import "HomeTableDeleteCellView.h"
#import "LoadListData.h"
#import "ListItem.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate, HomeTableViewCellDelegate>
@property (nonatomic, strong, readwrite) UITableView *tableView;
@property (nonatomic, strong, readwrite) NSArray *dataArray;
@property (nonatomic, strong, readwrite) LoadListData *listDataloader;
@end

@implementation ViewController

- (instancetype)init {
    self = [super init];
    if (self) {
//        self.dataArray = @[].mutableCopy;
//        for (int i = 0;i<20;i++) {
//            [self.dataArray addObject:@(i)];
//        }
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 去系统复用回收池里取相同identifier的cell,取不到再新建
    HomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"id"];
    if (!cell) {
        cell = [[HomeTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"id"];
        cell.delegate = self;
    }

    [cell layoutTableViewCellWithItem:[self.dataArray objectAtIndex:indexPath.row]];

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ListItem *item = [self.dataArray objectAtIndex:indexPath.row];
    DataDetailViewController *viewController = [[DataDetailViewController alloc] initWithUrlString:item.url];
    viewController.title = item.title;// [NSString stringWithFormat: @"%@", url];
    [self.navigationController pushViewController:viewController animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];

    self.listDataloader = [[LoadListData alloc] init];
    __weak typeof(self) wself = self;
    [self.listDataloader loadListDataWithFinishBlock:^(BOOL success, NSArray<ListItem *> *_Nonnull dataArray) {
        __strong typeof(self) strongSelf = wself;
        strongSelf.dataArray = dataArray;
        [strongSelf.tableView reloadData];
    }];
}

- (void)tabViewCell:(UITableViewCell *)tabViewCell clickDeleteButton:(UIButton *)deleteButton {
//    HomeTableDeleteCellView *deleteView = [[HomeTableDeleteCellView alloc] initWithFrame:self.view.bounds];
//    __weak typeof(self) wself = self;
//    [deleteView showViewFromPoint:[tabViewCell convertRect:deleteButton.frame toView:nil].origin clickBlock:^{
//        __strong typeof(self)strongSelf = wself;
//        [strongSelf.dataArray removeLastObject];
//        [strongSelf.tableView deleteRowsAtIndexPaths:@[[strongSelf.tableView indexPathForCell:tabViewCell]] withRowAnimation:UITableViewRowAnimationAutomatic];
//    }];
}

@end
