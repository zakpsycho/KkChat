//
//  KKFindDataModel.h
//  KkChat
//
//  Created by 张安康 on 2021/5/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface KKFindDataModel : NSObject

@property (nonatomic, copy)NSString *leftLabel; //左侧文本
@property (nonatomic, copy)NSString *rightImg; //右侧图片
@property (nonatomic, copy)NSString *leftImg; //左侧图片
+(instancetype)modelWithLeftLabel:(NSString *)leftLabel rightImg:(NSString *)rightImg leftImg:(NSString *)leftImg;

@end

NS_ASSUME_NONNULL_END
