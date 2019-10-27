//
//  VideoPlayer.m
//  Day2
//
//  Created by 张岩 on 2019/10/27.
//  Copyright © 2019 zyGroup. All rights reserved.
//

#import "VideoPlayer.h"
#import <AVFoundation/AVFoundation.h>

@interface VideoPlayer()

@property (nonatomic, strong, readwrite) AVPlayerItem *videoItem;
@property (nonatomic, strong, readwrite) AVPlayer *avPlayer;
@property (nonatomic, strong, readwrite) AVPlayerLayer *playerLayer;

@end

@implementation VideoPlayer

+ (VideoPlayer *)Player {
    static VideoPlayer *player;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        player = [[VideoPlayer alloc] init];
    });
    return player;
}

- (void) playVideoWithUrl: (NSString *) videoUrl attachView:(UIView *)attarchView {
   [self stopPlay];
    
   NSURL *videoURL = [NSURL URLWithString:videoUrl];
   AVAsset *asset = [AVAsset assetWithURL:videoURL];

   _videoItem = [AVPlayerItem playerItemWithAsset:asset];
   [_videoItem addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];
   [_videoItem addObserver:self forKeyPath:@"loadedTimeRanges" options:NSKeyValueObservingOptionNew context:nil];
   
   _avPlayer = [AVPlayer playerWithPlayerItem:_videoItem];
   [_avPlayer addPeriodicTimeObserverForInterval:CMTimeMake(1, 1) queue:dispatch_get_main_queue() usingBlock:^(CMTime time) {
       NSLog(@"播放进度 %@", @(CMTimeGetSeconds(time)));
   }];

   _playerLayer = [AVPlayerLayer playerLayerWithPlayer:_avPlayer];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(_handlePlayEnd) name:AVPlayerItemDidPlayToEndTimeNotification object:nil];

   _playerLayer.frame = attarchView.bounds;
   [attarchView.layer addSublayer:_playerLayer];
}

-(void) stopPlay {
    [_playerLayer removeFromSuperlayer];
    _videoItem = nil;
    _avPlayer = nil;
    
    [_videoItem removeObserver:self forKeyPath:@"status"];
    [_videoItem removeObserver:self forKeyPath:@"loadedTimeRanges"];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)_handlePlayEnd {
    [_avPlayer seekToTime:CMTimeMake(0, 1)];
    [_avPlayer play];
}


- (void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"status"]) {
        if (((NSNumber *) [change objectForKey:NSKeyValueChangeNewKey]).integerValue == AVPlayerStatusReadyToPlay) {
            [_avPlayer play];
            
            CGFloat videoDuration = CMTimeGetSeconds(_videoItem.duration);
            NSLog(@"总时长 %@", [NSString stringWithFormat:@"%f", videoDuration]);
        } else {
            NSLog(@"");
        }
    } else if ([keyPath isEqualToString:@"loadedTimeRanges"]) {
        NSLog(@"缓冲到 %@", [change objectForKey:NSKeyValueChangeNewKey]);
    }
}
@end
