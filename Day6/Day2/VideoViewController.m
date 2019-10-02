//
//  VideoViewController.m
//  Day2
//
//  Created by 张岩 on 2019/9/25.
//  Copyright © 2019 zyGroup. All rights reserved.
//

#import "VideoViewController.h"

@interface VideoViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>

@end

@implementation VideoViewController
- (instancetype) init {
    self = [super init];
    if (self) {
        self.tabBarItem.title = @"视频";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.minimumLineSpacing = 10;
    flowLayout.minimumLineSpacing = 10;
    flowLayout.itemSize = CGSizeMake((self.view.frame.size.width - 10)/2, 300);
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    
    collectionView.backgroundColor = [UIColor whiteColor];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
        
    [self.view addSubview: collectionView];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 20;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UICollectionViewCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.item % 3 == 0) {
        return CGSizeMake((self.view.frame.size.width - 10)/2, 150);
    } else {
        return CGSizeMake((self.view.frame.size.width - 10)/2, 300);
    }
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
