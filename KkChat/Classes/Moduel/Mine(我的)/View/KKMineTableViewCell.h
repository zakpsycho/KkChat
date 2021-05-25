//
//  KKMineTableViewCell.h
//  KkChat
//
//  Created by 张安康 on 2021/5/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface KKMineTableViewCell : UITableViewCell

@property (nonatomic, strong) UIImageView *leftImg; //左侧图片
@property (nonatomic, strong) UILabel *leftLabel;//左侧文本
@property (nonatomic, strong) UIImageView *rightImg;//右侧图片
@property (nonatomic, strong) UIView *lineView;//分割线


@end

NS_ASSUME_NONNULL_END
