//
//  TagViewController.h
//  dotdotbuy
//
//  Created by wtf on 16/9/7.
//  Copyright © 2016年 week zhou. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TagViewControllerDelegate <NSObject>
- (void)didSelectAtIndexPath:(NSIndexPath *)indexPath withTagStr:(NSString *)tagStr;
@end

@interface TagViewController : UICollectionViewController
// 数据源shopCell
@property (nonatomic, strong) NSArray<NSString *> *tags;

@property (nonatomic, weak) id<TagViewControllerDelegate> tagDelegate;

@end
