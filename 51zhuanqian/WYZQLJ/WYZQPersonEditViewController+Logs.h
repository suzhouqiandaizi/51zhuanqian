#import <UIKit/UIKit.h>
#import "WYZQPersonEditViewController.h"

@interface WYZQPersonEditViewController (Logs)
+ (BOOL)viewDidLoadLogs:(NSInteger)logs;
+ (BOOL)viewDidAppearLogs:(NSInteger)logs;
+ (BOOL)deallocLogs:(NSInteger)logs;
+ (BOOL)cancelPressLogs:(NSInteger)logs;
+ (BOOL)finishPressLogs:(NSInteger)logs;

@end
