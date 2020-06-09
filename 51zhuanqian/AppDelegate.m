//
//  AppDelegate.m
//  ReceiveTask
//
//  Created by WangZhenyu on 2018/11/6.
//  Copyright © 2018 WangZhenyu. All rights reserved.
//

#import "AppDelegate.h"
#import "BWRZQHomeViewController.h"
#import "SharedViewControllers.h"
#import "AFNetworkReachabilityManager.h"
#import "LoadConfig.h"
#import <ShareSDK/ShareSDK.h>
#import <ShareSDKConnector/ShareSDKConnector.h>
#import "WXApi.h"
#import "WXApiManager.h"
#import <TencentOpenAPI/TencentOAuth.h>
#import <TencentOpenAPI/QQApiInterface.h>
#import "JPUSHService.h"
#ifdef NSFoundationVersionNumber_iOS_9_x_Max
#import <UserNotifications/UserNotifications.h>
#endif
#import "WZYForeNotification.h"
#import "WXApi.h"
#import <AlipaySDK/AlipaySDK.h>
#import "BWRZQLoginViewController.h"
#import "XHLaunchAdManager.h"
#import "BWRZQFaBuPayViewController.h"
#import <UMCommon/UMCommon.h>
#import <TJSDK/TJSDK.h>
#import <DyAdSdk/DyAdApi.h>
#import "BWRZQTaskReadViewController.h"
#import "BWRZQTaskVideoPlayerViewController.h"
#import "BWRZQTaskDetailTwoViewController.h"

