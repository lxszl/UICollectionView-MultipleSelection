//
//  LXSBeautyModel.h
//  UICollectionView 多选高亮
//
//  Created by 梁兴胜 on 16/8/31.
//  Copyright © 2016年 Loyt. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, LXSBeautyType) {
    LXSBeautyTypeHeihei = 1000,
    LXSBeautyTypeHaha,
    LXSBeautyTypePapa,
};

@interface LXSBeautyModel : NSObject
@property (nonatomic, copy) NSString *imageStr;
@property (nonatomic, copy) NSString *titleStr;
@property (nonatomic, assign) LXSBeautyType beautyType;
@end
