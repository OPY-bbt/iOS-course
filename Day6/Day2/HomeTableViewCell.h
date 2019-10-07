//
//  HomeTableViewCell.h
//  Day2
//
//  Created by 张岩 on 2019/9/28.
//  Copyright © 2019 zyGroup. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class ListItem;

@protocol HomeTableViewCellDelegate <NSObject>

- (void)tabViewCell:(UITableViewCell *)tabViewCell clickDeleteButton:(UIButton *)deleteButton;

@end

@interface HomeTableViewCell : UITableViewCell

@property (nonatomic, weak, readwrite) id<HomeTableViewCellDelegate> delegate;

- (void)layoutTableViewCellWithItem:(ListItem *)item;

@end

NS_ASSUME_NONNULL_END
