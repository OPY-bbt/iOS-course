//
//  ListItem.h
//  Day2
//
//  Created by 张岩 on 2019/10/5.
//  Copyright © 2019 zyGroup. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ListItem : NSObject <NSSecureCoding>

@property (nonatomic, copy, readwrite) NSString *author_name;
@property (nonatomic, copy, readwrite) NSString *category;
@property (nonatomic, copy, readwrite) NSString *date;
@property (nonatomic, copy, readwrite) NSString *thumbnail_pic_s;
@property (nonatomic, copy, readwrite) NSString *thumbnail_pic_s02;
@property (nonatomic, copy, readwrite) NSString *thumbnail_pic_s03;
@property (nonatomic, copy, readwrite) NSString *title;
@property (nonatomic, copy, readwrite) NSString *uniquekey;
@property (nonatomic, copy, readwrite) NSString *url;

- (void)configWithJson:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
