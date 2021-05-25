//
//  KKMineHeaderView.m
//  KkChat
//
//  Created by 张安康 on 2021/5/21.
//

#import "KKMineHeaderView.h"

@implementation KKMineHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self customView];
    }
    return self;
}

#pragma mark - 填充UI
-(void)customView{
    [self addSubview:self.headImg];
    [self addSubview:self.userName];
    [self addSubview:self.chatNum];
    [self addSubview:self.twoCodeNum];
    [self addSubview:self.arrow];
    
    [self layoutSubview];
}

#pragma mark - 适配UI
-(void)layoutSubview{
    [self.headImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(Navigation_Bar_Height);
        make.left.mas_equalTo(AdaptedWidth(28));
        make.size.mas_equalTo(CGSizeMake(AdaptedWidth(70), AdaptedWidth(70)));
    }];
    [self.userName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(Navigation_Bar_Height + AdaptedWidth(6));
        make.left.mas_equalTo(self.headImg.mas_right).offset(AdaptedWidth(16));
    }];
    [self.chatNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.headImg.mas_right).offset(AdaptedWidth(16));
        make.top.mas_equalTo(self.userName.mas_bottom).offset(AdaptedWidth(14));
    }];
    
    [self.twoCodeNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.chatNum.mas_centerY);
        make.left.mas_equalTo(self.chatNum.mas_right).offset(AdaptedWidth(5));
        make.size.mas_equalTo(CGSizeMake(AdaptedWidth(12), AdaptedWidth(12)));
    }];
    
    [self.arrow mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.twoCodeNum.mas_centerY);
        make.right.mas_equalTo(self.mas_right).offset(AdaptedWidth(-10));
    }];
    
}


#pragma mark - 懒加载
- (UIImageView *)headImg{
    if (!_headImg) {
        _headImg = [[UIImageView alloc] initWithFrame:CGRectZero];
        _headImg.image = [UIImage imageNamed:@"AddressBook_headImg3"];
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
        _userName.text = @"康康.";
        _userName.font = AdaptedBoldFontSize(22);
        _userName.textAlignment = NSTextAlignmentLeft;
    }
    return _userName;
}
- (UILabel *)chatNum{
    if (!_chatNum) {
        _chatNum = [[UILabel alloc] initWithFrame:CGRectZero];
        _chatNum.text = @"微信号：kiki_1008";
        _chatNum.textColor = KGrayColor;
        _chatNum.font = AdaptedFontSize(17);
        _chatNum.textAlignment = NSTextAlignmentLeft;
    }
    return _chatNum;
}
- (UIImageView *)twoCodeNum{
    if (!_twoCodeNum) {
        _twoCodeNum = [[UIImageView alloc] initWithFrame:CGRectZero];
        _twoCodeNum.image = [UIImage imageNamed:@"Mine_twoCodeNum"];
        _twoCodeNum.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _twoCodeNum;
}
- (UIImageView *)arrow{
    if (!_arrow) {
        _arrow = [[UIImageView alloc] initWithFrame:CGRectZero];
        _arrow.image = [UIImage imageNamed:@"Mine_grayBtn"];
        _arrow.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _arrow;
}


@end
