#import <UIKit/UIKit.h>
#import "BWRZQTaskObject.h"
#import "BWRZQTaskDoingShowSubmitTaskViewController.h"
#import "GlobalFunction.h"
#import "BWRZQPersonViewController.h"
#import "BWRZQUploadImageView.h"
#import "MIPhotoBrowser.h"
#import "BWRZQSubmitAlertView.h"
#import "BWRZQSubmitSuccessInfoView.h"
#import "MBProgressHUD.h"

@interface BWRZQTaskDoingShowSubmitTaskViewController (Logs)
+ (BOOL)viewDidLoadLogs:(NSInteger)logs;
+ (BOOL)showContentLogs:(NSInteger)logs;
+ (BOOL)deallocLogs:(NSInteger)logs;
+ (BOOL)requirementTapActionLogs:(NSInteger)logs;
+ (BOOL)submitTapActionLogs:(NSInteger)logs;
+ (BOOL)photoBrowserPlaceholderimageforindexLogs:(NSInteger)logs;
+ (BOOL)pushImageLogs:(NSInteger)logs;

@end
