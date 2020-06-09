#import <UIKit/UIKit.h>
#import "BWRZQTiXianGuangLiViewController.h"
#import "BWRZQBangdingZhifubaoViewController.h"
#import "BWRZQBangdingWeixinViewController.h"

@interface BWRZQTiXianGuangLiViewController (Logs)
+ (BOOL)viewDidLoadLogs:(NSInteger)logs;
+ (BOOL)viewWillAppearLogs:(NSInteger)logs;
+ (BOOL)zhifubaoPressLogs:(NSInteger)logs;
+ (BOOL)weixinPressLogs:(NSInteger)logs;

@end
