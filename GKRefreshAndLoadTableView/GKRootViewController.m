//
//  GKRootViewController.m
//  GKRefreshAndLoadTableView
//
//  Created by gukong on 15/8/20.
//  Copyright (c) 2015年 gukong. All rights reserved.
//

#import "GKRootViewController.h"
#import "UIScrollView+GKRefresh.h"

@interface GKRootViewController ()<UITableViewDataSource, GKRefreshControlDelegate>
@property (nonatomic, strong) UITableView *kTableView;
@end

@implementation GKRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    // Do any additional setup after loading the view.
    
    _kTableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    [_kTableView setCanPullDownToRefresh:YES];
    [_kTableView setCanPullUpToLoadMore:YES];
    [_kTableView setDataSource:self];
    [_kTableView setRefreshControlDelegate:self];
    [self.view addSubview:_kTableView];
}

- (void)startPullDownLoading:(UIScrollView *)scrollView {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [_kTableView stopLoadingView];
    });
}

- (void)startPullUpLoading:(UIScrollView *)scrollView {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [_kTableView stopLoadingView];
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    [cell setBackgroundColor:[UIColor greenColor]];
    return cell;
}


@end
