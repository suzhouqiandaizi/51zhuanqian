#import "SJViewControllerManagerDefines.h"
#import "SJFitOnScreenManagerDefines.h"
#import "SJRotationManagerDefines.h"
#import "SJControlLayerAppearManagerDefines.h"
#import "SJVideoPlayerPresentViewDefines.h"
#import "SJViewControllerManager.h"
#import "UIView+SJBaseVideoPlayerExtended.h"

@interface SJViewControllerManager (Logs)
+ (BOOL)prefersStatusBarHiddenLogs:(NSInteger)logs;
+ (BOOL)preferredStatusBarStyleLogs:(NSInteger)logs;
+ (BOOL)viewDidAppearLogs:(NSInteger)logs;
+ (BOOL)viewWillDisappearLogs:(NSInteger)logs;
+ (BOOL)viewDidDisappearLogs:(NSInteger)logs;
+ (BOOL)pushViewControllerAnimatedLogs:(NSInteger)logs;
+ (BOOL)showStatusBarLogs:(NSInteger)logs;
+ (BOOL)hiddenStatusBarLogs:(NSInteger)logs;
+ (BOOL)setNeedsStatusBarAppearanceUpdateLogs:(NSInteger)logs;

@end
