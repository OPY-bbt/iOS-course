//
//  LoadListData.h
//  Day2
//
//  Created by 张岩 on 2019/10/2.
//  Copyright © 2019 zyGroup. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class ListItem;

typedef void (^ListLoaderFinishBlock)(BOOL success, NSArray<ListItem *> *dataArray);

@interface LoadListData : NSObject

- (void)loadListDataWithFinishBlock:(ListLoaderFinishBlock)finishBlock;

@end

NS_ASSUME_NONNULL_END
