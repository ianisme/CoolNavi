//
//  CoolNavi.h
//  CoolNaviDemo
//
//  Created by ian on 15/1/19.
//  Copyright (c) 2015年 ian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CoolNavi : UIView
@property (nonatomic, strong) UIViewController *viewController;
@property (nonatomic, strong) UIScrollView *scrollView;

- (id)initWithFrame:(CGRect)frame backGroudImage:(NSString *)backImageName headerImageURL:(NSString *)headerImageURL title:(NSString *)title subTitle:(NSString *)subTitle;

-(void)updateSubViewsWithScrollOffset:(CGPoint)newOffset;

@end
