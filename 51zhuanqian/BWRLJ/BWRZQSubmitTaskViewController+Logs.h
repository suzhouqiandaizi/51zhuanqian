#import <UIKit/UIKit.h>
#import "BWRZQTaskObject.h"
#import "BWRZQSubmitTaskViewController.h"
#import "GlobalFunction.h"
#import "BWRZQPersonViewController.h"
#import "BWRZQUploadImageView.h"
#import "MIPhotoBrowser.h"
#import "BWRZQSubmitAlertView.h"
#import "BWRZQSubmitSuccessInfoView.h"
#import "MBProgressHUD.h"

@interface BWRZQSubmitTaskViewController (Logs)
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
