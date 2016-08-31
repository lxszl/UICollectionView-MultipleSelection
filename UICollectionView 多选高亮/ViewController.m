//
//  ViewController.m
//  UICollectionView 多选高亮
//
//  Created by 梁兴胜 on 16/8/31.
//  Copyright © 2016年 Loyt. All rights reserved.
//

#import "ViewController.h"
#import "LXSCollectionView.h"
#import "LXSCollectionViewCell.h"
#import "UIView+Utils.h"
#import "LXSBeautyModel.h"

@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic, strong) LXSCollectionView *collectionView;
@property (nonatomic, strong) NSArray *imageArray;
@property (nonatomic, strong) NSArray *titleArray;
@property (nonatomic, strong) NSArray *typeArray;
@property (nonatomic, strong) NSMutableArray *beautyArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.collectionView];
}

-(LXSCollectionView *)collectionView{
    
    if (!_collectionView) {
        
        _collectionView = [[LXSCollectionView alloc] initWithFrame:CGRectMake(0, 64, self.view.width, self.view.height - 64)];
        [_collectionView registerClass:[LXSCollectionViewCell class] forCellWithReuseIdentifier:@"LXSCollectionViewCell"];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        //
        _collectionView.allowsMultipleSelection = YES;
    }
    return _collectionView;
}

-(NSMutableArray *)beautyArray{
    
    if (!_beautyArray) {
        
        _beautyArray = [NSMutableArray arrayWithCapacity:self.imageArray.count];
        
        for (NSInteger i = 0; i < self.imageArray.count; i++) {
            
            LXSBeautyModel *beauty = [[LXSBeautyModel alloc] init];
            beauty.imageStr = self.imageArray[i];
            beauty.titleStr = self.titleArray[i];
            //错误的
//            beauty.beautyType = (LXSBeautyType)self.typeArray[i];
            //先转为NSInteger,再转为枚举类型LXSBeautyType
            //1. [self.typeArray[i] integerValue]
            //2. (LXSBeautyType)[self.typeArray[i] integerValue]
            beauty.beautyType = (LXSBeautyType)[self.typeArray[i] integerValue];
            [_beautyArray addObject:beauty];
        }
    }
    return _beautyArray;
}

-(NSArray *)imageArray{
    
    if (!_imageArray) {
        
        _imageArray = @[@"beauty0.jpg",@"beauty1.jpg",@"beauty2.jpg"];
    }
    return _imageArray;
}

-(NSArray *)titleArray{
    
    if (!_titleArray) {
        
        _titleArray = @[@"嘿嘿",@"哈哈",@"啪啪"];
    }
    return _titleArray;
}

-(NSArray *)typeArray{
    
    if (!_typeArray) {
        //从数组中取出时要注意类型
        _typeArray = @[@(LXSBeautyTypeHeihei),@(LXSBeautyTypeHaha),@(LXSBeautyTypePapa)];
    }
    return _typeArray;
}

#pragma mark - UICollectionViewDataSource
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.beautyArray.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    LXSCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"LXSCollectionViewCell" forIndexPath:indexPath];
    
    cell.beautyModel = self.beautyArray[indexPath.item];
    return cell;
}

#pragma mark - UICollectionViewDelegate

-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return YES;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    LXSBeautyModel *beautyModel = self.beautyArray[indexPath.item];
    NSLog(@"titleStr %@, beautyModel %ld",beautyModel.titleStr,beautyModel.beautyType);
    
    LXSCollectionViewCell *cell = (LXSCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    [cell.contentView setBackgroundColor:[UIColor orangeColor]];
}

-(void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    LXSCollectionViewCell *cell = (LXSCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    [cell.contentView setBackgroundColor:[UIColor whiteColor]];
}

@end
