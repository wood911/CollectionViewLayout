//
//  TagViewController.m
//  dotdotbuy
//
//  Created by wtf on 16/9/7.
//  Copyright © 2016年 week zhou. All rights reserved.
//

#import "TagViewController.h"
#import "DiscoveryTagCell.h"
#import "CustomFlowLayout.h"
#define HEXCOLOR(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface TagViewController ()<CustomFlowLayoutDelegate, CustomFlowLayoutDataSource>

@end

@implementation TagViewController

static NSString * const reuseIdentifier = @"tagCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *str = @"我 寄了张 卡片 地址 叫 感觉 收件人 叫 永远 请把 我的名字 默念 一百遍 好梦 就会趁你 睡醒 实现";
    self.tags = [str componentsSeparatedByString:@" "];
    
    // 设置预估值就可以自适应
    CustomFlowLayout *layout = [[CustomFlowLayout alloc] init];
    layout.dataSource = self;
    layout.delegate = self;
    self.collectionView.collectionViewLayout = layout;
    
//    self.collectionView.backgroundColor = HEXCOLOR(0x999999);
    
}

#pragma mark - CustomFlowLayoutDataSource/CustomFlowLayoutDelegate
- (NSString *)titleForLabelAtIndexPath:(NSIndexPath *)indexPath {
    return self.tags[indexPath.item];
}

- (void)numberOfLineOnLayoutFinish:(NSInteger)number {
    NSLog(@"rows=%ld", number);
}


#pragma mark <UICollectionViewDataSource>
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.tags.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    DiscoveryTagCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.title.text = self.tags[indexPath.item];
    return cell;
}

#pragma mark <UICollectionViewDelegate>
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [self.tagDelegate didSelectAtIndexPath:indexPath withTagStr:self.tags[indexPath.item]];
}


@end
