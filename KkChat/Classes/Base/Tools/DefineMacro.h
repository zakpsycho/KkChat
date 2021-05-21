//
//  DefineMacro.h
//  motoVPN2.0Demo
//
//  Created by 张安康 on 2021/1/8.
//

#ifndef DefineMacro_h
#define DefineMacro_h

//状态栏高度

//状态栏高度
NS_INLINE CGFloat Status_Bar_Height(){
    if (@available(iOS 11.0,*)) {
        UIWindow *mainView = [UIApplication sharedApplication].keyWindow;
        return mainView.safeAreaInsets.top;
    }else{
        return 20.0f;
    }
}

//导航栏高度
#define Navigation_Bar_Height 44.0f

//状态栏+导航栏高度
NS_INLINE CGFloat Status_And_Navigation_Height(){
    return Status_Bar_Height() + Navigation_Bar_Height;
}

//TabBar高度
#define TabBar_Height 49.0f

//底部安全区域高度34.0f
NS_INLINE CGFloat Bottom_Safe_Height(){
    if (@available(iOS 11.0,*)) {
        UIWindow *mainView = [UIApplication sharedApplication].keyWindow;
        return mainView.safeAreaInsets.bottom;
    }else{
        return 0.0f;
    }
}

//TabBar+安全区域高度
NS_INLINE CGFloat TabBar_And_Bottom_Safe_Height(){
    return Bottom_Safe_Height() + TabBar_Height;
}

//屏幕适配计算,用于Masonry布局页面，%百分比适配布局比例计算
#define RATIO_WIDHT750 [UIScreen mainScreen].bounds.size.width/375.0
#define RATIO_HEIGHT750 ([UIScreen mainScreen].bounds.size.height - Status_And_Navigation_Height() - TabBar_And_Bottom_Safe_Height())/(667.0-64-49)

//屏幕宽高
#define KScreenWidth [UIScreen mainScreen].bounds.size.width
#define KScreenHeight [UIScreen mainScreen].bounds.size.height

//  适配比例
#define ADAPTATIONRATIO     KScreenWidth / 750.0f

// 颜色
//十六进制颜色
#define RGBColorHex(s) [UIColor colorWithRed:(((0x##s & 0xFF0000) >> 16))/255.0 green:(((0x##s & 0x00FF00) >> 8))/255.0 blue:((0x##s & 0x0000FF))/255.0  alpha:1.0]
#define GKColorRGBA(r, g, b, a) [UIColor colorWithRed:(r / 255.0) green:(g / 255.0) blue:(b / 255.0) alpha:a]
#define GKColorRGB(r, g, b)     GKColorRGBA(r, g, b, 1.0)
#define GKColorGray(v)          GKColorRGB(v, v, v)


// 系统颜色
#define KBlackColor [UIColor blackColor]              //黑色
#define KDarkGrayColor [UIColor darkGrayColor]        //深灰色
#define KLightGrayColor [UIColor lightGrayColor]      //浅灰色
#define KWhiteColor [UIColor whiteColor]              //白色
#define KGrayColor [UIColor grayColor]                //灰色
#define KRedColor [UIColor redColor]                  //红色
#define KGreenColor [UIColor greenColor]              //绿色
#define KBlueColor [UIColor blueColor]                //蓝色
#define KCyanColor [UIColor cyanColor]                //青色
#define KYellowColor [UIColor yellowColor]            //黄色
#define KMagentaColor [UIColor magentaColor]          //洋红色或品红色
#define KOrangeColor [UIColor orangeColor]            //橙色
#define KPurpleColor [UIColor purpleColor]            //紫色
#define KBrownColor [UIColor brownColor]              //棕色
#define KClearColor [UIColor clearColor]              //透明色


//安全运行block
#define BLOCK_SAFE_RUN(block,...) block ? block(__VA_ARGS__) : nil;

/***** 测试模式下SHLog输出，生产模式下不再输出 ****/
#ifdef DEBUG
#define ILLog(format, ...) printf("class: <%p %s:(%d) > method: %s \n%s\n", self, [[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, __PRETTY_FUNCTION__, [[NSString stringWithFormat:(format), ##__VA_ARGS__] UTF8String] )
#else
#define ILLog(format, ...)
#endif


//状态栏颜色
NS_INLINE void setStatusBarLightContent(BOOL isNeedLight) {
    
    UIApplication * app = [UIApplication sharedApplication];
    if (isNeedLight) {
        if (app.statusBarStyle == UIStatusBarStyleDefault) {
            app.statusBarStyle = UIStatusBarStyleLightContent;
        }
    } else {
        if (app.statusBarStyle == UIStatusBarStyleLightContent) {
            app.statusBarStyle = UIStatusBarStyleDefault;
        }
    }
}

//国际化
#define NSLocString(key,comment) [[NSBundle mainBundle] localizedStringForKey:(key) value:@"" table:nil]

//字符串，数组或可变数组为空
#define kStringIsEmpty(string) ([string isEqual:@"NULL"] || [string isKindOfClass:[NSNull class]] || [string isEqual:[NSNull null]] || [string isEqual:NULL] || [[string class] isSubclassOfClass:[NSNull class]] || string == nil || string == NULL || [[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length]==0 || [string isEqualToString:@"<null>"] || [string isEqualToString:@"(null)"] ? YES : NO)

//字体适配
#define AdaptedFontSize(R)     [UIFont systemFontOfSize:AdaptedWidth(R)]
#define AdaptedBoldFontSize(R)  [UIFont boldSystemFontOfSize:AdaptedWidth(R)]

//适配大小
#define AdaptedWidth(x)  ceilf((x) * (IsPad?kPadScreenWidthRatio:kScreenWidthRatio))
#define AdaptedHeight(x) ceilf((x) * (IsPad?kPadScreenHeightRatio:kScreenHeightRatio))

#endif /* DefineMacro_h */
