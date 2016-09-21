//
//  DiscoveryTagCell.m
//  dotdotbuy
//
//  Created by 伍腾飞 on 16/9/7.
//  Copyright © 2016年 week zhou. All rights reserved.
//

#import "DiscoveryTagCell.h"

#define kCellInset 14

@implementation DiscoveryTagCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.layer.cornerRadius = 5;
    self.layer.masksToBounds = YES;
}

- (UICollectionViewLayoutAttributes *)preferredLayoutAttributesFittingAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes {
    UICollectionViewLayoutAttributes *layout = [super preferredLayoutAttributesFittingAttributes:layoutAttributes];
    CGRect frame = [_title.text boundingRectWithSize:CGSizeMake(MAXFLOAT, _title.frame.size.height) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:_title.font} context:nil];
    layout.frame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width + 40, frame.size.height + 28);
    return layout;
}

@end
