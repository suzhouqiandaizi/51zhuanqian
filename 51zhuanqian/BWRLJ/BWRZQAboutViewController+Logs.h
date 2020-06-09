#import <UIKit/UIKit.h>
#import "BWRZQAboutViewController.h"
#import "LoadConfig.h"
#import "WZYLabel.h"

@interface BWRZQAboutViewController (Logs)
+ (BOOL)viewDidLoadLogs:(NSInteger)logs;
+ (BOOL)handleTapLogs:(NSInteger)logs;
+ (BOOL)showContentLogs:(NSInteger)logs;

@end
