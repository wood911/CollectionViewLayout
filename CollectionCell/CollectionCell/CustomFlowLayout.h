//
//  CustomFlowLayout.h
//  CollectionCell
//
//  Created by wtf on 16/9/20.
//  Copyright © 2016年 xiaowu. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kEdge 14

@protocol CustomFlowLayoutDelegate <NSObject>
@optional
- (void)numberOfLineOnLayoutFinish:(NSInteger)number;
@end

@protocol CustomFlowLayoutDataSource <NSObject>
- (NSString *)titleForLabelAtIndexPath:(NSIndexPath *)indexPath;
@end

typedef struct currentOrigin {
    CGFloat     lineX;
    NSInteger   lineNumber;
}ItemOrigin;


@interface CustomFlowLayout : UICollectionViewFlowLayout {
    CGFloat         contentHeight;
    CGFloat         marginX;
    CGFloat         marginY;
    UIFont          *titleFont;
    NSInteger       itemCount;
    ItemOrigin      origin;
}
@property (nonatomic, weak) id<CustomFlowLayoutDelegate> delegate;
@property (nonatomic, weak) id<CustomFlowLayoutDataSource> dataSource;

@end
