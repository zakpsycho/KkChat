//
//  KKMineHeaderView.h
//  KkChat
//
//  Created by 张安康 on 2021/5/21.
//

#import <UIKit/UIKit.h>


@interface KKMineHeaderView : UIView

@property (nonatomic, strong) UIImageView *headImg; //用户头像
@property (nonatomic, strong) UILabel *userName; //用户名
@property (nonatomic, strong) UILabel *chatNum; //k信号
@property (nonatomic, strong) UIImageView *twoCodeNum; //二维码
@property (nonatomic, strong) UIImageView *arrow;//箭头

@end

