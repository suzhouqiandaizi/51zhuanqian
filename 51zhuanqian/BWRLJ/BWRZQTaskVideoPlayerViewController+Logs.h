#import <UIKit/UIKit.h>
#import "BWRZQTaskVideoPlayerViewController.h"
#import "SJVideoPlayer.h"
#import "Masonry.h"
#import "NSAttributedString+SJMake.h"
#import "CustomIOSAlertView.h"
#import "CustomInfoAlertView.h"

@interface BWRZQTaskVideoPlayerViewController (Logs)
+ (BOOL)navigationControllerWillshowviewcontrollerAnimatedLogs:(NSInteger)logs;
+ (BOOL)viewDidLoadLogs:(NSInteger)logs;
+ (BOOL)deallocLogs:(NSInteger)logs;
+ (BOOL)viewDidDisappearLogs:(NSInteger)logs;
+ (BOOL)viewWillDisappearLogs:(NSInteger)logs;
+ (BOOL)showContentLogs:(NSInteger)logs;
+ (BOOL)showContentPlayerLogs:(NSInteger)logs;
+ (BOOL)requestHasReadLogs:(NSInteger)logs;
+ (BOOL)goBackActionLogs:(NSInteger)logs;
+ (BOOL)shengyinPressLogs:(NSInteger)logs;
+ (BOOL)infoBtnPressLogs:(NSInteger)logs;
+ (BOOL)prefersStatusBarHiddenLogs:(NSInteger)logs;
+ (BOOL)prefersHomeIndicatorAutoHiddenLogs:(NSInteger)logs;

@end
