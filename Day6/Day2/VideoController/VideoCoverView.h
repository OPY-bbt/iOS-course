//
//  VideoCoverView.h
//  Day2
//
//  Created by 张岩 on 2019/10/20.
//  Copyright © 2019 zyGroup. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface VideoCoverView : UICollectionViewCell

- (void) layoutWithVideoCoverUrl: (NSString *) videoCoverUrl videoUrl:(NSString *)videoUrl;

@end

NS_ASSUME_NONNULL_END
