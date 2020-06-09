#import <UIKit/UIKit.h>
#import "BWRZQFaBuYuLanViewController.h"
#import "ShareView.h"
#import "GlobalFunction.h"
#import "MIPhotoBrowser.h"
#import "BWRZQTaskButton.h"
#import "BWRZQSubmitTaskViewController.h"
#import "BWRZQFriendDetailViewController.h"
#import "BWRZQTaskObject.h"
#import "BWRZQReportViewController.h"
#import "UIActionSheet+Blocks.h"
#import "WZYLabel.h"
#import "LoadConfig.h"
#import "BWRZQFaBuBuZhouObject.h"
#import "UILabel+YBAttributeTextTapAction.h"
#import "BWRZQFaBuSuccessViewController.h"

@interface BWRZQFaBuYuLanViewController (Logs)
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
