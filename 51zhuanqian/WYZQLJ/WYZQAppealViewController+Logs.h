#import <UIKit/UIKit.h>
#import "WYZQAppealViewController.h"
#import "GlobalFunction.h"
#import "WYZQUploadImageView.h"
#import "MIPhotoBrowser.h"
#import "MBProgressHUD.h"

@interface WYZQAppealViewController (Logs)
+ (BOOL)viewDidLoadLogs:(NSInteger)logs;
+ (BOOL)deallocLogs:(NSInteger)logs;
+ (BOOL)surePressLogs:(NSInteger)logs;
+ (BOOL)addUploadImageViewLogs:(NSInteger)logs;
+ (BOOL)removeUploadImageViewLogs:(NSInteger)logs;
+ (BOOL)textViewDidBeginEditingLogs:(NSInteger)logs;
+ (BOOL)textViewDidEndEditingLogs:(NSInteger)logs;
+ (BOOL)textViewShouldchangetextinrangeReplacementtextLogs:(NSInteger)logs;
+ (BOOL)textViewDidChangeLogs:(NSInteger)logs;
+ (BOOL)scrollViewWillBeginDraggingLogs:(NSInteger)logs;
+ (BOOL)pushImageLogs:(NSInteger)logs;

@end
