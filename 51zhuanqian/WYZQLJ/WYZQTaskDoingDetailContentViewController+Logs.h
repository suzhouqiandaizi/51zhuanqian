#import <UIKit/UIKit.h>
#import "WYZQTaskObject.h"
#import "WYZQTaskDoingDetailContentViewController.h"
#import "MIPhotoBrowser.h"
#import "GlobalFunction.h"
#import "WYZQFriendDetailViewController.h"
#import "WZYLabel.h"

@interface WYZQTaskDoingDetailContentViewController (Logs)
+ (BOOL)viewDidLoadLogs:(NSInteger)logs;
+ (BOOL)showContentLogs:(NSInteger)logs;
+ (BOOL)stepTapActionLogs:(NSInteger)logs;
+ (BOOL)requirementTapActionLogs:(NSInteger)logs;
+ (BOOL)photoBrowserPlaceholderimageforindexLogs:(NSInteger)logs;
+ (BOOL)lineCilicActionLogs:(NSInteger)logs;
+ (BOOL)guanzhuPressLogs:(NSInteger)logs;

@end