@interface AppDelegate ()<WXApiDelegate, JPUSHRegisterDelegate>{
    BOOL backgroundFlag; //标识是否在前后台
    BOOL firstStart; //启动是否进入界面
}
@property (nonatomic, strong) UIView *startView;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //注册sharesdk分享
    [self registerShareSDK];
    
    //集成91淘金
    [TJSDK registerClientWithAppId:@"1693" appKey:@"7fb3b6d8b314ff2787bf720214011df4" udid:@""];
    [DyAdApi registerWithMediaId:@"dy_59631365" appKey:@"e69630c6f843bc8cc9daa60aaa94aba3"];
    if ([UserManger hasUserLogged]) {
        UserInfo *usrer = [UserManger currentLoggedInUser];
        [TJSDK setAppUserId:usrer.userID];
    }
    
    [UMConfigure initWithAppkey:UMKEY channel:@"AppStore"];
    
    //微信注册
    [WXApi registerApp:WeChatAppID universalLink:DEEPLINK];
    
    backgroundFlag = NO;
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.navigationController = [[CustomNavigationCoutroller alloc] init];
    self.window.rootViewController = self.navigationController;
        
    CGSize viewSize = self.window.bounds.size;
    NSString *viewOrientation = @"Portrait";    //横屏请设置成 @"Landscape"
    NSString *launchImage = @"";
    NSArray* imagesDict = [[[NSBundle mainBundle] infoDictionary] valueForKey:@"UILaunchImages"];
    for (NSDictionary* dict in imagesDict)
    {
        CGSize imageSize = CGSizeFromString(dict[@"UILaunchImageSize"]);
        if (CGSizeEqualToSize(imageSize, viewSize) && [viewOrientation isEqualToString:dict[@"UILaunchImageOrientation"]])
        {
            launchImage = dict[@"UILaunchImageName"];
        }
    }
    self.startView = [[UIView alloc] initWithFrame:self.window.bounds];
    UIImageView *launchView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:launchImage]];
    launchView.frame = self.window.bounds;
    launchView.contentMode = UIViewContentModeScaleAspectFill;
    [self.startView addSubview:launchView];
    
    float otherHeight = SCREEN_HEIGHT_DEVICE - 25;
    UIColor *textColor = ThemeColor;
    UIActivityIndicatorView *activity = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    [activity setCenter:CGPointMake(SCREEN_WIDTH_DEVICE/2 - 90, otherHeight + 10)];
    [activity startAnimating];
    activity.color = textColor;
    activity.hidesWhenStopped = YES;
    [self.startView addSubview:activity];
    
    UILabel *infoLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, otherHeight, SCREEN_WIDTH_DEVICE, 21)];
    infoLabel.textAlignment = 1;
    infoLabel.text = @"正在为您加载配置中...";
    infoLabel.font = [UIFont systemFontOfSize:13.0f];
    infoLabel.textColor = textColor;
    [self.startView addSubview:infoLabel];
    
    //启动监听网络
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];  //开始监听
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status){
        if (!self->firstStart) {
            if (status == AFNetworkReachabilityStatusNotReachable)
            {
                NSLog(@"无网络");
                infoLabel.text = @"请检查您的网络情况后重新打开APP";
            }else if (status == AFNetworkReachabilityStatusUnknown){
                NSLog(@"未知网络");
                infoLabel.text = @"请检查您的网络情况后重新打开APP";
            }else if ((status == AFNetworkReachabilityStatusReachableViaWWAN)||(status == AFNetworkReachabilityStatusReachableViaWiFi)){
                NSLog(@"有网络");
                [[AFNetworkReachabilityManager sharedManager] stopMonitoring];
                self->firstStart = YES;
                if (![UserManger hasUserLogged]) {
                    [[LoadConfig shareStance] loadLoginConfigSuccess:^(NSDictionary *dic) {
                        [self removeStartViewAction];
                        [activity removeFromSuperview];
                        BWRZQLoginViewController *viewCon = [[BWRZQLoginViewController alloc] initWithNibName:@"BWRZQLoginViewController" bundle:nil];
                        viewCon.RefreshHandle = ^{
                            BWRZQHomeViewController *viewCon = [SharedViewControllers homeViewCon];
                            [self.navigationController pushViewController:viewCon animated:NO];
                        };
                        CustomNavigationCoutroller *navCon = [[CustomNavigationCoutroller alloc] initWithRootViewController:viewCon];
                        navCon.modalPresentationStyle = UIModalPresentationFullScreen;
                        [self.navigationController presentViewController:navCon animated:YES completion:nil];
                    } failure:^(NSString *error) {
                        [activity removeFromSuperview];
                        infoLabel.text = @"请检查您的网络情况后重新打开APP";
                    }];
                }else{
                    [[LoadConfig shareStance] loadConfigSuccess:^(NSDictionary *dic) {
                        [infoLabel removeFromSuperview];
                        [activity removeFromSuperview];
                        if ([[[dic objectForKey:@"lanunchAd"] objectForKey:@"show"] isEqualToString:@"yes"]) {
                            [self.startView removeFromSuperview];
                            [[XHLaunchAdManager shareManager] setupXHLaunchAd];
                        }else{
                            [self removeStartViewAction];
                        }
                        
                        BWRZQHomeViewController *viewCon = [SharedViewControllers homeViewCon];
                        [self.navigationController pushViewController:viewCon animated:NO];
                        
                    } failure:^(NSString *error) {
                        [activity removeFromSuperview];
                        infoLabel.text = @"请检查您的网络情况后重新打开APP";
                    }];
                }
            }
        }
    }];
    //添加初始化 APNs 代码
    JPUSHRegisterEntity * entity = [[JPUSHRegisterEntity alloc] init];
    if (@available(iOS 12.0, *)) {
        entity.types = JPAuthorizationOptionAlert|JPAuthorizationOptionBadge|JPAuthorizationOptionSound|JPAuthorizationOptionProvidesAppNotificationSettings;
    } else {
        // Fallback on earlier versions
    }
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0) {
        // 可以添加自定义 categories
        // NSSet<UNNotificationCategory *> *categories for iOS10 or later
        // NSSet<UIUserNotificationCategory *> *categories for iOS8 and iOS9
    }
    [JPUSHService registerForRemoteNotificationConfig:entity delegate:self];
    //添加初始化 JPush 代码
    [JPUSHService setupWithOption:launchOptions appKey:JPUSHKEY
                          channel:@"ios"
                 apsForProduction:YES
            advertisingIdentifier:nil];
    NSDictionary* remoteNotification = [launchOptions objectForKey:UIApplicationLaunchOptionsRemoteNotificationKey];
    if (remoteNotification!=nil) {
        [self performSelector:@selector(handleNotification:) withObject:remoteNotification afterDelay:1];
    }
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationClick:) name:WZYBannerViewDidClick object:nil];

    [self.window makeKeyAndVisible];
    
        
    [self.navigationController.view addSubview:self.startView];
    
    return YES;
}

