//
//  LXSCollectionView.m
//  UICollectionView 多选高亮
//
//  Created by 梁兴胜 on 16/8/31.
//  Copyright © 2016年 Loyt. All rights reserved.
//

#import "LXSCollectionView.h"

@interface LXSCollectionView ()
@property (nonatomic, strong) UICollectionViewFlowLayout *flowLayout;
@end

@implementation LXSCollectionView
//
-(instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    
    if (self = [super initWithFrame:frame collectionViewLayout:self.flowLayout]) {
        
        [self setupUI];
    }
    return self;
}

//
-(void)setupUI{
    
    self.backgroundColor = [UIColor whiteColor];
    
}


-(UICollectionViewFlowLayout *)flowLayout{
    
    if (!_flowLayout) {
        
        _flowLayout = [[UICollectionViewFlowLayout alloc] init];
        _flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        _flowLayout.minimumLineSpacing = 1;
        _flowLayout.minimumInteritemSpacing = 1;
        _flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        CGFloat w = (int)([UIScreen mainScreen].bounds.size.width/5)-1;
        CGFloat h = w;
        _flowLayout.itemSize = CGSizeMake(w, h);
    }
    return _flowLayout;
}

@end
