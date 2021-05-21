//
//  KKAddressBookModel.m
//  KkChat
//
//  Created by 张安康 on 2021/5/21.
//

#import "KKAddressBookModel.h"

@implementation KKAddressBookModel
+ (instancetype)modelWithName:(NSString *)name img:(NSString *)img{
    KKAddressBookModel *model = [[KKAddressBookModel alloc] init];
    model.userName = name;
    model.imgName = img;
    return model;
}
@end