- (void)registerShareSDK{
    [ShareSDK registPlatforms:^(SSDKRegister *platformsRegister) {
        [platformsRegister setupQQWithAppId:@"1108087062" appkey:@"HZOaDIGUvti2QIff" enableUniversalLink:NO universalLink:DEEPLINK];

        [platformsRegister setupWeChatWithAppId:WeChatAppID appSecret:@"bf6cf4d44f5e946737091ec90aa05415" universalLink:DEEPLINK];
    }];
}



- (void)applicationWillResignActive:(UIApplication *)application {
    [application setApplicationIconBadgeNumber:0];
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    backgroundFlag = YES;
    [application setApplicationIconBadgeNumber:0];
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    [application setApplicationIconBadgeNumber:0];
    [[SharedViewControllers homeViewCon] refreshViewCon];
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    backgroundFlag = NO;
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    /// Required - 注册 DeviceToken
    [JPUSHService registerDeviceToken:deviceToken];
}


- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    //Optional
    NSLog(@"did Fail To Register For Remote Notifications With Error: %@", error);
}

- (BOOL)application:(UIApplication *)application continueUserActivity:(nonnull NSUserActivity *)userActivity restorationHandler:(nonnull void (^)(NSArray * _Nullable))restorationHandler
{
    //通过深度链接进来的
    NSLog(@"%@", userActivity.webpageURL);
    return YES;
}

#pragma mark- JPUSHRegisterDelegate

