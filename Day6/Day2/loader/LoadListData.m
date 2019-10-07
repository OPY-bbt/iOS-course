//
//  LoadListData.m
//  Day2
//
//  Created by 张岩 on 2019/10/2.
//  Copyright © 2019 zyGroup. All rights reserved.
//

#import "LoadListData.h"
#import "AFNetworking.h"
#import "ListItem.h"

@implementation LoadListData

- (void)loadListDataWithFinishBlock:(ListLoaderFinishBlock)finishBlock {
    NSString *urlString = @"http://v.juhe.cn/toutiao/index?type=top&key=4884a92ba9222dfd1fde025315d18294";
    NSURL *listUrl = [NSURL URLWithString:urlString];

    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithURL:listUrl completionHandler:^(NSData *_Nullable data, NSURLResponse *_Nullable response, NSError *_Nullable error) {
//        NSLog(@"123");
        NSError *jsonError;
        id jsonObj = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        NSArray *dataArray = jsonObj[@"result"][@"data"];

        NSMutableArray *array = @[].mutableCopy;
        for (NSDictionary *data in dataArray) {
            ListItem *l = [[ListItem alloc] init];
            [l configWithJson:data];
            [array addObject:l];
        }

        //保证回调在主线程中执行
        dispatch_async(dispatch_get_main_queue(), ^{
                           if (finishBlock) {
                               finishBlock(error == nil, array.copy);
                           }
                       });
    }];
    [task resume];
//    [[AFHTTPSessionManager manager] GET:@"http://v.juhe.cn/toutiao/index?type=top&key=4884a92ba9222dfd1fde025315d18294" parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
//
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//         NSLog(@"");
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//
//    }];
}

@end
