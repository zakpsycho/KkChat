//
//  KKFindTableViewCell.m
//  KkChat
//
//  Created by 张安康 on 2021/5/25.
//

#import "KKFindTableViewCell.h"

@implementation KKFindTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self customView];
    }
    return self;
}

#pragma mark - 填充UI
-(void)customView{
    [self.contentView addSubview:self.leftImg];
    [self.contentView addSubview:self.leftLabel];
    [self.contentView addSubview:self.rightclickBtn];
    [self.contentView addSubview:self.rightImg];
    [self.contentView addSubview:self.lineView];
    
    [self layoutSubview];
}


#pragma mark - 适配UI
- (void)layoutSubview{
    [self.leftImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(AdaptedWidth(24), AdaptedWidth(24)));
        make.left.mas_equalTo(AdaptedWidth(10));
    }];
    
    [self.leftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.leftImg.mas_centerY);
        make.left.mas_equalTo(self.leftImg.mas_right).offset(AdaptedWidth(16));
    }];
    
    [self.rightclickBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.contentView).offset(AdaptedWidth(-10));
        make.centerY.mas_equalTo(self.leftImg.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(AdaptedWidth(10), AdaptedWidth(14)));
    }];
    
    [self.rightImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.leftImg.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(AdaptedWidth(30), AdaptedWidth(30)));
        make.right.mas_equalTo(self.rightclickBtn.mas_left).offset(-AdaptedWidth(6));
    }];
    
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(0);
        make.left.mas_equalTo(self.leftImg.mas_right).offset(AdaptedWidth(10));
        make.right.mas_equalTo(0);
        make.height.mas_equalTo(AdaptedWidth(0.5));
    }];

}

#pragma mark - 懒加载UI
- (UIImageView *)leftImg{
    if (!_leftImg) {
        _leftImg = [[UIImageView alloc] initWithFrame:CGRectZero];
        _leftImg.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _leftImg;
}
- (UILabel *)leftLabel{
    if (!_leftLabel) {
        _leftLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _leftLabel.textColor = KBlackColor;
        _leftLabel.font = AdaptedFontSize(16);
        _leftLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _leftLabel;
}
- (UIImageView *)rightImg{
    if (!_rightImg) {
        _rightImg = [[UIImageView alloc] initWithFrame:CGRectZero];
        _rightImg.contentMode = UIViewContentModeScaleAspectFit;
        _rightImg.layer.cornerRadius = AdaptedWidth(4);
        _rightImg.layer.masksToBounds = YES;
    }
    return _rightImg;
}
- (UIImageView *)rightclickBtn{
    if (!_rightclickBtn) {
        _rightclickBtn = [[UIImageView alloc] initWithFrame:CGRectZero];
        _rightclickBtn.contentMode = UIViewContentModeScaleAspectFit;
        _rightclickBtn.image = [UIImage imageNamed:@"Mine_grayBtn"];
    }
    return _rightclickBtn;
}
- (UIView *)lineView{
    if (!_lineView) {
        _lineView = [[UIView alloc] initWithFrame:CGRectZero];
        _lineView.backgroundColor = RGBColorHex(f0f0f0);
    }
    return _lineView;
}

@end
