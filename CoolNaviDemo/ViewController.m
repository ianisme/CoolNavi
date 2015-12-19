//
//  ViewController.m
//  CoolNavi
//
//  Created by ian on 15/1/19.
//  Copyright (c) 2015年 ian. All rights reserved.
//

#import "ViewController.h"
#import "CoolNavi.h"

static CGFloat const kWindowHeight = 205.0f;
static NSUInteger const kCellNum = 40;
static NSUInteger const kRowHeight = 44;
static NSString * const kCellIdentify = @"cell";

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ViewController

#pragma mark - life sytle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationController setNavigationBarHidden:YES];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    self.tableView.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame));
    CoolNavi *headerView = [[CoolNavi alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), kWindowHeight)backGroudImage:@"background" headerImageURL:@"http://d.hiphotos.baidu.com/image/pic/item/0ff41bd5ad6eddc4f263b0fc3adbb6fd52663334.jpg" title:@"妹子!" subTitle:@"个性签名, 啦啦啦!"];
    headerView.scrollView = self.tableView;
    headerView.imgActionBlock = ^(){
        NSLog(@"headerImageAction");
    };
    [self.view addSubview:headerView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - getter and setter

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kCellIdentify];
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

#pragma mark - tableView Delegate and dataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return kCellNum;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentify forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"test %ld",(long)indexPath.row];
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kRowHeight;
}

@end
