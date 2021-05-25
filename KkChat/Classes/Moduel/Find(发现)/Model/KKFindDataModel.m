//
//  KKFindDataModel.m
//  KkChat
//
//  Created by 张安康 on 2021/5/25.
//

#import "KKFindDataModel.h"

@implementation KKFindDataModel
+ (instancetype)modelWithLeftLabel:(NSString *)leftLabel rightImg:(NSString *)rightImg leftImg:(NSString *)leftImg{
    KKFindDataModel *model = [[KKFindDataModel alloc] init];
    model.leftLabel = leftLabel;
    model.rightImg = rightImg;
    model.leftImg  = leftImg;
    return model;
}

@end
