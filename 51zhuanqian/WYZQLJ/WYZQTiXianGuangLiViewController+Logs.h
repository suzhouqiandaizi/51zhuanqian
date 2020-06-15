#import <UIKit/UIKit.h>
#import "WYZQTiXianGuangLiViewController.h"
#import "WYZQBangdingZhifubaoViewController.h"
#import "WYZQBangdingWeixinViewController.h"

@interface WYZQTiXianGuangLiViewController (Logs)
+ (BOOL)viewDidLoadLogs:(NSInteger)logs;
+ (BOOL)viewWillAppearLogs:(NSInteger)logs;
+ (BOOL)zhifubaoPressLogs:(NSInteger)logs;
+ (BOOL)weixinPressLogs:(NSInteger)logs;

@end
