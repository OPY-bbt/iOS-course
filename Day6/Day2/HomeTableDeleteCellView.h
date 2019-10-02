//
//  HomeTableDeleteCellView.h
//  Day2
//
//  Created by 张岩 on 2019/10/2.
//  Copyright © 2019 zyGroup. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HomeTableDeleteCellView : UIView
-(void) showViewFromPoint:(CGPoint) point clickBlock:(dispatch_block_t) clickBlock;
@end

NS_ASSUME_NONNULL_END
