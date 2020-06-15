#import <UIKit/UIKit.h>
#import "WYZQPersonInfoViewController.h"
#import "MBProgressHUD.h"
#import "GlobalFunction.h"
#import "WYZQPersonEditViewController.h"

@interface WYZQPersonInfoViewController (Logs)
+ (BOOL)viewDidLoadLogs:(NSInteger)logs;
+ (BOOL)deallocLogs:(NSInteger)logs;
+ (BOOL)touxiangPressLogs:(NSInteger)logs;
+ (BOOL)namePressLogs:(NSInteger)logs;
+ (BOOL)actionSheetClickedbuttonatindexLogs:(NSInteger)logs;
+ (BOOL)changeHeadPortraitCameraLogs:(NSInteger)logs;
+ (BOOL)changeHeadPortraitFromPictureLogs:(NSInteger)logs;
+ (BOOL)addImagePickerControllerLogs:(NSInteger)logs;
+ (BOOL)imagePickerControllerDidfinishpickingmediawithinfoLogs:(NSInteger)logs;
+ (BOOL)imagePickerControllerDidCancelLogs:(NSInteger)logs;

@end
