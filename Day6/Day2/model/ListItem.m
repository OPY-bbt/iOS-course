//
//  ListItem.m
//  Day2
//
//  Created by 张岩 on 2019/10/5.
//  Copyright © 2019 zyGroup. All rights reserved.
//

#import "ListItem.h"

@implementation ListItem

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:self.author_name forKey:@"author_name"];
    [coder encodeObject:self.category forKey:@"category"];
    [coder encodeObject:self.date forKey:@"date"];
    [coder encodeObject:self.thumbnail_pic_s forKey:@"thumbnail_pic_s"];
    [coder encodeObject:self.thumbnail_pic_s02 forKey:@"thumbnail_pic_s02"];
    
    [coder encodeObject:self.thumbnail_pic_s03 forKey:@"thumbnail_pic_s03"];
    [coder encodeObject:self.title forKey:@"title"];
    [coder encodeObject:self.uniquekey forKey:@"uniquekey"];
    [coder encodeObject:self.url forKey:@"url"];
}

- (nullable instancetype)initWithCoder:(NSCoder *)coder {
    self = [super init];
    if (self) {
        self.author_name = [coder decodeObjectForKey:@"author_name"];
        self.category = [coder decodeObjectForKey:@"category"];
        self.date = [coder decodeObjectForKey:@"date"];
        self.thumbnail_pic_s = [coder decodeObjectForKey:@"thumbnail_pic_s"];
        self.thumbnail_pic_s02 = [coder decodeObjectForKey:@"thumbnail_pic_s02"];
        self.thumbnail_pic_s03 = [coder decodeObjectForKey:@"thumbnail_pic_s03"];
        self.title = [coder decodeObjectForKey:@"title"];
        self.uniquekey = [coder decodeObjectForKey:@"uniquekey"];
        self.url = [coder decodeObjectForKey:@"url"];
    }
    return self;
}

+ (BOOL) supportsSecureCoding{
    return YES;
}

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
