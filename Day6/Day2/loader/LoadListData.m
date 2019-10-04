//
//  LoadListData.m
//  Day2
//
//  Created by 张岩 on 2019/10/2.
//  Copyright © 2019 zyGroup. All rights reserved.
//

#import "LoadListData.h"
#import "AFNetworking.h"

@implementation LoadListData

- (void)loadListData {
//    NSString *urlString = @"http://v.juhe.cn/toutiao/index?type=top&key=4884a92ba9222dfd1fde025315d18294";
//    NSURL *listUrl = [NSURL URLWithString:urlString];
//
//    NSURLSession *session = [NSURLSession sharedSession];
//    NSURLSessionDataTask *task = [session dataTaskWithURL:listUrl completionHandler:^(NSData *_Nullable data, NSURLResponse *_Nullable response, NSError *_Nullable error) {
//        NSLog(@"123");
//    }];
//    [task resume];
    [[AFHTTPSessionManager manager] GET:@"http://v.juhe.cn/toutiao/index?type=top&key=4884a92ba9222dfd1fde025315d18294" parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
       
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
         NSLog(@"");
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

@end
