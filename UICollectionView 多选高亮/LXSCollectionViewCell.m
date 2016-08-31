//
//  LXSCollectionViewCell.m
//  UICollectionView 多选高亮
//
//  Created by 梁兴胜 on 16/8/31.
//  Copyright © 2016年 Loyt. All rights reserved.
//

#import "LXSCollectionViewCell.h"
#import "UIView+Utils.h"
#import "LXSBeautyModel.h"
#import "Masonry.h"

@interface LXSCollectionViewCell ()
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *titleLabel;
@end

@implementation LXSCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        [self setupUI];
    }
    return self;
}

-(void)setupUI{
    
    [self.contentView addSubview:self.imageView];
    [self.contentView addSubview:self.titleLabel];
    
    [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self.contentView).mas_offset(5);
        make.size.mas_equalTo(CGSizeMake(40, 40));
        make.centerX.mas_equalTo(self.contentView);
    }];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.bottom.mas_equalTo(self.contentView).mas_offset(-5);
        make.centerX.mas_equalTo(self.contentView);
    }];
}


-(UIImageView *)imageView{
    
    if (!_imageView) {
        
        _imageView = [[UIImageView alloc] init];
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
        _imageView.layer.cornerRadius = 20;
        _imageView.layer.masksToBounds = YES;
        
    }
    return _imageView;
}

-(UILabel *)titleLabel{
    
    if (!_titleLabel) {
        
        _titleLabel = [[UILabel alloc] init];
        [_titleLabel setFont:[UIFont systemFontOfSize:12]];
        [_titleLabel setTextColor:[UIColor blackColor]];
        [_titleLabel setTextAlignment:NSTextAlignmentCenter];

    }
    return _titleLabel;
}

-(void)setBeautyModel:(LXSBeautyModel *)beautyModel{
    
    _beautyModel = beautyModel;
    _imageView.image = [UIImage imageNamed:beautyModel.imageStr];
    _titleLabel.text = beautyModel.titleStr;
}

@end