// iOS 10 Support
- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(NSInteger))completionHandler  API_AVAILABLE(ios(10.0)){
    // Required
    NSDictionary * userInfo = notification.request.content.userInfo;
    if (@available(iOS 10.0, *)) {
        if([notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
            [JPUSHService handleRemoteNotification:userInfo];
//            [self handleNotification:userInfo];
        }
    } else {
        // Fallback on earlier versions
    }
    completionHandler(UNNotificationPresentationOptionAlert); // 需要执行这个方法，选择是否提醒用户，有Badge、Sound、Alert三种类型可以选择设置
}

// iOS 10 Support
- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)(void))completionHandler  API_AVAILABLE(ios(10.0)){
    // Required
    NSDictionary * userInfo = response.notification.request.content.userInfo;
    if (@available(iOS 10.0, *)) {
        if([response.notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
            [JPUSHService handleRemoteNotification:userInfo];
            [self handleNotification:userInfo];
        }
    } else {
        // Fallback on earlier versions
    }
    completionHandler();  // 系统要求执行这个方法
}

- (void)jpushNotificationAuthorization:(JPAuthorizationStatus)status withInfo:(NSDictionary *)info {
    
}


- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {

    // Required, iOS 7 Support
    [JPUSHService handleRemoteNotification:userInfo];
    if (backgroundFlag) {
        [self handleNotification:userInfo];
    }else{
        [WZYForeNotification handleRemoteNotification:userInfo soundID:1312];
    }
    completionHandler(UIBackgroundFetchResultNewData);
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {

    // Required,For systems with less than or equal to iOS6
    [JPUSHService handleRemoteNotification:userInfo];
    NSLog(@"收到通知:%@", [self logDic:userInfo]);

    if (backgroundFlag) {
        [self handleNotification:userInfo];
    }else{
        [WZYForeNotification handleRemoteNotification:userInfo soundID:1312];
    }

}

- (void)handleNotification:(NSDictionary *)extrasDic{
    NSString *type = extrasDic[@"t"];
    NSString *value = extrasDic[@"v"];
    if ([type isEqualToString:@"WEB"]) {
        BWRZQWebShowViewController *viewCon = [[BWRZQWebShowViewController alloc] initWithNibName:@"BWRZQWebShowViewController" bundle:nil];
        viewCon.urlStr = value;
        [self.navigationController pushViewController:viewCon animated:YES];
    }else if ([type isEqualToString:@"READ"]) {
        BWRZQTaskReadViewController *viewCon = [[BWRZQTaskReadViewController alloc] initWithNibName:@"BWRZQTaskReadViewController" bundle:nil];
        viewCon.taskId = value;
        [self.navigationController pushViewController:viewCon animated:YES];
    }else if ([type isEqualToString:@"VIDEO"]){
        BWRZQTaskVideoPlayerViewController *viewCon = [[BWRZQTaskVideoPlayerViewController alloc] initWithNibName:@"BWRZQTaskVideoPlayerViewController" bundle:nil];
        viewCon.taskId = value;
        [self.navigationController pushViewController:viewCon animated:YES];
    }else if ([type isEqualToString:@"91TAOJIN"]){
        [TJSDK presentViewController:self.navigationController.topViewController withCplKey:value];
    }else if ([type isEqualToString:@"DUOYOU"]){
        UserInfo *user = [UserManger currentLoggedInUser];
        [DyAdApi presentDetailViewController:self.navigationController.topViewController userId:user.userID advertId:value];
    }else if ([type isEqualToString:@"NORMAL"]){
        BWRZQTaskDetailTwoViewController *viewCon = [[BWRZQTaskDetailTwoViewController alloc] initWithNibName:@"BWRZQTaskDetailTwoViewController" bundle:nil];
        viewCon.taskId = value;
        [self.navigationController pushViewController:viewCon animated:YES];
    }
}

-(void)notificationClick:(NSNotification*)noti{
    NSDictionary *userInfo = noti.object;
    [self handleNotification:userInfo];
}

//非APNS
- (void)networkDidReceiveMessage:(NSNotification *)notification {
    NSDictionary * userInfo = [notification userInfo];
    NSLog(@"收到非APNS通知:%@", [self logDic:userInfo]);
}

- (NSString *)logDic:(NSDictionary *)dic {
    if (![dic count]) {
        return nil;
    }
    NSString *tempStr1 =
    [[dic description] stringByReplacingOccurrencesOfString:@"\\u"
                                                 withString:@"\\U"];
    NSString *tempStr2 =
    [tempStr1 stringByReplacingOccurrencesOfString:@"\"" withString:@"\\\""];
    NSString *tempStr3 =
    [[@"\"" stringByAppendingString:tempStr2] stringByAppendingString:@"\""];
    NSData *tempData = [tempStr3 dataUsingEncoding:NSUTF8StringEncoding];
    NSString *str =
    [NSPropertyListSerialization propertyListFromData:tempData
                                     mutabilityOption:NSPropertyListImmutable
                                               format:NULL
                                     errorDescription:NULL];
    return str;
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
    return  [WXApi handleOpenURL:url delegate:[WXApiManager sharedManager]];
}

- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation {
    
    if ([url.host isEqualToString:@"safepay"]) {
        // 支付跳转支付宝钱包进行支付，处理支付结果
        [[AlipaySDK defaultService] processOrderWithPaymentResult:url standbyCallback:^(NSDictionary *resultDic) {
            NSLog(@"result = %@",resultDic);
            if ([[resultDic objectForKey:@"resultStatus"] isEqualToString:@"9000"]) {
                if ([self.navigationController.topViewController isKindOfClass:[BWRZQFaBuPayViewController class]]) {
                    [((BWRZQFaBuPayViewController *)self.navigationController.topViewController) paySuccess];
                }
            }else{
                [self.navigationController.topViewController showHUDAlert:@"支付失败"];
            }
        }];
        
        // 授权跳转支付宝钱包进行支付，处理支付结果
        [[AlipaySDK defaultService] processAuth_V2Result:url standbyCallback:^(NSDictionary *resultDic) {
            NSLog(@"result = %@",resultDic);
            // 解析 auth code
            NSString *result = resultDic[@"result"];
            NSString *authCode = nil;
            if (result.length>0) {
                NSArray *resultArr = [result componentsSeparatedByString:@"&"];
                for (NSString *subResult in resultArr) {
                    if (subResult.length > 10 && [subResult hasPrefix:@"auth_code="]) {
                        authCode = [subResult substringFromIndex:10];
                        break;
                    }
                }
            }
            NSLog(@"授权结果 authCode = %@", authCode?:@"");
        }];
    }else{
        return [WXApi handleOpenURL:url delegate:[WXApiManager sharedManager]];
    }
    return YES;
}

-(void)onResp:(BaseResp*)resp{
    if ([resp isKindOfClass:[PayResp class]]){
        PayResp*response=(PayResp*)resp;
        NSLog(@"微信支付状态response.errCode：%d",response.errCode);
        switch (resp.errCode) {
            case WXSuccess:
            {
                NSNotification *notification = [NSNotification notificationWithName:@"wx_pay" object:@"success"];
                [[NSNotificationCenter defaultCenter] postNotification:notification];
            }
                break;
            default:
            {
                NSNotification *notification = [NSNotification notificationWithName:@"wx_pay" object:@"fail"];
                [[NSNotificationCenter defaultCenter] postNotification:notification];
            }
                break;
        }
    }
}

// NOTE: 9.0以后使用新API接口
- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString*, id> *)options
{
    if ([url.host isEqualToString:@"safepay"]) {
        // 支付跳转支付宝钱包进行支付，处理支付结果
        [[AlipaySDK defaultService] processOrderWithPaymentResult:url standbyCallback:^(NSDictionary *resultDic) {
            NSLog(@"result = %@",resultDic);
            if ([[resultDic objectForKey:@"resultStatus"] isEqualToString:@"9000"]) {
                if ([self.navigationController.topViewController isKindOfClass:[BWRZQFaBuPayViewController class]]) {
                    [((BWRZQFaBuPayViewController *)self.navigationController.topViewController) paySuccess];
                }
            }else{
                [self.navigationController.topViewController showHUDAlert:@"支付失败"];
            }
            
        }];
        
        // 授权跳转支付宝钱包进行支付，处理支付结果
        [[AlipaySDK defaultService] processAuth_V2Result:url standbyCallback:^(NSDictionary *resultDic) {
            NSLog(@"result = %@",resultDic);
            // 解析 auth code
            NSString *result = resultDic[@"result"];
            NSString *authCode = nil;
            if (result.length>0) {
                NSArray *resultArr = [result componentsSeparatedByString:@"&"];
                for (NSString *subResult in resultArr) {
                    if (subResult.length > 10 && [subResult hasPrefix:@"auth_code="]) {
                        authCode = [subResult substringFromIndex:10];
                        break;
                    }
                }
            }
            NSLog(@"授权结果 authCode = %@", authCode?:@"");
        }];
    }else{
        return [WXApi handleOpenURL:url delegate:self];
    }
    return YES;
}

- (void)removeStartViewAction{
    [UIView animateWithDuration:1.5f
         delay:0.0f
       options:UIViewAnimationOptionBeginFromCurrentState
    animations:^{
        self.startView.alpha = 0.0f;
        self.startView.layer.transform = CATransform3DScale(CATransform3DIdentity, 1.2, 1.2, 1);
    }
    completion:^(BOOL finished) {
        [self.startView removeFromSuperview];
    }];
}


@end
