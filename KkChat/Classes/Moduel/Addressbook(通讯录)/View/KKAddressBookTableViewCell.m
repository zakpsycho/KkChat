//
//  KKAddressBookTableViewCell.m
//  KkChat
//
//  Created by 张安康 on 2021/5/21.
//

#import "KKAddressBookTableViewCell.h"

@implementation KKAddressBookTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self customView];
    }
    return self;
}

#pragma mark - 填充UI
-(void)customView{
    [self.contentView addSubview:self.headImg];
    [self.contentView addSubview:self.userName];
    [self.contentView addSubview:self.linView];
    
    [self layoutSubview];
}

#pragma mark - 适配UI
-(void)layoutSubview{
    [self.headImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(AdaptedWidth(16));
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(AdaptedWidth(40), AdaptedWidth(40)));
    }];
    
    [self.userName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.headImg.mas_centerY);
        make.left.mas_equalTo(self.headImg.mas_right).offset(AdaptedWidth(10));
    }];
    
    [self.linView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(0);
        make.left.mas_equalTo(self.headImg.mas_right).offset(AdaptedWidth(10));
        make.right.mas_equalTo(0);
        make.height.mas_equalTo(AdaptedWidth(0.5));
    }];
}

#pragma mark - 懒加载
- (UIImageView *)headImg{
    if (!_headImg) {
        _headImg = [[UIImageView alloc] initWithFrame:CGRectZero];
        _headImg.contentMode = UIViewContentModeScaleAspectFit;
        _headImg.layer.cornerRadius = 4;
        _headImg.layer.masksToBounds = YES;
    }
    return _headImg;
}
- (UILabel *)userName{
    if (!_userName) {
        _userName = [[UILabel alloc] initWithFrame:CGRectZero];
        _userName.textColor = KBlackColor;
        _userName.font = AdaptedFontSize(17);
        _userName.textAlignment = NSTextAlignmentLeft;
    }
    return _userName;
}
- (UIView *)linView{
    if (!_linView) {
        _linView = [[UIView alloc] initWithFrame:CGRectZero];
        _linView.backgroundColor = RGBColorHex(f0f0f0);
    }
    return _linView;
}

@end
