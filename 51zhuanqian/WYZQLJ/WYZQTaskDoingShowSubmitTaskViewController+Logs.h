#import <UIKit/UIKit.h>
#import "WYZQTaskObject.h"
#import "WYZQTaskDoingShowSubmitTaskViewController.h"
#import "GlobalFunction.h"
#import "WYZQPersonViewController.h"
#import "WYZQUploadImageView.h"
#import "MIPhotoBrowser.h"
#import "WYZQSubmitAlertView.h"
#import "WYZQSubmitSuccessInfoView.h"
#import "MBProgressHUD.h"

@interface WYZQTaskDoingShowSubmitTaskViewController (Logs)
+ (BOOL)viewDidLoadLogs:(NSInteger)logs;
+ (BOOL)showContentLogs:(NSInteger)logs;
+ (BOOL)deallocLogs:(NSInteger)logs;
+ (BOOL)requirementTapActionLogs:(NSInteger)logs;
+ (BOOL)submitTapActionLogs:(NSInteger)logs;
+ (BOOL)photoBrowserPlaceholderimageforindexLogs:(NSInteger)logs;
+ (BOOL)pushImageLogs:(NSInteger)logs;

@end
