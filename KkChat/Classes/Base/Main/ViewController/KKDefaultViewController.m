//
//  KKDefaultViewController.m
//  KkChat
//
//  Created by 张安康 on 2021/5/21.
//

#import "KKDefaultViewController.h"
#import "KKChatViewController.h" //聊天页面
#import "KKAddressBookViewController.h" //通讯录页面
#import "KKFindViewController.h"//发现页面
#import "KKMineViewController.h" //我的页面


@interface KKDefaultViewController ()

@end

@implementation KKDefaultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createTabbarVc];
    //隐藏tabbar顶部线条 设置背景颜色
    if(@available(iOS 13.0,* )){
        UITabBarAppearance *appeaRance = [[UITabBarAppearance alloc] init];
        appeaRance.shadowColor = [UIColor clearColor];
        appeaRance.backgroundColor = [UIColor whiteColor];
        [self.tabBar setStandardAppearance:appeaRance];
    }else{
        //去除top线
        self.tabBar.shadowImage = [UIImage new];
        self.tabBar.backgroundImage = [UIImage new];
        self.tabBar.backgroundColor = [UIColor whiteColor];
    }
}

#pragma mark - 封装Tabbar
/// 添加一个控制器
/// @param childVc 控制器对象
/// @param title 标题
/// @param imageName 图标
/// @param selectedImageName 选中图标
-(void)addTheChildVc:(UIViewController *)childVc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName{
    childVc.title = title;
    //设置UIimage的渲染模式 始终绘制图片的原始状态（不使用tint color）
    childVc.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    //适配iOS13 导致的BUG
    if(@available (iOS 13.0,*)){
        //iOS13以上
        //正常状态 NSFontAttributeName ：文字属性字典
        self.tabBar.unselectedItemTintColor = RGBColorHex(999999);//0BC9DD
        NSMutableDictionary *normAtts = [NSMutableDictionary dictionary];
        normAtts[NSFontAttributeName] = [UIFont fontWithName:@"PingFang SC" size:11];
        [childVc.tabBarItem setTitleTextAttributes:normAtts forState:UIControlStateNormal];//更改字体样式
        
        //选中状态
        self.tabBar.tintColor = RGBColorHex(0BC9DD);
        NSMutableDictionary *selectAtts = [NSMutableDictionary dictionary];
        selectAtts[NSFontAttributeName] = [UIFont fontWithName:@"PingFang SC" size:11];
        [childVc.tabBarItem setTitleTextAttributes:selectAtts forState:UIControlStateSelected];
    }else{
        //iOS13以下
        //正常状态
        NSMutableDictionary *normaAtts = [NSMutableDictionary dictionary];
        normaAtts[NSFontAttributeName] = [UIFont fontWithName:@"PingFang SC" size:11];
        normaAtts[NSForegroundColorAttributeName] = RGBColorHex(999999);//设置文字颜色
        [childVc.tabBarItem setTitleTextAttributes:normaAtts forState:UIControlStateNormal];//默认状态
        
        //选中状态
        NSMutableDictionary *selectAtts = [NSMutableDictionary dictionary];
        selectAtts[NSFontAttributeName] = [UIFont fontWithName:@"PingFang SC" size:11];
        selectAtts[NSForegroundColorAttributeName] = RGBColorHex(0BC9DD);
        [childVc.tabBarItem setTitleTextAttributes:selectAtts forState:UIControlStateSelected];
    }
    //设置navigation层级视图
    UINavigationController *navVc = [[UINavigationController alloc] initWithRootViewController:childVc];
    [self addChildViewController:navVc];
}



#pragma mark - 创建TabbarVc
-(void)createTabbarVc{
    KKChatViewController *chatVc = [[KKChatViewController alloc] init];
    [self addTheChildVc:chatVc title:@"k信" imageName:@"1" selectedImageName:@"1"];
    
    KKAddressBookViewController *addressBookVc = [[KKAddressBookViewController alloc] init];
    [self addTheChildVc:addressBookVc title:@"通讯录" imageName:@"1" selectedImageName:@"1"];
    
    KKFindViewController *findVc =[[KKFindViewController alloc] init];
    [self addTheChildVc:findVc title:@"发现" imageName:@"1" selectedImageName:@"1"];
    
    KKMineViewController *mineVc = [[KKMineViewController alloc] init];
    [self addTheChildVc:mineVc title:@"我" imageName:@"1" selectedImageName:@"1"];
}

@end
