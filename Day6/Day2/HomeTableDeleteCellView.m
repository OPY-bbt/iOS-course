//
//  HomeTableDeleteCellView.m
//  Day2
//
//  Created by 张岩 on 2019/10/2.
//  Copyright © 2019 zyGroup. All rights reserved.
//

#import "HomeTableDeleteCellView.h"

@interface HomeTableDeleteCellView()

@property(nonatomic, strong, readwrite) UIView *backgroundView;
@property(nonatomic, strong, readwrite) UIButton *deleteButton;
@property(nonatomic, copy, readwrite) dispatch_block_t deleteBlock;

@end

@implementation HomeTableDeleteCellView

-(instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:({
            self.backgroundView = [[UIView alloc] initWithFrame:self.bounds];
            self.backgroundView.backgroundColor = [UIColor blackColor];
            self.backgroundView.alpha = 0.6;
            [self.backgroundView addGestureRecognizer:({
                UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissView)];
                tapRecognizer;
            })];
            self.backgroundView;
        })];
        
        [self addSubview:({
            self.deleteButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
            self.deleteButton.backgroundColor = [UIColor blueColor];
            [self.deleteButton addTarget:self action:@selector(clickButton) forControlEvents:UIControlEventTouchUpInside];
            self.deleteButton;
        })];
    }
    return self;
}

-(void) showViewFromPoint:(CGPoint) point clickBlock:(dispatch_block_t) clickBlock{
    self.deleteButton.frame = CGRectMake(point.x, point.y, 0, 0);
    self.deleteBlock = [clickBlock copy];
//    [[UIApplication sharedApplication].keyWindow addSubview:self];
    [UIApplication.sharedApplication.windows.firstObject addSubview:self];
//    [UIView animateWithDuration:1.f animations:^{
//        self.deleteButton.frame = CGRectMake((self.bounds.size.width - 200) / 2, (self.bounds.size.height - 200) / 2, 200, 200);
//    }];
    
    [UIView animateWithDuration:1.f delay:0.f usingSpringWithDamping:0.5 initialSpringVelocity:0.5 options:UIViewAnimationOptionCurveEaseInOut|UIViewAnimationOptionAllowUserInteraction animations:^{
        self.deleteButton.frame = CGRectMake((self.bounds.size.width - 200) / 2, (self.bounds.size.height - 200) / 2, 200, 200);
    } completion:^(BOOL finished) {
        NSLog(finished ? @"true": @"false");
    }];
}

-(void) dismissView {
    [self removeFromSuperview];
}

-(void) clickButton {
    if (self.deleteBlock) {
        self.deleteBlock();
    }

    [self removeFromSuperview];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
