//
//  Defines.h
//
//  Created by ZhenYu.W on 15/8/20.
//  Copyright (c) 2015年 unshu.com. All rights reserved.
//
///存在缓存数据

#ifdef DEBUG
// 调试时改变NSLog方法，输出时间、方法名、行数、输入的内容
#define NSLog(format, ...) printf("\n[%s] %s [第%d行] %s\n", __TIME__, __FUNCTION__, __LINE__, [[NSString stringWithFormat:format, ## __VA_ARGS__] UTF8String]);
#else
#define NSLog(format, ...)
#endif

#define Publication_CacheData_Directory [NSHomeDirectory() stringByAppendingPathComponent:@"Library/Caches/CacheData"]

#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
#define RGB(r,g,b)          [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]

#define ThemeColor      [UIColor colorWithRed:255.0/255 green:73.0/255 blue:116.0/255 alpha:1]
#define TextColor      [UIColor colorWithRed:45.0/255 green:45.0/255 blue:45.0/255 alpha:1]
#define ContentTextColor      [UIColor colorWithRed:121.0/255 green:126.0/255 blue:133.0/255 alpha:1]
#define TextLightColor      [UIColor colorWithRed:95.0/255 green:95.0/255 blue:95.0/255 alpha:1]
#define TextGrayColor      [UIColor colorWithRed:162.0/255 green:162.0/255 blue:162.0/255 alpha:1]
#define LineColor      [UIColor colorWithRed:226.0/255.0 green:226.0/255.0 blue:226.0/255.0 alpha:1]
#define TabBarBackgroundColor      [UIColor colorWithRed:245.0/255.0 green:247.0/255.0 blue:250.0/255.0 alpha:1]
#define ViewBackgroundColor      [UIColor colorWithRed:249.0/255.0 green:249.0/255.0 blue:249.0/255.0 alpha:1]
#define LineBackgroundColor      [UIColor colorWithRed:245.0/255.0 green:247.0/255.0 blue:250.0/255.0 alpha:1]
#define BlueColor      [UIColor colorWithRed:29.0/255.0 green:139.0/255.0 blue:254.0/255.0 alpha:1]
#define DisableColor      [UIColor colorWithRed:186.0/255.0 green:191.0/255.0 blue:198.0/255.0 alpha:1]
#define PlaceholderColor RGBACOLOR(0, 0, 0.0980392, 0.22)
#define PlaceholderImage [UIImage imageNamed:@"placeholderImage"]

#define DEFAULTS        [NSUserDefaults standardUserDefaults]
#define SYSTEM_CONFIG               @"SYSTEM_CONFIG"

#define SCREEN_WIDTH_DEVICE ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT_DEVICE ([UIScreen mainScreen].bounds.size.height)
#define SCREEN_SCALE (float)([UIScreen mainScreen].bounds.size.width/375.0)
#define SCREEN_SCALE_320 (float)([UIScreen mainScreen].bounds.size.width/320.0)

#define LOADINGINTO @"正在加载"
#define ISNONETWORK @"请检查网络连接"
#define ISBADNETWORK @"网络不佳"
#define ISSERVIECCRASH @"服务器正在维护"
#define TIMEOUTINFO @"请求超时，请重试"
#define USERID                      @"USERID"
#define H5CONTENT                   @"H5CONTENT"

#define APPLEID @"1517336735"
#define HOSTH5 @"http://winner.shangjinxia.ltd"
#define HOSTURL @"http://www.shangjinxia.ltd"
#define HOSTIP [UserManger getServerUrl]
#define UMKEY @"5edda6200cafb2e1890001e5"
#define JPUSHKEY @"2aed5b8f4a2f1f0fed7d1501"
#define WeChatAppID @"wx56dd954d69cfff32"
#define SHARECONTENT @"让你充分利用自己的闲暇时间,做悬赏任务、兼职工作等，随时随地想赚就能赚!让自己每月不缺零花钱!"
#define SHARETITLE @"51赚钱一款手机在线赚赏金赚兼职互助平台"
#define SHAREAPPURL @"http://www.shangjinxia.ltd/app_51zhuanqian/invite/index.html"
#define DEEPLINK @"https://ueic1.share2dlink.com/"
//商户号，填写商户对应参数
#define WeChatMCH_ID                  @"1495457402"
//商户API密钥，填写相应参数
#define WeChatPARTNER_ID              @""
//支付结果回调页面
#define WeChatNOTIFY_URL              @""


#define IOS8_OR_LATER   ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0) ? (YES):(NO)
//判断ios7
#define IOS7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
#define IOS11_OR_LATER   ([[[UIDevice currentDevice] systemVersion] floatValue] >= 11.0) ? (YES):(NO)

//应用信息和下载地址
#define APPIDURL   @"https://itunes.apple.com/us/app/%E5%A6%82%E6%9D%A5%E6%8A%A2%E5%8D%95/id1217364194?l=zh&ls=1&mt=8" //appStroe获取该应用信息地址
#define IPHONE4 ([[[UIDeviceHardware share]deviceName]isEqualToString:@"iPhone 4"]
#define CLIENT_VERSION [[[NSBundle mainBundle] infoDictionary]objectForKey:@"CFBundleVersion"]
#define IS_IPHONE_5 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )
#define IPHONE_X \
({BOOL isPhoneX = NO;\
if (@available(iOS 11.0, *)) {\
isPhoneX = [[UIApplication sharedApplication] delegate].window.safeAreaInsets.bottom > 0.0;\
}\
(isPhoneX);})
#define IS_iPhoneX_Top (float)(IPHONE_X ? (24):(0))
#define IS_iPhoneX_Bottom (float)(IPHONE_X ? (34):(0))
#define CURRENT_DEVICE_IS_IPAD UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad
#define CURRENT_DEVICE_IS_IPHONE UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone
//#endif


