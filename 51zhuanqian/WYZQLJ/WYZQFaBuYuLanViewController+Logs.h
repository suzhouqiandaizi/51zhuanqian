#import <UIKit/UIKit.h>
#import "WYZQFaBuYuLanViewController.h"
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

@interface WYZQFaBuYuLanViewController (Logs)
+ (BOOL)viewDidLoadLogs:(NSInteger)logs;
+ (BOOL)editPressLogs:(NSInteger)logs;
+ (BOOL)agreePressLogs:(NSInteger)logs;
+ (BOOL)surePressLogs:(NSInteger)logs;
+ (BOOL)showContentLogs:(NSInteger)logs;
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

@end
