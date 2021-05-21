//
//  KKAddressBookTableViewCell.h
//  KkChat
//
//  Created by 张安康 on 2021/5/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface KKAddressBookTableViewCell : UITableViewCell

@property (nonatomic, strong) UIImageView *headImg; //通讯录左侧好友头像
@property (nonatomic, strong) UILabel *userName; //用户名
@property (nonatomic, strong) UIView *linView;//自定义分割线

@end

NS_ASSUME_NONNULL_END
