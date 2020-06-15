#import <UIKit/UIKit.h>
#import "WYZQTaskDetailTwoViewController.h"
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
#import "WYZQFaBuBuZhouObject.h"
#import "UILabel+YBAttributeTextTapAction.h"
#import "WYZQFaBuSuccessViewController.h"
#import "LoadConfig.h"
#import "WYZQTaskDetailTwoAlertView.h"
#import "WYZQBaiduTaskReadViewController.h"

@interface WYZQTaskDetailTwoViewController (Logs)
+ (BOOL)viewDidLoadLogs:(NSInteger)logs;
+ (BOOL)deallocLogs:(NSInteger)logs;
+ (BOOL)requestContentLogs:(NSInteger)logs;
+ (BOOL)showBuZhouContentViewLogs:(NSInteger)logs;
+ (BOOL)guanzhuPressLogs:(NSInteger)logs;
+ (BOOL)stepTapActionLogs:(NSInteger)logs;
+ (BOOL)requirementTapActionLogs:(NSInteger)logs;
+ (BOOL)photoBrowserPlaceholderimageforindexLogs:(NSInteger)logs;
+ (BOOL)lineCilicActionLogs:(NSInteger)logs;
+ (BOOL)clickLinkPressLogs:(NSInteger)logs;
+ (BOOL)copyContentPressLogs:(NSInteger)logs;
+ (BOOL)getBuzhouLabelSizeLogs:(NSInteger)logs;
+ (BOOL)getBuZhouStrLogs:(NSInteger)logs;
+ (BOOL)sharePressLogs:(NSInteger)logs;
+ (BOOL)taskButtonPressLogs:(NSInteger)logs;
+ (BOOL)refreshContentLogs:(NSInteger)logs;

@end
