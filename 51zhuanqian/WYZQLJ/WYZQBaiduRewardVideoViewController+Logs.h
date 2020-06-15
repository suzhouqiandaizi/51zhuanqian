#import <UIKit/UIKit.h>
#import "WYZQBaiduRewardVideoViewController.h"
#import <BaiduMobAdSDK/BaiduMobAdRewardVideo.h>

@interface WYZQBaiduRewardVideoViewController (Logs)
+ (BOOL)navigationControllerWillshowviewcontrollerAnimatedLogs:(NSInteger)logs;
+ (BOOL)viewDidLoadLogs:(NSInteger)logs;
+ (BOOL)viewWillDisappearLogs:(NSInteger)logs;
+ (BOOL)customBackActionPressLogs:(NSInteger)logs;
+ (BOOL)refreshPressLogs:(NSInteger)logs;
+ (BOOL)showVideoPressLogs:(NSInteger)logs;
+ (BOOL)deallocLogs:(NSInteger)logs;
+ (BOOL)prefersHomeIndicatorAutoHiddenLogs:(NSInteger)logs;
+ (BOOL)preloadLogs:(NSInteger)logs;
+ (BOOL)isExpireLogs:(NSInteger)logs;
+ (BOOL)showClickLogs:(NSInteger)logs;
+ (BOOL)confirmActionLogs:(NSInteger)logs;
+ (BOOL)rewardedVideoAdLoadedLogs:(NSInteger)logs;
+ (BOOL)rewardedVideoAdLoadFailedWitherrorLogs:(NSInteger)logs;
+ (BOOL)rewardedVideoAdShowFailedWitherrorLogs:(NSInteger)logs;
+ (BOOL)rewardedVideoAdDidStartedLogs:(NSInteger)logs;
+ (BOOL)rewardedVideoAdDidPlayFinishLogs:(NSInteger)logs;
+ (BOOL)rewardedVideoAdDidClickWithplayingprogressLogs:(NSInteger)logs;
+ (BOOL)rewardedVideoAdDidCloseWithplayingprogressLogs:(NSInteger)logs;

@end
