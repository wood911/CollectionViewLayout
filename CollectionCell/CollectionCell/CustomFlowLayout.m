//
//  CustomFlowLayout.m
//  CollectionCell
//
//  Created by wtf on 16/9/20.
//  Copyright © 2016年 xiaowu. All rights reserved.
//

#import "CustomFlowLayout.h"

@interface CustomFlowLayout ()
/** 所有的布局属性 */
@property (nonatomic, strong) NSMutableArray *attrsArray;
@end

@implementation CustomFlowLayout

- (NSMutableArray *)attrsArray {
    if (!_attrsArray) {
        _attrsArray = [NSMutableArray array];
    }
    return _attrsArray;
}

- (void)prepareLayout {
    [super prepareLayout];
    
    self.sectionInset = UIEdgeInsetsMake(kEdge, kEdge, kEdge, kEdge);
    contentHeight = 2 * kEdge;
    titleFont = [UIFont systemFontOfSize:12];
    self.minimumLineSpacing = kEdge;
    self.minimumInteritemSpacing = kEdge;
    marginX = 40;
    marginY = 28;
    itemCount = [self.collectionView numberOfItemsInSection:0];
    origin.lineNumber = 0;
    origin.lineX = self.sectionInset.left;
    
}

/**
 *  相关问题：http://stackoverflow.com/questions/24490841/uicollectionviewlayout-layoutattributesforelementsinrect-and-layoutattributesfor
 *  [super layoutAttributesForElementsInRect] returns valid layout attributes when used on a subclass of UICollectionViewFlowLayout. 
 *  It returns nil when used on a custom subclass of UICollectionViewLayout.
 *  If you write your own layout based on UICollectionViewLayout you can create blank layout attributes using
 *  [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:]
 *
 *  返回rect中的所有的元素的布局属性
 *
 */
- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSArray *attributesArray = [super layoutAttributesForElementsInRect:rect];
    for (int i = 0; i < attributesArray.count; i++) {
        UICollectionViewLayoutAttributes *attr = attributesArray[i];
        NSString *title = [self.dataSource titleForLabelAtIndexPath:[NSIndexPath indexPathForItem:i inSection:0]];
        CGSize size = [self sizeWithTitle:title font:titleFont];
        CGFloat itemWidth = size.width + marginX, itemHeight = size.height + marginY;
        CGFloat originX = origin.lineX, originY = origin.lineNumber * (itemHeight + self.minimumLineSpacing) + self.sectionInset.top;
        attr.frame = CGRectMake(originX, originY, itemWidth, itemHeight);
        origin.lineX += itemWidth + self.minimumInteritemSpacing;
        if (i < attributesArray.count - 1) {
            NSString *nextTitle = [self.dataSource titleForLabelAtIndexPath:[NSIndexPath indexPathForItem:i + 1 inSection:0]];
            CGSize nextSize = [self sizeWithTitle:nextTitle font:titleFont];
            if (nextSize.width + marginX > CGRectGetWidth(self.collectionView.frame) - origin.lineX - self.sectionInset.right) {
                origin.lineNumber += 1;
                origin.lineX = self.sectionInset.left;
            }
        }else {
            contentHeight = originY + self.sectionInset.bottom;
            [self.delegate numberOfLineOnLayoutFinish:origin.lineNumber + 1];
        }
    }
    return attributesArray;
}

// 内容高度ContentSize
- (CGSize)collectionViewContentSize {
    CGSize size = [super collectionViewContentSize];
    return CGSizeMake(size.width, contentHeight);
}

- (CGSize)sizeWithTitle:(NSString *)title font:(UIFont *)font {
    CGRect rect = [title boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil];
    return rect.size;
}

@end
