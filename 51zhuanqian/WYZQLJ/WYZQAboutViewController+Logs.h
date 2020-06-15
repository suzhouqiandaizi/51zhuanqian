#import <UIKit/UIKit.h>
#import "WYZQAboutViewController.h"
#import "LoadConfig.h"
#import "WZYLabel.h"

@interface WYZQAboutViewController (Logs)
+ (BOOL)viewDidLoadLogs:(NSInteger)logs;
+ (BOOL)handleTapLogs:(NSInteger)logs;
+ (BOOL)showContentLogs:(NSInteger)logs;

@end
