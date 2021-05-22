//
//  KKAddressBookViewController.m
//  KkChat
//
//  Created by 张安康 on 2021/5/21.
//

#import "KKAddressBookViewController.h"
#import "KKAddressBookModel.h"
#import "KKAddressBookTableViewCell.h"

@interface KKAddressBookViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray <NSArray <KKAddressBookModel *>*> *datasArray;

@end

@implementation KKAddressBookViewController

#pragma mark - View生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self customView];
}
#pragma mark - 填充UI
-(void)customView{
    [self.view addSubview:self.tableView];
    [self LayoutSubview];
}

#pragma mark - 适配UI
-(void)LayoutSubview{
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(Status_And_Navigation_Height());
        make.left.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        make.right.mas_equalTo(0);
    }];
}

#pragma mark - 实现UItableviewDelegate&&UItableviewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.datasArray.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray *item = self.datasArray[section];
    return item.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    KKAddressBookTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:NSStringFromClass([KKAddressBookTableViewCell class])];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    NSArray *item = self.datasArray[indexPath.section];
    KKAddressBookModel *cellModel = item[indexPath.row];
    //
    cell.headImg.image = [UIImage imageNamed:cellModel.imgName];
    cell.userName.text = cellModel.userName;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //选中的cell响应点击事件
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];

}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return AdaptedWidth(50);
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return AdaptedWidth(25);
    }else{
        return 0.01;
    };
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return AdaptedWidth(20);
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return [[UIView alloc] initWithFrame:CGRectZero];
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return [[UIView alloc]initWithFrame:CGRectZero];
}
#pragma mark - 懒加载
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.showsHorizontalScrollIndicator = NO;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.backgroundColor = RGBColorHex(f0f0f0);
        //注册cell
        [_tableView registerClass:[KKAddressBookTableViewCell class] forCellReuseIdentifier:NSStringFromClass([KKAddressBookTableViewCell class])];
    }
    return _tableView;
}

- (NSArray *)datasArray{
    if (!_datasArray) {
        _datasArray = @[
            @[
                [KKAddressBookModel modelWithName:@"康康" img:@"AddressBook_headImg1"],
                [KKAddressBookModel modelWithName:@"康康" img:@"AddressBook_headImg2"],
                [KKAddressBookModel modelWithName:@"康康" img:@"AddressBook_headImg3"],
                [KKAddressBookModel modelWithName:@"康康" img:@"AddressBook_headImg4"],
                [KKAddressBookModel modelWithName:@"康康" img:@"AddressBook_headImg5"],
                [KKAddressBookModel modelWithName:@"康康" img:@"AddressBook_headImg1"],
                [KKAddressBookModel modelWithName:@"康康" img:@"AddressBook_headImg3"],
                [KKAddressBookModel modelWithName:@"康康" img:@"AddressBook_headImg4"],
            ],
            @[
                [KKAddressBookModel modelWithName:@"康康" img:@"AddressBook_headImg1"],
                [KKAddressBookModel modelWithName:@"康康" img:@"AddressBook_headImg2"],
                [KKAddressBookModel modelWithName:@"康康" img:@"AddressBook_headImg3"],
                [KKAddressBookModel modelWithName:@"康康" img:@"AddressBook_headImg4"],
                [KKAddressBookModel modelWithName:@"康康" img:@"AddressBook_headImg5"],
                [KKAddressBookModel modelWithName:@"康康" img:@"AddressBook_headImg1"],
                [KKAddressBookModel modelWithName:@"康康" img:@"AddressBook_headImg3"],
                [KKAddressBookModel modelWithName:@"康康" img:@"AddressBook_headImg4"],
            ],
            @[
                [KKAddressBookModel modelWithName:@"康康" img:@"AddressBook_headImg1"],
                [KKAddressBookModel modelWithName:@"康康" img:@"AddressBook_headImg2"],
                [KKAddressBookModel modelWithName:@"康康" img:@"AddressBook_headImg3"],
                [KKAddressBookModel modelWithName:@"康康" img:@"AddressBook_headImg4"],
                [KKAddressBookModel modelWithName:@"康康" img:@"AddressBook_headImg5"],
                [KKAddressBookModel modelWithName:@"康康" img:@"AddressBook_headImg1"],
                [KKAddressBookModel modelWithName:@"康康" img:@"AddressBook_headImg3"],
                [KKAddressBookModel modelWithName:@"康康" img:@"AddressBook_headImg4"],
            ],
        
        ];
    }
    return _datasArray;

}


@end
