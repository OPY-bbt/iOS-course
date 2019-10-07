//
//  ListItem.m
//  Day2
//
//  Created by 张岩 on 2019/10/5.
//  Copyright © 2019 zyGroup. All rights reserved.
//

#import "ListItem.h"

@implementation ListItem

- (void)configWithJson:(NSDictionary *)dictionary {
    self.author_name = dictionary[@"author_name"];
    self.category = dictionary[@"category"];
    self.date = dictionary[@"date"];
    self.thumbnail_pic_s = dictionary[@"thumbnail_pic_s"];
    self.thumbnail_pic_s02 = dictionary[@"thumbnail_pic_s02"];
    self.thumbnail_pic_s03 = dictionary[@"thumbnail_pic_s03"];
    self.title = dictionary[@"title"];
    self.uniquekey = dictionary[@"uniquekey"];
    self.url = dictionary[@"url"];
}

@end
