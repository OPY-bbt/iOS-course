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
    
    NSArray<ListItem *> *localData = [self _readDataFromLocal];
    if (localData) {
        finishBlock(YES, localData);
    }

    __weak typeof(self) weakSelf = self;
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithURL:listUrl completionHandler:^(NSData *_Nullable data, NSURLResponse *_Nullable response, NSError *_Nullable error) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        NSError *jsonError;
        id jsonObj = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        NSArray *dataArray = jsonObj[@"result"][@"data"];

        NSMutableArray *array = @[].mutableCopy;
        for (NSDictionary *data in dataArray) {
            ListItem *l = [[ListItem alloc] init];
            [l configWithJson:data];
            [array addObject:l];
        }
        
        [strongSelf _archiveListDataWithArray: array.copy];

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

- (NSArray<ListItem *> *) _readDataFromLocal {
    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachePath = [pathArray firstObject];
    
    NSString *listPath = [cachePath stringByAppendingPathComponent:@"GTDATA/list"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSData *readListData = [fileManager contentsAtPath:listPath];
    
    id unarchiveObj = [NSKeyedUnarchiver unarchivedObjectOfClasses:[NSSet setWithObjects:[NSArray class], [ListItem class], nil] fromData:readListData error:nil];
    
    if ([unarchiveObj isKindOfClass:[NSArray class]] && [unarchiveObj count] > 0) {
        return (NSArray<ListItem *> *)unarchiveObj;
    }
    return nil;
}

-(void) _archiveListDataWithArray: (NSArray<ListItem *> *)array{
    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachePath = [pathArray firstObject];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSString *dataPath = [cachePath stringByAppendingPathComponent:@"GTDATA"];
    
    NSError *error;
    [fileManager createDirectoryAtPath:dataPath withIntermediateDirectories:YES attributes:nil error:&error];
    
    NSString *listPath = [dataPath stringByAppendingPathComponent:@"list"];
    
    NSData *listData = [NSKeyedArchiver archivedDataWithRootObject:array requiringSecureCoding:YES error:nil];
    [fileManager createFileAtPath:listPath contents:listData attributes:nil];
    
//    NSData *readListData = [fileManager contentsAtPath:listPath];
//    id unarchiveObj = [NSKeyedUnarchiver unarchivedObjectOfClasses:[NSSet setWithObjects:[NSArray class], [ListItem class], nil] fromData:readListData error:nil];
    
    NSLog(@"");
    // 查询文件
//    BOOL fileExist = [fileManager fileExistsAtPath:listPath];
    
    // 删除文件
//    if (fileExist) {
//        NSURL *url = [NSURL fileURLWithPath:listPath];
//        [fileManager removeItemAtURL: url error:nil];
//    }
//    NSFileHandle *fileHandler = [NSFileHandle fileHandleForUpdatingAtPath:listPath];
//    [fileHandler seekToEndOfFile];
//    [fileHandler writeData:[@"def" dataUsingEncoding:NSUTF8StringEncoding]];
//    [fileHandler synchronizeFile];
//    [fileHandler closeFile];
}

@end
