#import <UIKit/UIKit.h>
#import "WYZQTaskDetailOneViewController.h"
#import "ShareView.h"
#import "GlobalFunction.h"
#import "MIPhotoBrowser.h"
#import "WYZQTaskButton.h"
#import "WYZQSubmitTaskViewController.h"
#import "WYZQFriendDetailViewController.h"
#import "WYZQTaskObject.h"
#import "WYZQReportViewController.h"
#import "UIActionSheet+Blocks.h"
#import "WZYLabel.h"
#import "LoadConfig.h"

@interface WYZQTaskDetailOneViewController (Logs)
+ (BOOL)viewDidLoadLogs:(NSInteger)logs;
+ (BOOL)deallocLogs:(NSInteger)logs;
+ (BOOL)requestContentLogs:(NSInteger)logs;
+ (BOOL)sharePressLogs:(NSInteger)logs;
+ (BOOL)guanzhuPressLogs:(NSInteger)logs;
+ (BOOL)taskButtonPressLogs:(NSInteger)logs;
+ (BOOL)refreshContentLogs:(NSInteger)logs;
+ (BOOL)stepTapActionLogs:(NSInteger)logs;
+ (BOOL)requirementTapActionLogs:(NSInteger)logs;
+ (BOOL)photoBrowserPlaceholderimageforindexLogs:(NSInteger)logs;
+ (BOOL)lineCilicActionLogs:(NSInteger)logs;

@end
