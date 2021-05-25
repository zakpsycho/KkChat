//
//  KKFindViewController.m
//  KkChat
//
//  Created by 张安康 on 2021/5/25.
//

#import "KKFindViewController.h"

//视图类
#import "KKFindTableViewCell.h"

//数据模型类
#import "KKFindDataModel.h"

@interface KKFindViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)NSArray <NSArray <KKFindDataModel *>*>*datasArray;

@end

@implementation KKFindViewController

#pragma mark - view的生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"发现";
    self.view.backgroundColor = RGBColorHex(f0f0f0);
    [self customView];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    self.navigationController.navigationBar.barTintColor = RGBColorHex(f0f0f0);
}

#pragma mark - 填充UI
-(void)customView{
    [self.view addSubview:self.tableView];
    [self layoutSubview];
}
#pragma mark - 适配UI
- (void)layoutSubview{
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(Navigation_Bar_Height);
        make.left.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        make.right.mas_equalTo(0);
    }];
}

#pragma mark - 实现UItableviewdelegate && UItableviewdatasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.datasArray.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray *item = self.datasArray[section];
    return item.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    KKFindTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:NSStringFromClass([KKFindTableViewCell class])];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    NSArray *item = self.datasArray[indexPath.section];
    KKFindDataModel *cellModel =  item[indexPath.row];
    //模型赋值
    cell.leftLabel.text = cellModel.leftLabel;
    cell.leftImg.image = [UIImage imageNamed:cellModel.leftImg];
    cell.rightImg.image = [UIImage imageNamed:cellModel.rightImg];
    if (indexPath.section == 0) {
        cell.rightImg.hidden = NO;
    }else{
        cell.rightImg.hidden = YES;
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return AdaptedWidth(56);
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return AdaptedWidth(10);
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return [UIView new];
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return [UIView new];
}

#pragma mark - 实现懒加载
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.showsHorizontalScrollIndicator = NO;
        _tableView.backgroundColor = RGBColorHex(f0f0f0);
        //注册cell
        [_tableView registerClass:[KKFindTableViewCell class] forCellReuseIdentifier:NSStringFromClass([KKFindTableViewCell class])];
    }
    return _tableView;
    
}
- (NSArray<NSArray<KKFindDataModel *> *> *)datasArray{
    if (!_datasArray) {
        _datasArray = @[
                @[[KKFindDataModel modelWithLeftLabel:@"朋友圈" rightImg:@"AddressBook_headImg5" leftImg:@"Find_FirendCircle"]],
                @[[KKFindDataModel modelWithLeftLabel:@"扫一扫" rightImg:@"AddressBook_headImg5" leftImg:@"Find_checkCode"]]
        ];
    }
    return _datasArray;
}
@end
