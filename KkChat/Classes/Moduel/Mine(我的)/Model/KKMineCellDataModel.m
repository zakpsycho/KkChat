//
//  KKMineCellDataModel.m
//  KkChat
//
//  Created by 张安康 on 2021/5/25.
//

#import "KKMineCellDataModel.h"

@implementation KKMineCellDataModel
+ (instancetype)modelWithleftLabel:(NSString *)leftLabel imgName:(NSString *)imgName{
    KKMineCellDataModel *model = [[KKMineCellDataModel alloc] init];
    model.leftLabel = leftLabel;
    model.imgName = imgName;
    return model;
}

@end
