//
//  GKIndicatorView.m
//  GKRefreshAndLoadTableView
//
//  Created by gukong on 15/8/20.
//  Copyright (c) 2015年 gukong. All rights reserved.
//

#import "GKIndicatorView.h"
#import "UIScrollView+GKRefresh.h"

@interface GKIndicatorView ()

@property (nonatomic, strong) UIView *squareView;

@end

@implementation GKIndicatorView


- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupView];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshControl:) name:NOTIFICATIONNAME_REFRESHCONTROL_STATECHANGE object:nil];
    }
    return self;
}

- (void)setupView {
    _squareView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    [_squareView setBackgroundColor:[UIColor whiteColor]];
    [self addSubview:_squareView];
}

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    [_squareView setCenter:CGPointMake(CGRectGetWidth(self.bounds)/2, CGRectGetHeight(self.bounds)/2)];
}

- (void)refreshControl:(NSNotification *)notification {
    NSDictionary *userinfo = [notification userInfo];
    GKRefreshState oldState = (GKRefreshState)[[userinfo objectForKey:NOTIFICATIONKEY_REFRESHCONTROL_OLDSTATE] intValue];
    GKRefreshState newState = (GKRefreshState)[[userinfo objectForKey:NOTIFICATIONKEY_REFRESHCONTROL_NEWSTATE] intValue];
    NSLog(@"state change %d --> %d",oldState,newState);
}
@end
