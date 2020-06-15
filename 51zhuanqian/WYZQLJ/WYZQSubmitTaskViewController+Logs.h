#import <UIKit/UIKit.h>
#import "WYZQTaskObject.h"
#import "WYZQSubmitTaskViewController.h"
#import "GlobalFunction.h"
#import "WYZQPersonViewController.h"
#import "WYZQUploadImageView.h"
#import "MIPhotoBrowser.h"
#import "WYZQSubmitAlertView.h"
#import "WYZQSubmitSuccessInfoView.h"
#import "MBProgressHUD.h"

@interface WYZQSubmitTaskViewController (Logs)
+ (BOOL)viewDidLoadLogs:(NSInteger)logs;
+ (BOOL)showContentLogs:(NSInteger)logs;
+ (BOOL)deallocLogs:(NSInteger)logs;
+ (BOOL)addUploadImageViewLogs:(NSInteger)logs;
+ (BOOL)removeUploadImageViewLogs:(NSInteger)logs;
+ (BOOL)textViewDidBeginEditingLogs:(NSInteger)logs;
+ (BOOL)textViewDidEndEditingLogs:(NSInteger)logs;
+ (BOOL)textViewShouldchangetextinrangeReplacementtextLogs:(NSInteger)logs;
+ (BOOL)textViewDidChangeLogs:(NSInteger)logs;
+ (BOOL)surePressLogs:(NSInteger)logs;
+ (BOOL)scrollViewWillBeginDraggingLogs:(NSInteger)logs;
+ (BOOL)requirementTapActionLogs:(NSInteger)logs;
+ (BOOL)photoBrowserPlaceholderimageforindexLogs:(NSInteger)logs;
+ (BOOL)pushImageLogs:(NSInteger)logs;

@end
