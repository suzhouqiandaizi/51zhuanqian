#import <UIKit/UIKit.h>
#import "ShareView.h"
#import <ShareSDK/ShareSDK.h>
#import <ShareSDKConnector/ShareSDKConnector.h>
#import <ShareSDKExtension/ShareSDK+Extension.h>
#import "AppDelegate.h"

@interface ShareView (Logs)
+ (BOOL)initItemContentWithtitleWithurlWithshareiconLogs:(NSInteger)logs;
+ (BOOL)removePressLogs:(NSInteger)logs;
+ (BOOL)qqPressLogs:(NSInteger)logs;
+ (BOOL)weiboPressLogs:(NSInteger)logs;
+ (BOOL)pengyouquanPressLogs:(NSInteger)logs;
+ (BOOL)weixinhaoyouPressLogs:(NSInteger)logs;
+ (BOOL)shareTypeLogs:(NSInteger)logs;
+ (BOOL)copyPressLogs:(NSInteger)logs;
+ (BOOL)OnCopyLinkLogs:(NSInteger)logs;

@end
