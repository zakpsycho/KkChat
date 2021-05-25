//
//  KKFindTableViewCell.h
//  KkChat
//
//  Created by 张安康 on 2021/5/25.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface KKFindTableViewCell : UITableViewCell

@property (nonatomic, strong)UIImageView *leftImg; //左侧图片
@property (nonatomic, strong)UILabel *leftLabel; //左侧文字
@property (nonatomic, strong)UIImageView *rightImg; //右侧图片
@property (nonatomic, strong)UIImageView *rightclickBtn; //右侧点击箭头
@property (nonatomic, strong)UIView *lineView; //分割线

@end

NS_ASSUME_NONNULL_END
