//
//  KKMineViewController.m
//  KkChat
//
//  Created by 张安康 on 2021/5/21.
//

#import "KKMineViewController.h"

//数据类
#import "KKMineCellDataModel.h"

//视图类
#import "KKMineHeaderView.h"
#import "KKMineTableViewCell.h"

@interface KKMineViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)KKMineHeaderView *headerView;
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)NSArray <NSArray <KKMineCellDataModel *>*> *datasArray;

@end

@implementation KKMineViewController

#pragma mark - view生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = KWhiteColor;
    [self customView];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setHidden:YES];
}
#pragma mark - 填充UI
-(void)customView{
    [self.view addSubview:self.tableView];
    [self layoutSubview];
}

#pragma mark - 适配UI
-(void)layoutSubview{
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(Status_Bar_Height());
        make.left.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        make.right.mas_equalTo(0);
    }];
}

#pragma mark - 实现uitableviewDelegate && UItableviewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.datasArray.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray *item = self.datasArray[section];
    return item.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    KKMineTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:NSStringFromClass([KKMineTableViewCell class])];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    NSArray *item = self.datasArray[indexPath.section];
    KKMineCellDataModel *cellModel = item[indexPath.row];
    //取模型值
    cell.leftLabel.text = cellModel.leftLabel;
    cell.leftImg.image = [UIImage imageNamed:cellModel.imgName];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //选中的cell响应点击事件
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return AdaptedWidth(46);
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return AdaptedWidth(10);
    }else{
        return 0.01;
    };
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return AdaptedWidth(10);
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return [[UIView alloc] initWithFrame:CGRectZero];
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return [[UIView alloc] initWithFrame:CGRectZero];
}

#pragma mark - 懒加载
- (KKMineHeaderView *)headerView{
    if (!_headerView) {
        _headerView = [[KKMineHeaderView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, AdaptedWidth(150))];
        _headerView.backgroundColor = KWhiteColor;
    }
    return _headerView;
}
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.showsHorizontalScrollIndicator = NO;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.tableHeaderView = self.headerView;
        _tableView.backgroundColor = RGBColorHex(f0f0f0);
        //注册cell
        [_tableView registerClass:[KKMineTableViewCell class] forCellReuseIdentifier:NSStringFromClass([KKMineTableViewCell class])];
    }
    return _tableView;
}
- (NSArray<NSArray<KKMineCellDataModel *> *> *)datasArray{
    if (!_datasArray) {
        _datasArray = @[
            @[[KKMineCellDataModel modelWithleftLabel:@"设置" imgName:@"Mine_setUp"]],
            @[[KKMineCellDataModel modelWithleftLabel:@"朋友圈" imgName:@"Mine_friendCircle"]]
        ];
    }
    return _datasArray;
}
@end
