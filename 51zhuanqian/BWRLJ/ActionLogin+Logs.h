#import <Foundation/Foundation.h>
#import "ActionLogin.h"
#import "BWRZQLoginViewController.h"
#import "AppDelegate.h"
#import "CustomIOSAlertView.h"
#import "CustomInfoAlertView.h"
#import "LoadConfig.h"

@interface ActionLogin (Logs)
+ (BOOL)shareActionLoginLogs:(NSInteger)logs;
+ (BOOL)alertActionLoginWithviewcontrollerHandleLogs:(NSInteger)logs;

@end
