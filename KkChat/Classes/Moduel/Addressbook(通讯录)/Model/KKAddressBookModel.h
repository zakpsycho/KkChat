//
//  KKAddressBookModel.h
//  KkChat
//
//  Created by 张安康 on 2021/5/21.
//

#import <Foundation/Foundation.h>

//{@"imgName":@"AddressBook_headImg1",@"userName":@"康康"}

@interface KKAddressBookModel : NSObject
@property (strong, nonatomic) NSString *imgName;
@property (strong, nonatomic) NSString *userName;
+ (instancetype)modelWithName:(NSString *)name img:(NSString *)img;
@end
