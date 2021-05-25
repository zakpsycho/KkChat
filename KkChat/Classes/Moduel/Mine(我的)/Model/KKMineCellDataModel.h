//
//  KKMineCellDataModel.h
//  KkChat
//
//  Created by 张安康 on 2021/5/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface KKMineCellDataModel : NSObject

@property (nonatomic,copy) NSString *leftLabel;
@property (nonatomic,copy) NSString *imgName;
+(instancetype)modelWithleftLabel:(NSString *)leftLabel imgName:(NSString *)imgName;

@end

NS_ASSUME_NONNULL_END
