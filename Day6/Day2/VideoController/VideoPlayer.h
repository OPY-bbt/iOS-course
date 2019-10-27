//
//  VideoPlayer.h
//  Day2
//
//  Created by 张岩 on 2019/10/27.
//  Copyright © 2019 zyGroup. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface VideoPlayer : NSObject

+ (VideoPlayer *)Player;

- (void)playVideoWithUrl:(NSString *)videoUrl attachView:(UIView *)attarchView;

@end

NS_ASSUME_NONNULL_END
