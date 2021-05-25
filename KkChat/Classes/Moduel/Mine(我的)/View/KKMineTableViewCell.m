//
//  KKMineTableViewCell.m
//  KkChat
//
//  Created by 张安康 on 2021/5/21.
//

#import "KKMineTableViewCell.h"

@implementation KKMineTableViewCell

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
    [self.contentView addSubview:self.rightImg];
    [self.contentView addSubview:self.lineView];
    
    [self layoutSubview];
}

#pragma mark - 适配UI
- (void)layoutSubview{
    [self.leftImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
        make.left.mas_equalTo(AdaptedWidth(10));
        make.size.mas_equalTo(CGSizeMake(AdaptedWidth(20), AdaptedWidth(20)));
    }];
    
    [self.leftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.leftImg.centerY);
        make.left.mas_equalTo(self.leftImg.mas_right).offset(AdaptedWidth(16));
    }];
    
    [self.rightImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.leftImg.centerY);
        make.right.mas_equalTo(AdaptedWidth(-8));
        make.size.mas_equalTo(CGSizeMake(AdaptedWidth(6), AdaptedWidth(9)));
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
        _leftImg.image = [UIImage imageNamed:@""];
        _leftImg.contentMode = UIViewContentModeScaleAspectFit;
        _leftImg.layer.cornerRadius = 4;
        _leftImg.layer.masksToBounds = YES;
    }
    return _leftImg;
}

- (UILabel *)leftLabel{
    if (!_leftLabel) {
        _leftLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _leftLabel.textColor = KBlackColor;
        _leftLabel.font = AdaptedFontSize(14);
        _leftLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _leftLabel;
}
- (UIImageView *)rightImg{
    if (!_rightImg) {
        _rightImg = [[UIImageView alloc] initWithFrame:CGRectZero];
        _rightImg.image = [UIImage imageNamed:@"Mine_grayBtn"];
        _rightImg.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _rightImg;
}
- (UIView *)lineView{
    if (!_lineView) {
        _lineView = [[UIView alloc] initWithFrame:CGRectZero];
        _lineView.backgroundColor = RGBColorHex(f0f0f0);
    }
    return _lineView;
}

@end
